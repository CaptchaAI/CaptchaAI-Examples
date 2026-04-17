#!/usr/bin/env bash
# Solve reCAPTCHA v3 Enterprise using the CaptchaAI API.
#
# Usage:
#   chmod +x solve.sh
#   bash solve.sh

set -euo pipefail

SUBMIT_URL="https://ocr.captchaai.com/in.php"
RESULT_URL="https://ocr.captchaai.com/res.php"

# Load .env
ENV_FILE="$(dirname "$0")/../.env"
if [[ -f "$ENV_FILE" ]]; then
  set -a
  # shellcheck disable=SC1090
  source "$ENV_FILE"
  set +a
fi

API_KEY="${CAPTCHAAI_API_KEY:-}"
SITEKEY="${CAPTCHA_SITEKEY:-}"
PAGEURL="${CAPTCHA_PAGEURL:-}"
CAPTCHA_ACTION="${CAPTCHA_ACTION:-verify}"
CAPTCHA_MIN_SCORE="${CAPTCHA_MIN_SCORE:-0.3}"
CAPTCHA_DATA_S="${CAPTCHA_DATA_S:-}"
POLL_INTERVAL="${POLL_INTERVAL:-5}"
MAX_TIMEOUT="${MAX_TIMEOUT:-120}"

# Validate
if [[ -z "$API_KEY" || "$API_KEY" == "YOUR_API_KEY" ]]; then
  echo "[!] ERROR: CAPTCHAAI_API_KEY is not set."
  echo "    Copy .env.example to .env and add your real API key."
  exit 1
fi
if [[ -z "$SITEKEY" || "$SITEKEY" == "YOUR_SITE_KEY" ]]; then
  echo "[!] ERROR: CAPTCHA_SITEKEY is not set."
  echo "    Add the reCAPTCHA v3 Enterprise sitekey from your target page to .env"
  exit 1
fi
if [[ -z "$PAGEURL" || "$PAGEURL" == "https://example.com/login" ]]; then
  echo "[!] WARNING: CAPTCHA_PAGEURL may not be set correctly."
  echo "    Make sure it points to the actual target page."
fi

# JSON helpers
json_str() {
  local json="$1" key="$2"
  echo "$json" | grep -oP "\"${key}\":\s*\"\\K[^\"]*" || echo ""
}
json_int() {
  local json="$1" key="$2"
  echo "$json" | grep -oP "\"${key}\":\s*\\K[0-9]+" || echo "0"
}

# Error handler
handle_error() {
  local error="$1"
  case "$error" in
    ERROR_WRONG_USER_KEY|ERROR_KEY_DOES_NOT_EXIST|IP_BANNED)
      echo "[!] Authentication error: $error"
      echo "    Check your API key at https://captchaai.com/dashboard"
      ;;
    ERROR_ZERO_BALANCE)
      echo "[!] Balance error: $error"
      echo "    Top up your account at https://captchaai.com"
      ;;
    ERROR_PAGEURL|ERROR_WRONG_GOOGLEKEY|ERROR_BAD_PARAMETERS|ERROR_BAD_TOKEN_OR_PAGEURL)
      echo "[!] Input error: $error"
      echo "    Verify your sitekey and page URL are correct."
      ;;
    ERROR_BAD_PROXY|ERROR_PROXY_CONNECTION_FAILED)
      echo "[!] Proxy error: $error"
      echo "    Check your proxy configuration or try a different proxy."
      ;;
    *)
      echo "[!] Submission failed: $error"
      ;;
  esac
}

# Submit task
echo "[*] Submitting reCAPTCHA v3 Enterprise task..."
ENCODED_KEY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$API_KEY'))" 2>/dev/null || echo "$API_KEY")
ENCODED_SITEKEY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$SITEKEY'))" 2>/dev/null || echo "$SITEKEY")
ENCODED_PAGEURL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$PAGEURL'))" 2>/dev/null || echo "$PAGEURL")
ENCODED_ACTION=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$CAPTCHA_ACTION'))" 2>/dev/null || echo "$CAPTCHA_ACTION")
ENCODED_MIN_SCORE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$CAPTCHA_MIN_SCORE'))" 2>/dev/null || echo "$CAPTCHA_MIN_SCORE")

