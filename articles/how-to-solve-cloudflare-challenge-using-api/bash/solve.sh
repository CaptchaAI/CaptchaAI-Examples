#!/usr/bin/env bash
# Solve Cloudflare Challenge using the CaptchaAI API.
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
PAGEURL="${CAPTCHA_PAGEURL:-}"
PROXY_VAL="${PROXY:-}"
PROXYTYPE_VAL="${PROXYTYPE:-HTTP}"
POLL_INTERVAL="${POLL_INTERVAL:-5}"
MAX_TIMEOUT="${MAX_TIMEOUT:-120}"

# Validate
if [[ -z "$API_KEY" || "$API_KEY" == "YOUR_API_KEY" ]]; then
  echo "[!] ERROR: CAPTCHAAI_API_KEY is not set."
  echo "    Copy .env.example to .env and add your real API key."
  exit 1
fi
if [[ -z "$PAGEURL" || "$PAGEURL" == "https://example.com" ]]; then
  echo "[!] WARNING: CAPTCHA_PAGEURL may not be set correctly."
  echo "    Make sure it points to the actual target page."
fi
if [[ -z "$PROXY_VAL" || "$PROXY_VAL" == "login:password@ip:port" ]]; then
  echo "[!] ERROR: PROXY is not set."
  echo "    A proxy is required for Cloudflare Challenge."
  echo "    Set PROXY=login:password@ip:port in your .env file."
  exit 1
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
    ERROR_PAGEURL|ERROR_BAD_PARAMETERS|ERROR_BAD_TOKEN_OR_PAGEURL)
      echo "[!] Input error: $error"
      echo "    Verify your page URL is correct."
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
echo "[*] Submitting Cloudflare Challenge task..."
ENCODED_KEY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$API_KEY'))" 2>/dev/null || echo "$API_KEY")
ENCODED_PAGEURL=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$PAGEURL'))" 2>/dev/null || echo "$PAGEURL")
ENCODED_PROXY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$PROXY_VAL'))" 2>/dev/null || echo "$PROXY_VAL")
ENCODED_PROXYTYPE=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$PROXYTYPE_VAL'))" 2>/dev/null || echo "$PROXYTYPE_VAL")

SUBMIT_RESP=$(curl -sS --max-time 30 \
  "${SUBMIT_URL}?key=${ENCODED_KEY}&method=cloudflare_challenge&pageurl=${ENCODED_PAGEURL}&proxy=${ENCODED_PROXY}&proxytype=${ENCODED_PROXYTYPE}&json=1")

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
echo "[*] Waiting 20s before first poll..."
sleep 20

ELAPSED=20
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
    USER_AGENT=$(json_str "$POLL_RESP" "user_agent")
    echo "[+] Solved!"
    echo "[+] cf_clearance cookie: ${REQUEST}"
    echo "[+] User-Agent: ${USER_AGENT}"
    echo
    echo "Next step: set the cf_clearance cookie and User-Agent header"
    echo "on all subsequent requests, using the same proxy IP."
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

echo "[!] Timeout: no solution received within $MAX_TIMEOUT seconds."
exit 1
