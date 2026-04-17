"""Solve reCAPTCHA v3 using the CaptchaAI API.

Usage:
    pip install -r requirements.txt
    cp ../.env.example ../.env   # then edit with your credentials
    python solve.py
"""

import os
import sys
import time

import requests
from dotenv import load_dotenv

# Load environment variables from the parent .env file
load_dotenv(dotenv_path=os.path.join(os.path.dirname(__file__), "..", ".env"))

SUBMIT_URL = "https://ocr.captchaai.com/in.php"
RESULT_URL = "https://ocr.captchaai.com/res.php"

API_KEY = os.getenv("CAPTCHAAI_API_KEY", "")
CAPTCHA_GOOGLEKEY = os.getenv("CAPTCHA_GOOGLEKEY", "")
CAPTCHA_PAGEURL = os.getenv("CAPTCHA_PAGEURL", "")
POLL_INTERVAL = int(os.getenv("POLL_INTERVAL", "5"))
MAX_TIMEOUT = int(os.getenv("MAX_TIMEOUT", "120"))

AUTH_ERRORS = {"ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED"}
BALANCE_ERRORS = {"ERROR_ZERO_BALANCE"}
INPUT_ERRORS = {"ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS", "ERROR_BAD_TOKEN_OR_PAGEURL"}
TRANSIENT_ERRORS = {"ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR"}
SOLVE_ERRORS = {"ERROR_CAPTCHA_UNSOLVABLE"}


def validate_config() -> None:
    """Check that required environment variables are set."""
    if not API_KEY or API_KEY == "YOUR_API_KEY":
        print("[!] ERROR: CAPTCHAAI_API_KEY is not set.")
        print("    Copy .env.example to .env and add your real API key.")
        sys.exit(1)


def submit_task() -> str:
    """Submit the CAPTCHA task and return the task ID."""
    print("[*] Submitting reCAPTCHA v3 task...")
    payload = {
        "key": API_KEY,
        "method": "userrecaptcha",
        "googlekey": CAPTCHA_GOOGLEKEY,
        "pageurl": CAPTCHA_PAGEURL,
        "version": "v3",
        "action": "verify",
        "min_score": "0.3",
        "json": "1",
    }

    try:
        resp = requests.get(SUBMIT_URL, params=payload, timeout=30)
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
            print("    Verify your sitekey and page URL are correct.")
        else:
            print(f"[!] Submission failed: {error}")
        sys.exit(1)

    task_id = data["request"]
    print(f"[+] Task submitted. ID: {task_id}")
    return task_id


def poll_result(task_id: str) -> str:
    """Poll for the CAPTCHA solution with timeout and retry logic."""
    print("[*] Waiting 15s before first poll...")
    time.sleep(15)

    params = {
        "key": API_KEY,
        "action": "get",
        "id": task_id,
        "json": "1",
    }

    elapsed = 15
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
            print("    The CAPTCHA could not be solved. Verify parameters and retry.")
            sys.exit(1)

        print(f"[!] Unexpected error: {error}")
        sys.exit(1)

    print(f"[!] Timeout: no solution received within {MAX_TIMEOUT} seconds.")
    sys.exit(1)


def main() -> None:
    validate_config()
    task_id = submit_task()
    token = poll_result(task_id)
    print(f"[+] Solved! Token: {token[:50]}...")
    print(f"[+] Full token length: {len(token)} characters")


if __name__ == "__main__":
    main()
