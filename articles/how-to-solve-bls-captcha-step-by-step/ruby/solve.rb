# Solve BLS CAPTCHA using the CaptchaAI API.
#
# Usage:
#   ruby solve.rb

require "net/http"
require "json"
require "uri"
require "base64"

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
  v = env[key]
  return v if v && !v.empty?
  v = ENV[key]
  return v if v && !v.empty?
  fallback
end

env = load_env(File.join(__dir__, "..", ".env"))
api_key = get_env(env, "CAPTCHAAI_API_KEY")
image_file = get_env(env, "CAPTCHA_IMAGE_FILE")
instructions = get_env(env, "CAPTCHA_INSTRUCTIONS")
poll_interval = get_env(env, "POLL_INTERVAL", "5").to_i
max_timeout = get_env(env, "MAX_TIMEOUT", "120").to_i

# Validate
if api_key.empty? || api_key == "YOUR_API_KEY"
  puts "[!] ERROR: CAPTCHAAI_API_KEY is not set."
  puts "    Copy .env.example to .env and add your real API key."
  exit 1
end
if image_file.empty?
  puts "[!] ERROR: CAPTCHA_IMAGE_FILE is not set."
  puts "    Set the path to the CAPTCHA image file in .env."
  exit 1
end

def resolve_image_path(image_file)
  parent_path = File.join(__dir__, "..", image_file)
  return parent_path if File.exist?(parent_path)
  image_file
end

image_path = resolve_image_path(image_file)
unless File.exist?(image_path)
  puts "[!] ERROR: Image file not found: #{image_file}"
  puts "    Make sure the file exists and the path is correct."
  exit 1
end
if instructions.empty?
  puts "[!] ERROR: CAPTCHA_INSTRUCTIONS is not set."
  puts "    Provide text instructions (e.g. 'Select all images with a car')."
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
    puts "    Verify your image and instructions are correct."
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

# Load image and base64-encode
puts "[*] Loading image from #{image_file}..."
image_data = File.binread(image_path)
image_b64 = Base64.strict_encode64(image_data)

# Submit task via POST
puts "[*] Submitting BLS CAPTCHA task..."
uri = URI(SUBMIT_URL)
http = Net::HTTP.new(uri.host, uri.port)
http.use_ssl = true
http.open_timeout = 30
http.read_timeout = 30

post_data = URI.encode_www_form(
  key: api_key,
  method: "bls",
  body: image_b64,
  textinstructions: instructions,
  json: "1"
)

begin
  request = Net::HTTP::Post.new(uri.path)
  request["Content-Type"] = "application/x-www-form-urlencoded"
  request.body = post_data
  response = http.request(request)
  submit_data = JSON.parse(response.body)
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
puts "[*] Waiting 15s before first poll..."
sleep 15

elapsed = 15
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
    answer = result_data["request"]
    puts "[+] Solved! Answer: #{answer}"
    puts
    puts "Next step: use these selected indices to click the"
    puts "corresponding images on the target page and submit."
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
