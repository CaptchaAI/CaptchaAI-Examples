# Solve reCAPTCHA v2 Enterprise using the CaptchaAI API.
#
# Usage:
#   ruby solve.rb
#
# Requires .env file in parent directory with:
#   CAPTCHAAI_API_KEY and CAPTCHA-specific variables

require "net/http"
require "uri"
require "json"

SUBMIT_URL = "https://ocr.captchaai.com/in.php"
RESULT_URL = "https://ocr.captchaai.com/res.php"

AUTH_ERRORS = %w[ERROR_WRONG_USER_KEY ERROR_KEY_DOES_NOT_EXIST IP_BANNED].freeze
BALANCE_ERRORS = %w[ERROR_ZERO_BALANCE].freeze
INPUT_ERRORS = %w[ERROR_PAGEURL ERROR_WRONG_GOOGLEKEY ERROR_BAD_PARAMETERS ERROR_BAD_TOKEN_OR_PAGEURL].freeze
TRANSIENT_ERRORS = %w[ERROR_SERVER_ERROR ERROR_INTERNAL_SERVER_ERROR].freeze
SOLVE_ERRORS = %w[ERROR_CAPTCHA_UNSOLVABLE].freeze
PROXY_ERRORS = %w[ERROR_BAD_PROXY ERROR_PROXY_CONNECTION_FAILED].freeze

def load_env(path)
  env = {}
  return env unless File.exist?(path)

  File.readlines(path).each do |line|
    line = line.strip
    next if line.empty? || line.start_with?("#")
    key, value = line.split("=", 2)
    env[key.strip] = value&.strip || ""
  end
  env
end

def get_env(env, key, fallback = "")
  val = env[key]
  return val if val && !val.empty?
  sys_val = ENV[key]
  return sys_val if sys_val && !sys_val.empty?
  fallback
end

env = load_env(File.join(__dir__, "..", ".env"))

API_KEY = get_env(env, "CAPTCHAAI_API_KEY")
GOOGLEKEY = get_env(env, "CAPTCHA_SITEKEY")
PAGEURL = get_env(env, "CAPTCHA_PAGEURL")
POLL_INTERVAL = get_env(env, "POLL_INTERVAL", "5").to_i
MAX_TIMEOUT = get_env(env, "MAX_TIMEOUT", "120").to_i

def classify_error(error)
  if AUTH_ERRORS.include?(error)
    puts "[!] Authentication error: #{error}"
    puts "    Check your API key at https://captchaai.com/dashboard"
  elsif BALANCE_ERRORS.include?(error)
    puts "[!] Balance error: #{error}"
    puts "    Top up your account at https://captchaai.com"
  elsif INPUT_ERRORS.include?(error)
    puts "[!] Input error: #{error}"
    puts "    Verify your sitekey and page URL are correct."
  elsif PROXY_ERRORS.include?(error)
    puts "[!] Proxy error: #{error}"
    puts "    Check your proxy configuration or try a different proxy."
  else
    puts "[!] Submission failed: #{error}"
  end
end

# Validate
if API_KEY.empty? || API_KEY == "YOUR_API_KEY"
  puts "[!] ERROR: CAPTCHAAI_API_KEY is not set."
  puts "    Copy .env.example to .env and add your real API key."
  exit(1)
end

# Submit
puts "[*] Submitting reCAPTCHA v2 Enterprise task..."
submit_uri = URI.parse(SUBMIT_URL)
submit_uri.query = URI.encode_www_form(
  key: API_KEY,
  method: "userrecaptcha",
  googlekey: GOOGLEKEY,
  pageurl: PAGEURL,
  enterprise: "1",
  json: "1"
)

begin
  response = Net::HTTP.get_response(submit_uri)
  data = JSON.parse(response.body)
rescue StandardError => e
  puts "[!] Network error during submission: #{e.message}"
  exit(1)
end

if data["status"] != 1
  classify_error(data["request"] || "UNKNOWN_ERROR")
  exit(1)
end

task_id = data["request"]
puts "[+] Task submitted. ID: #{task_id}"

# Poll
puts "[*] Waiting 15s before first poll..."
sleep(15)

elapsed = 15
attempt = 0
backoff = POLL_INTERVAL

while elapsed < MAX_TIMEOUT
  attempt += 1
  puts "[*] Polling for result (attempt #{attempt})..."

  poll_uri = URI.parse(RESULT_URL)
  poll_uri.query = URI.encode_www_form(key: API_KEY, action: "get", id: task_id, json: "1")

  begin
    response = Net::HTTP.get_response(poll_uri)
    result = JSON.parse(response.body)
  rescue StandardError => e
    puts "[!] Network error during polling: #{e.message}"
    sleep(backoff)
    elapsed += backoff
    backoff = [backoff * 2, 30].min
    next
  end

  if result["status"] == 1
    token = result["request"]
    puts "[+] Solved! Token: #{token[0, 50]}..."
    puts "[+] Full token length: #{token.length} characters"
    exit(0)
  end

  error = result["request"] || ""
  if error == "CAPCHA_NOT_READY"
    puts "[*] Not ready yet, waiting #{POLL_INTERVAL}s..."
    sleep(POLL_INTERVAL)
    elapsed += POLL_INTERVAL
    backoff = POLL_INTERVAL
    next
  end
  if TRANSIENT_ERRORS.include?(error)
    puts "[!] Transient error: #{error}, retrying in #{backoff}s..."
    sleep(backoff)
    elapsed += backoff
    backoff = [backoff * 2, 30].min
    next
  end
  if SOLVE_ERRORS.include?(error)
    puts "[!] Solve error: #{error}"
    puts "    The CAPTCHA could not be solved. Verify parameters and retry."
    exit(1)
  end
  if PROXY_ERRORS.include?(error)
    puts "[!] Proxy error: #{error}"
    puts "    Check your proxy configuration or try a different proxy."
    exit(1)
  end

  puts "[!] Unexpected error: #{error}"
  exit(1)
end

puts "[!] Timeout: no solution received within #{MAX_TIMEOUT} seconds."
exit(1)
