#!/usr/bin/env bash
# Solve Image CAPTCHA using the CaptchaAI API.
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
IMAGE_FILE="${CAPTCHA_IMAGE_FILE:-captcha.png}"
POLL_INTERVAL="${POLL_INTERVAL:-5}"
MAX_TIMEOUT="${MAX_TIMEOUT:-120}"

# Validate
if [[ -z "$API_KEY" || "$API_KEY" == "YOUR_API_KEY" ]]; then
  echo "[!] ERROR: CAPTCHAAI_API_KEY is not set."
  echo "    Copy .env.example to .env and add your real API key."
  exit 1
fi
if [[ -z "$IMAGE_FILE" ]]; then
  echo "[!] ERROR: CAPTCHA_IMAGE_FILE is not set."
  echo "    Set the path to the CAPTCHA image file in .env."
  exit 1
fi

# Resolve image path
IMAGE_PATH="$(dirname "$0")/../$IMAGE_FILE"
if [[ ! -f "$IMAGE_PATH" ]]; then
  IMAGE_PATH="$IMAGE_FILE"
fi
if [[ ! -f "$IMAGE_PATH" ]]; then
  echo "[!] ERROR: Image file not found: $IMAGE_FILE"
  echo "    Make sure the file exists and the path is correct."
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
    ERROR_PAGEURL|ERROR_WRONG_GOOGLEKEY|ERROR_BAD_PARAMETERS|ERROR_BAD_TOKEN_OR_PAGEURL|ERROR_WRONG_FILE_EXTENSION|ERROR_TOO_BIG_CAPTCHA_FILESIZE|ERROR_EMPTY_CAPTCHA)
      echo "[!] Input error: $error"
      echo "    Verify your image file is valid and not too large."
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

# Load image and base64-encode
echo "[*] Loading image from $IMAGE_FILE..."
IMAGE_B64=$(base64 -w 0 "$IMAGE_PATH" 2>/dev/null || base64 "$IMAGE_PATH" | tr -d '\n')

# Submit task via POST
echo "[*] Submitting Image CAPTCHA task..."
SUBMIT_RESP=$(curl -sS --max-time 30 \
  -X POST \
  -d "key=${API_KEY}" \
  -d "method=base64" \
  -d "body=${IMAGE_B64}" \
  -d "json=1" \
  "$SUBMIT_URL")

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
echo "[*] Waiting 10s before first poll..."
sleep 10

ELAPSED=10
ATTEMPT=0
BACKOFF="$POLL_INTERVAL"

ENCODED_KEY=$(python3 -c "import urllib.parse; print(urllib.parse.quote('$API_KEY'))" 2>/dev/null || echo "$API_KEY")

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
    TEXT=$(json_str "$POLL_RESP" "request")
    echo "[+] Solved! Text: $TEXT"
    echo
    echo "Next step: enter this text into the CAPTCHA input field"
    echo "on the target page and submit the form."
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
      echo "    The CAPTCHA could not be solved. Verify the image and retry."
      exit 1
      ;;
  esac

  echo "[!] Unexpected error: $REQUEST"
  exit 1
done

echo "[!] Timeout: no solution received within ${MAX_TIMEOUT} seconds."
exit 1