SUBMIT_QUERY="${SUBMIT_URL}?key=${ENCODED_KEY}&method=userrecaptcha&googlekey=${ENCODED_SITEKEY}&pageurl=${ENCODED_PAGEURL}&enterprise=1&version=v3&action=${ENCODED_ACTION}&min_score=${ENCODED_MIN_SCORE}&json=1"

if [[ -n "$CAPTCHA_DATA_S" ]]; then
  ENCODED_DATA_S=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$CAPTCHA_DATA_S'))" 2>/dev/null || echo "$CAPTCHA_DATA_S")
  SUBMIT_QUERY="${SUBMIT_QUERY}&data-s=${ENCODED_DATA_S}"
fi

SUBMIT_RESP=$(curl -sS --max-time 30 "$SUBMIT_QUERY")

if [[ -z "$SUBMIT_RESP" ]]; then
  echo "[!] Network error during submission."
  exit 1
fi

SUBMIT_STATUS=$(json_int "$SUBMIT_RESP" "status")
SUBMIT_REQUEST=$(json_str "$SUBMIT_RESP" "request")

if [[ "$SUBMIT_STATUS" -ne 1 ]]; then
  handle_error "$SUBMIT_REQUEST"
  exit 1
fi

TASK_ID="$SUBMIT_REQUEST"
echo "[+] Task submitted. ID: $TASK_ID"

# Poll for result
echo "[*] Waiting 15s before first poll..."
sleep 15

ELAPSED=15
ATTEMPT=0
BACKOFF="$POLL_INTERVAL"

while [[ "$ELAPSED" -lt "$MAX_TIMEOUT" ]]; do
  ATTEMPT=$((ATTEMPT + 1))
  echo "[*] Polling for result (attempt $ATTEMPT)..."

  POLL_RESP=$(curl -sS --max-time 30 \
    "${RESULT_URL}?key=${ENCODED_KEY}&action=get&id=${TASK_ID}&json=1" 2>/dev/null || echo "")

  if [[ -z "$POLL_RESP" ]]; then
    echo "[!] Network error during polling."
    sleep "$BACKOFF"
    ELAPSED=$((ELAPSED + BACKOFF))
    BACKOFF=$((BACKOFF * 2))
    [[ "$BACKOFF" -gt 30 ]] && BACKOFF=30
    continue
  fi

  STATUS=$(json_int "$POLL_RESP" "status")
  REQUEST=$(json_str "$POLL_RESP" "request")

  if [[ "$STATUS" -eq 1 ]]; then
    DISPLAY="${REQUEST:0:50}"
    echo "[+] Solved! Token: ${DISPLAY}..."
    echo "[+] Full token length: ${#REQUEST} characters"
    echo
    echo "Next step: inject this token into the target page's"
    echo "g-recaptcha-response hidden field and submit the form."
    exit 0
  fi

  if [[ "$REQUEST" == "CAPCHA_NOT_READY" ]]; then
    echo "[*] Not ready yet, waiting ${POLL_INTERVAL}s..."
    sleep "$POLL_INTERVAL"
    ELAPSED=$((ELAPSED + POLL_INTERVAL))
    BACKOFF="$POLL_INTERVAL"
    continue
  fi

  case "$REQUEST" in
    ERROR_SERVER_ERROR|ERROR_INTERNAL_SERVER_ERROR)
      echo "[!] Transient error: $REQUEST, retrying in ${BACKOFF}s..."
      sleep "$BACKOFF"
      ELAPSED=$((ELAPSED + BACKOFF))
      BACKOFF=$((BACKOFF * 2))
      [[ "$BACKOFF" -gt 30 ]] && BACKOFF=30
      continue
      ;;
    ERROR_CAPTCHA_UNSOLVABLE)
      echo "[!] Solve error: $REQUEST"
      echo "    The CAPTCHA could not be solved. Verify parameters and retry."
      exit 1
      ;;
  esac

  echo "[!] Unexpected error: $REQUEST"
  exit 1
done

echo "[!] Timeout: no solution received within ${MAX_TIMEOUT} seconds."
exit 1
