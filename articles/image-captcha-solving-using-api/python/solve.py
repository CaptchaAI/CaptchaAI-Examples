"""Solve Image CAPTCHA using the CaptchaAI API.

Usage:
    pip install -r requirements.txt
    cp ../.env.example ../.env   # then edit with your credentials
    python solve.py
"""

import os
import sys
import time
import base64

import requests
from dotenv import load_dotenv

# Load environment variables from the parent .env file
load_dotenv(dotenv_path=os.path.join(os.path.dirname(__file__), "..", ".env"))

SUBMIT_URL = "https://ocr.captchaai.com/in.php"
RESULT_URL = "https://ocr.captchaai.com/res.php"

API_KEY = os.getenv("CAPTCHAAI_API_KEY", "")
CAPTCHA_IMAGE_FILE = os.getenv("CAPTCHA_IMAGE_FILE", "captcha.png")
POLL_INTERVAL = int(os.getenv("POLL_INTERVAL", "5"))
MAX_TIMEOUT = int(os.getenv("MAX_TIMEOUT", "120"))

# --- Error categories ---
AUTH_ERRORS = {"ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED"}
BALANCE_ERRORS = {"ERROR_ZERO_BALANCE"}
INPUT_ERRORS = {
    "ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS",
    "ERROR_BAD_TOKEN_OR_PAGEURL", "ERROR_WRONG_FILE_EXTENSION",
    "ERROR_TOO_BIG_CAPTCHA_FILESIZE", "ERROR_EMPTY_CAPTCHA",
}
TRANSIENT_ERRORS = {"ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR"}
SOLVE_ERRORS = {"ERROR_CAPTCHA_UNSOLVABLE"}
PROXY_ERRORS = {"ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED"}


def validate_config() -> None:
    """Check that required environment variables are set."""
    if not API_KEY or API_KEY == "YOUR_API_KEY":
        print("[!] ERROR: CAPTCHAAI_API_KEY is not set.")
        print("    Copy .env.example to .env and add your real API key.")
        sys.exit(1)
    if not CAPTCHA_IMAGE_FILE:
        print("[!] ERROR: CAPTCHA_IMAGE_FILE is not set.")
        print("    Set the path to the CAPTCHA image file in .env.")
        sys.exit(1)
    image_path = os.path.join(os.path.dirname(__file__), "..", CAPTCHA_IMAGE_FILE)
    if not os.path.isfile(image_path) and not os.path.isfile(CAPTCHA_IMAGE_FILE):
        print(f"[!] ERROR: Image file not found: {CAPTCHA_IMAGE_FILE}")
        print("    Make sure the file exists and the path is correct.")
        sys.exit(1)


def load_image_base64() -> str:
    """Load image file and return base64-encoded string."""
    image_path = os.path.join(os.path.dirname(__file__), "..", CAPTCHA_IMAGE_FILE)
    if not os.path.isfile(image_path):
        image_path = CAPTCHA_IMAGE_FILE
    print(f"[*] Loading image from {CAPTCHA_IMAGE_FILE}...")
    with open(image_path, "rb") as f:
        return base64.b64encode(f.read()).decode("ascii")


def submit_task(image_b64: str) -> str:
    """Submit the CAPTCHA task via POST and return the task ID."""
    print("[*] Submitting Image CAPTCHA task...")
    payload = {
        "key": API_KEY,
        "method": "base64",
        "body": image_b64,
        "json": "1",
    }

    try:
        resp = requests.post(SUBMIT_URL, data=payload, timeout=30)
        resp.raise_for_status()
    except requests.RequestException as exc:
        print(f"[!] Network error during submission: {exc}")
        sys.exit(1)

    data = resp.json()

    if data.get("status") != 1:
        error = data.get("request", "UNKNOWN_ERROR")
        if error in AUTH_ERRORS:
            print(f"[!] Authentication error: {error}")
            print("    Check your API key at https://captchaai.com/dashboard")
        elif error in BALANCE_ERRORS:
            print(f"[!] Balance error: {error}")
            print("    Top up your account at https://captchaai.com")
        elif error in INPUT_ERRORS:
            print(f"[!] Input error: {error}")
            print("    Verify your image file is valid and not too large.")
        elif error in PROXY_ERRORS:
            print(f"[!] Proxy error: {error}")
            print("    Check your proxy configuration or try a different proxy.")
        else:
            print(f"[!] Submission failed: {error}")
        sys.exit(1)

    task_id = data["request"]
    print(f"[+] Task submitted. ID: {task_id}")
    return task_id


def poll_result(task_id: str) -> str:
    """Poll for the CAPTCHA solution with timeout and retry logic."""
    print("[*] Waiting 10s before first poll...")
    time.sleep(10)

    params = {
        "key": API_KEY,
        "action": "get",
        "id": task_id,
        "json": "1",
    }

    elapsed = 10
    attempt = 0
    backoff = POLL_INTERVAL

    while elapsed < MAX_TIMEOUT:
        attempt += 1
        print(f"[*] Polling for result (attempt {attempt})...")

        try:
            resp = requests.get(RESULT_URL, params=params, timeout=30)
            resp.raise_for_status()
        except requests.RequestException as exc:
            print(f"[!] Network error during polling: {exc}")
            time.sleep(backoff)
            elapsed += backoff
            backoff = min(backoff * 2, 30)
            continue

        data = resp.json()

        if data.get("status") == 1:
            return data["request"]

        error = data.get("request", "")
        if error == "CAPCHA_NOT_READY":
            print(f"[*] Not ready yet, waiting {POLL_INTERVAL}s...")
            time.sleep(POLL_INTERVAL)
            elapsed += POLL_INTERVAL
            backoff = POLL_INTERVAL
            continue

        if error in TRANSIENT_ERRORS:
            print(f"[!] Transient error: {error}, retrying in {backoff}s...")
            time.sleep(backoff)
            elapsed += backoff
            backoff = min(backoff * 2, 30)
            continue

        if error in SOLVE_ERRORS:
            print(f"[!] Solve error: {error}")
            print("    The CAPTCHA could not be solved. Verify the image and retry.")
            sys.exit(1)

        print(f"[!] Unexpected error: {error}")
        sys.exit(1)

    print(f"[!] Timeout: no solution received within {MAX_TIMEOUT} seconds.")
    sys.exit(1)


def main() -> None:
    validate_config()
    image_b64 = load_image_base64()
    task_id = submit_task(image_b64)
    text = poll_result(task_id)
    print(f"[+] Solved! Text: {text}")
    print()
    print("Next step: enter this text into the CAPTCHA input field")
    print("on the target page and submit the form.")


if __name__ == "__main__":
    main()
