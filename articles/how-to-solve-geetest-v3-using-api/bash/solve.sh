#!/usr/bin/env bash
# Solve GeeTest v3 using the CaptchaAI API.
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
GT="${CAPTCHA_GT:-}"
CHALLENGE="${CAPTCHA_CHALLENGE:-}"
PAGEURL="${CAPTCHA_PAGEURL:-}"
API_SERVER="${CAPTCHA_API_SERVER:-}"
POLL_INTERVAL="${POLL_INTERVAL:-5}"
MAX_TIMEOUT="${MAX_TIMEOUT:-120}"

# Validate
if [[ -z "$API_KEY" || "$API_KEY" == "YOUR_API_KEY" ]]; then
  echo "[!] ERROR: CAPTCHAAI_API_KEY is not set."
  echo "    Copy .env.example to .env and add your real API key."
  exit 1
fi
if [[ -z "$GT" || "$GT" == "YOUR_GT_VALUE" ]]; then
  echo "[!] ERROR: CAPTCHA_GT is not set."
  echo "    Find the gt value in the page source or GeeTest initialization call."
  exit 1
fi
if [[ -z "$CHALLENGE" || "$CHALLENGE" == "YOUR_CHALLENGE_VALUE" ]]; then
  echo "[!] ERROR: CAPTCHA_CHALLENGE is not set."
  echo "    The challenge token must be fresh — fetch a new one for each solve attempt."
  exit 1
fi
if [[ -z "$PAGEURL" || "$PAGEURL" == "https://example.com" ]]; then
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
      echo "    Verify your gt, challenge, and page URL are correct."
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
echo "[*] Submitting GeeTest v3 task..."
ENCODED_KEY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$API_KEY'))" 2>/dev/null || echo "$API_KEY")
ENCODED_GT=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$GT'))" 2>/dev/null || echo "$GT")
ENCODED_CHALLENGE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$CHALLENGE'))" 2>/dev/null || echo "$CHALLENGE")
ENCODED_PAGEURL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$PAGEURL'))" 2>/dev/null || echo "$PAGEURL")

SUBMIT_QUERY="key=${ENCODED_KEY}&method=geetest&gt=${ENCODED_GT}&challenge=${ENCODED_CHALLENGE}&pageurl=${ENCODED_PAGEURL}&json=1"
if [[ -n "$API_SERVER" ]]; then
  ENCODED_API_SERVER=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$API_SERVER'))" 2>/dev/null || echo "$API_SERVER")
  SUBMIT_QUERY="${SUBMIT_QUERY}&api_server=${ENCODED_API_SERVER}"
fi

SUBMIT_RESP=$(curl -sS --max-time 30 "${SUBMIT_URL}?${SUBMIT_QUERY}")

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

  if [[ "$STATUS" -eq 1 ]]; then
    # Extract the 3 GeeTest values from the response
    # The request field contains a JSON object with geetest_challenge, geetest_validate, geetest_seccode
    GEETEST_CHALLENGE=$(echo "$POLL_RESP" | grep -oP '"geetest_challenge"\s*:\s*"\\K[^"]*' || echo "")
    GEETEST_VALIDATE=$(echo "$POLL_RESP" | grep -oP '"geetest_validate"\s*:\s*"\\K[^"]*' || echo "")
    GEETEST_SECCODE=$(echo "$POLL_RESP" | grep -oP '"geetest_seccode"\s*:\s*"\\K[^"]*' || echo "")

    # If values are empty, the request might be a JSON string — try extracting from unescaped content
    if [[ -z "$GEETEST_CHALLENGE" ]]; then
      REQUEST_VALUE=$(json_str "$POLL_RESP" "request")
      # Unescape the JSON string and extract values
      UNESCAPED=$(echo "$REQUEST_VALUE" | sed 's/\\"/"/g; s/\\\\/\\/g')
      GEETEST_CHALLENGE=$(echo "$UNESCAPED" | grep -oP '"geetest_challenge"\s*:\s*"\\K[^"]*' || echo "")
      GEETEST_VALIDATE=$(echo "$UNESCAPED" | grep -oP '"geetest_validate"\s*:\s*"\\K[^"]*' || echo "")
      GEETEST_SECCODE=$(echo "$UNESCAPED" | grep -oP '"geetest_seccode"\s*:\s*"\\K[^"]*' || echo "")
    fi

    echo "[+] Solved!"
    echo "[+] geetest_challenge: $GEETEST_CHALLENGE"
    echo "[+] geetest_validate: $GEETEST_VALIDATE"
    echo "[+] geetest_seccode: $GEETEST_SECCODE"
    echo
    echo "Next step: submit these three values to the site's"
    echo "GeeTest verification endpoint."
    exit 0
  fi

  REQUEST=$(json_str "$POLL_RESP" "request")

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

echo "[!] Timeout: no solution received within $MAX_TIMEOUT seconds."
exit 1
