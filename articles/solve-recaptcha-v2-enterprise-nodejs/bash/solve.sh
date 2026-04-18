#!/usr/bin/env bash
# Solve reCAPTCHA v2 Enterprise using the CaptchaAI API.
#
# Usage:
#   chmod +x solve.sh
#   ./solve.sh
#
# Requires .env file in parent directory with:
#   CAPTCHAAI_API_KEY and CAPTCHA-specific variables
#
# Dependencies: curl, jq

set -euo pipefail

SUBMIT_URL="https://ocr.captchaai.com/in.php"
RESULT_URL="https://ocr.captchaai.com/res.php"

# Load .env file
ENV_FILE="$(dirname "$0")/../.env"
if [[ -f "$ENV_FILE" ]]; then
    while IFS='=' read -r key value; do
        key=$(echo "$key" | xargs)
        [[ -z "$key" || "$key" == \#* ]] && continue
        value=$(echo "$value" | xargs)
        export "$key=$value"
    done < "$ENV_FILE"
fi

CAPTCHAAI_API_KEY="${CAPTCHAAI_API_KEY:-}"
CAPTCHA_SITEKEY="${CAPTCHA_SITEKEY:-}"
CAPTCHA_PAGEURL="${CAPTCHA_PAGEURL:-}"
POLL_INTERVAL="${POLL_INTERVAL:-5}"
MAX_TIMEOUT="${MAX_TIMEOUT:-120}"

AUTH_ERRORS="ERROR_WRONG_USER_KEY ERROR_KEY_DOES_NOT_EXIST IP_BANNED"
BALANCE_ERRORS="ERROR_ZERO_BALANCE"
INPUT_ERRORS="ERROR_PAGEURL ERROR_WRONG_GOOGLEKEY ERROR_BAD_PARAMETERS ERROR_BAD_TOKEN_OR_PAGEURL"
TRANSIENT_ERRORS="ERROR_SERVER_ERROR ERROR_INTERNAL_SERVER_ERROR"
SOLVE_ERRORS="ERROR_CAPTCHA_UNSOLVABLE"
PROXY_ERRORS="ERROR_BAD_PROXY ERROR_PROXY_CONNECTION_FAILED"

contains() { [[ " $1 " == *" $2 "* ]]; }

classify_error() {
    local error="$1"
    if contains "$AUTH_ERRORS" "$error"; then
        echo "[!] Authentication error: $error"
        echo "    Check your API key at https://captchaai.com/dashboard"
    elif contains "$BALANCE_ERRORS" "$error"; then
        echo "[!] Balance error: $error"
        echo "    Top up your account at https://captchaai.com"
    elif contains "$INPUT_ERRORS" "$error"; then
        echo "[!] Input error: $error"
        echo "    Verify your sitekey and page URL are correct."
    elif contains "$PROXY_ERRORS" "$error"; then
        echo "[!] Proxy error: $error"
        echo "    Check your proxy configuration or try a different proxy."
    else
        echo "[!] Submission failed: $error"
    fi
}

# Validate
if [[ -z "$CAPTCHAAI_API_KEY" || "$CAPTCHAAI_API_KEY" == "YOUR_API_KEY" ]]; then
    echo "[!] ERROR: CAPTCHAAI_API_KEY is not set."
    echo "    Copy .env.example to .env and add your real API key."
    exit 1
fi

# Check dependencies
if ! command -v jq &> /dev/null; then
    echo "[!] ERROR: jq is required but not installed."
    echo "    Install it: apt-get install jq / brew install jq / choco install jq"
    exit 1
fi

# Submit
echo "[*] Submitting reCAPTCHA v2 Enterprise task..."
SUBMIT_RESPONSE=$(curl -s --max-time 30 \
    "${SUBMIT_URL}?key=${CAPTCHAAI_API_KEY}&method=userrecaptcha&googlekey=${CAPTCHA_SITEKEY}&pageurl=${CAPTCHA_PAGEURL}&enterprise=1&json=1")

if [[ -z "$SUBMIT_RESPONSE" ]]; then
    echo "[!] Network error during submission."
    exit 1
fi

SUBMIT_STATUS=$(echo "$SUBMIT_RESPONSE" | jq -r '.status // 0')
SUBMIT_REQUEST=$(echo "$SUBMIT_RESPONSE" | jq -r '.request // "UNKNOWN_ERROR"')

if [[ "$SUBMIT_STATUS" != "1" ]]; then
    classify_error "$SUBMIT_REQUEST"
    exit 1
fi

TASK_ID="$SUBMIT_REQUEST"
echo "[+] Task submitted. ID: $TASK_ID"

# Poll
echo "[*] Waiting 15s before first poll..."
sleep 15

ELAPSED=15
ATTEMPT=0
BACKOFF=$POLL_INTERVAL

while [[ $ELAPSED -lt $MAX_TIMEOUT ]]; do
    ATTEMPT=$((ATTEMPT + 1))
    echo "[*] Polling for result (attempt $ATTEMPT)..."

    POLL_RESPONSE=$(curl -s --max-time 30 \
        "${RESULT_URL}?key=${CAPTCHAAI_API_KEY}&action=get&id=${TASK_ID}&json=1" 2>/dev/null || echo "")

    if [[ -z "$POLL_RESPONSE" ]]; then
        echo "[!] Network error during polling."
        sleep "$BACKOFF"
        ELAPSED=$((ELAPSED + BACKOFF))
        BACKOFF=$((BACKOFF * 2))
        [[ $BACKOFF -gt 30 ]] && BACKOFF=30
        continue
    fi

    POLL_STATUS=$(echo "$POLL_RESPONSE" | jq -r '.status // 0')
    POLL_REQUEST=$(echo "$POLL_RESPONSE" | jq -r '.request // ""')

    if [[ "$POLL_STATUS" == "1" ]]; then
        TOKEN="$POLL_REQUEST"
        TRUNCATED="${TOKEN:0:50}"
        echo "[+] Solved! Token: ${TRUNCATED}..."
        echo "[+] Full token length: ${#TOKEN} characters"
        exit 0
    fi

    if [[ "$POLL_REQUEST" == "CAPCHA_NOT_READY" ]]; then
        echo "[*] Not ready yet, waiting ${POLL_INTERVAL}s..."
        sleep "$POLL_INTERVAL"
        ELAPSED=$((ELAPSED + POLL_INTERVAL))
        BACKOFF=$POLL_INTERVAL
        continue
    fi
    if contains "$TRANSIENT_ERRORS" "$POLL_REQUEST"; then
        echo "[!] Transient error: $POLL_REQUEST, retrying in ${BACKOFF}s..."
        sleep "$BACKOFF"
        ELAPSED=$((ELAPSED + BACKOFF))
        BACKOFF=$((BACKOFF * 2))
        [[ $BACKOFF -gt 30 ]] && BACKOFF=30
        continue
    fi
    if contains "$SOLVE_ERRORS" "$POLL_REQUEST"; then
        echo "[!] Solve error: $POLL_REQUEST"
        echo "    The CAPTCHA could not be solved. Verify parameters and retry."
        exit 1
    fi
    if contains "$PROXY_ERRORS" "$POLL_REQUEST"; then
        echo "[!] Proxy error: $POLL_REQUEST"
        echo "    Check your proxy configuration or try a different proxy."
        exit 1
    fi

    echo "[!] Unexpected error: $POLL_REQUEST"
    exit 1
done

echo "[!] Timeout: no solution received within ${MAX_TIMEOUT} seconds."
exit 1
