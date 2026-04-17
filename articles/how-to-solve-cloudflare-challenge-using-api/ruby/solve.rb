# Solve Cloudflare Challenge using the CaptchaAI API.
#
# Usage:
#   ruby solve.rb

require "net/http"
require "json"
require "uri"

SUBMIT_URL = "https://ocr.captchaai.com/in.php"
RESULT_URL = "https://ocr.captchaai.com/res.php"

AUTH_ERRORS = %w[ERROR_WRONG_USER_KEY ERROR_KEY_DOES_NOT_EXIST IP_BANNED].freeze
BALANCE_ERRORS = %w[ERROR_ZERO_BALANCE].freeze
INPUT_ERRORS = %w[ERROR_PAGEURL ERROR_BAD_PARAMETERS ERROR_BAD_TOKEN_OR_PAGEURL].freeze
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
  v = env[key]
  return v if v && !v.empty?
  v = ENV[key]
  return v if v && !v.empty?
  fallback
end

env = load_env(File.join(__dir__, "..", ".env"))
api_key = get_env(env, "CAPTCHAAI_API_KEY")
pageurl = get_env(env, "CAPTCHA_PAGEURL")
proxy = get_env(env, "PROXY")
proxytype = get_env(env, "PROXYTYPE", "HTTP")
poll_interval = get_env(env, "POLL_INTERVAL", "5").to_i
max_timeout = get_env(env, "MAX_TIMEOUT", "120").to_i

# Validate
if api_key.empty? || api_key == "YOUR_API_KEY"
  puts "[!] ERROR: CAPTCHAAI_API_KEY is not set."
  puts "    Copy .env.example to .env and add your real API key."
  exit 1
end
if pageurl.empty? || pageurl == "https://example.com"
  puts "[!] WARNING: CAPTCHA_PAGEURL may not be set correctly."
  puts "    Make sure it points to the actual target page."
end
if proxy.empty? || proxy == "login:password@ip:port"
  puts "[!] ERROR: PROXY is not set."
  puts "    A proxy is required for Cloudflare Challenge."
  puts "    Set PROXY=login:password@ip:port in your .env file."
  exit 1
end

def handle_error(error)
  if AUTH_ERRORS.include?(error)
    puts "[!] Authentication error: #{error}"
    puts "    Check your API key at https://captchaai.com/dashboard"
  elsif BALANCE_ERRORS.include?(error)
    puts "[!] Balance error: #{error}"
    puts "    Top up your account at https://captchaai.com"
  elsif INPUT_ERRORS.include?(error)
    puts "[!] Input error: #{error}"
    puts "    Verify your page URL is correct."
  elsif PROXY_ERRORS.include?(error)
    puts "[!] Proxy error: #{error}"
    puts "    Check your proxy configuration or try a different proxy."
  else
    puts "[!] Submission failed: #{error}"
  end
end

def http_get(url_str)
  uri = URI(url_str)
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.open_timeout = 30
  http.read_timeout = 30
  response = http.get("#{uri.path}?#{uri.query}")
  JSON.parse(response.body)
end

# Submit task
puts "[*] Submitting Cloudflare Challenge task..."
params = URI.encode_www_form(
  key: api_key,
  method: "cloudflare_challenge",
  pageurl: pageurl,
  proxy: proxy,
  proxytype: proxytype,
  json: "1"
)

begin
  submit_data = http_get("#{SUBMIT_URL}?#{params}")
rescue StandardError => e
  puts "[!] Network error during submission: #{e.message}"
  exit 1
end

unless submit_data["status"] == 1
  handle_error(submit_data["request"] || "UNKNOWN_ERROR")
  exit 1
end

task_id = submit_data["request"]
puts "[+] Task submitted. ID: #{task_id}"

# Poll for result
puts "[*] Waiting 20s before first poll..."
sleep 20

elapsed = 20
attempt = 0
backoff = poll_interval

while elapsed < max_timeout
  attempt += 1
  puts "[*] Polling for result (attempt #{attempt})..."

  poll_params = URI.encode_www_form(
    key: api_key,
    action: "get",
    id: task_id,
    json: "1"
  )

  begin
    result_data = http_get("#{RESULT_URL}?#{poll_params}")
  rescue StandardError => e
    puts "[!] Network error during polling: #{e.message}"
    sleep backoff
    elapsed += backoff
    backoff = [backoff * 2, 30].min
    next
  end

  if result_data["status"] == 1
    cf_clearance = result_data["request"]
    user_agent = result_data["user_agent"] || ""
    puts "[+] Solved!"
    puts "[+] cf_clearance cookie: #{cf_clearance}"
    puts "[+] User-Agent: #{user_agent}"
    puts
    puts "Next step: set the cf_clearance cookie and User-Agent header"
    puts "on all subsequent requests, using the same proxy IP."
    exit 0
  end

  error = result_data["request"] || ""
  if error == "CAPCHA_NOT_READY"
    puts "[*] Not ready yet, waiting #{poll_interval}s..."
    sleep poll_interval
    elapsed += poll_interval
    backoff = poll_interval
    next
  end

  if TRANSIENT_ERRORS.include?(error)
    puts "[!] Transient error: #{error}, retrying in #{backoff}s..."
    sleep backoff
    elapsed += backoff
    backoff = [backoff * 2, 30].min
    next
  end

  if SOLVE_ERRORS.include?(error)
    puts "[!] Solve error: #{error}"
    puts "    The CAPTCHA could not be solved. Verify parameters and retry."
    exit 1
  end

  puts "[!] Unexpected error: #{error}"
  exit 1
end

puts "[!] Timeout: no solution received within #{max_timeout} seconds."
exit 1
