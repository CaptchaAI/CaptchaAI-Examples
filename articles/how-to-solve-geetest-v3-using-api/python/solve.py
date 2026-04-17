"""Solve GeeTest v3 using the CaptchaAI API.

Usage:
    pip install -r requirements.txt
    cp ../.env.example ../.env   # then edit with your credentials
    python solve.py
"""

import os
import sys
import time
import json

import requests
from dotenv import load_dotenv

# Load environment variables from the parent .env file
load_dotenv(dotenv_path=os.path.join(os.path.dirname(__file__), "..", ".env"))

SUBMIT_URL = "https://ocr.captchaai.com/in.php"
RESULT_URL = "https://ocr.captchaai.com/res.php"

API_KEY = os.getenv("CAPTCHAAI_API_KEY", "")
CAPTCHA_GT = os.getenv("CAPTCHA_GT", "")
CAPTCHA_CHALLENGE = os.getenv("CAPTCHA_CHALLENGE", "")
CAPTCHA_PAGEURL = os.getenv("CAPTCHA_PAGEURL", "")
CAPTCHA_API_SERVER = os.getenv("CAPTCHA_API_SERVER", "")
POLL_INTERVAL = int(os.getenv("POLL_INTERVAL", "5"))
MAX_TIMEOUT = int(os.getenv("MAX_TIMEOUT", "120"))

# --- Error categories ---
AUTH_ERRORS = {"ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED"}
BALANCE_ERRORS = {"ERROR_ZERO_BALANCE"}
INPUT_ERRORS = {"ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS", "ERROR_BAD_TOKEN_OR_PAGEURL"}
TRANSIENT_ERRORS = {"ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR"}
SOLVE_ERRORS = {"ERROR_CAPTCHA_UNSOLVABLE"}
PROXY_ERRORS = {"ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED"}


def validate_config() -> None:
    """Check that required environment variables are set."""
    if not API_KEY or API_KEY == "YOUR_API_KEY":
        print("[!] ERROR: CAPTCHAAI_API_KEY is not set.")
        print("    Copy .env.example to .env and add your real API key.")
        sys.exit(1)
    if not CAPTCHA_GT or CAPTCHA_GT == "YOUR_GT_VALUE":
        print("[!] ERROR: CAPTCHA_GT is not set.")
        print("    Find the gt value in the page source or GeeTest initialization call.")
        sys.exit(1)
    if not CAPTCHA_CHALLENGE or CAPTCHA_CHALLENGE == "YOUR_CHALLENGE_VALUE":
        print("[!] ERROR: CAPTCHA_CHALLENGE is not set.")
        print("    The challenge token must be fresh — fetch a new one for each solve attempt.")
        sys.exit(1)
    if not CAPTCHA_PAGEURL or CAPTCHA_PAGEURL == "https://example.com":
        print("[!] WARNING: CAPTCHA_PAGEURL may not be set correctly.")
        print("    Make sure it points to the actual target page.")


def submit_task() -> str:
    """Submit the CAPTCHA task and return the task ID."""
    print("[*] Submitting GeeTest v3 task...")
    payload = {
        "key": API_KEY,
        "method": "geetest",
        "gt": CAPTCHA_GT,
        "challenge": CAPTCHA_CHALLENGE,
        "pageurl": CAPTCHA_PAGEURL,
        "json": "1",
    }
    if CAPTCHA_API_SERVER:
        payload["api_server"] = CAPTCHA_API_SERVER

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
            print("    Verify your gt, challenge, and page URL are correct.")
        elif error in PROXY_ERRORS:
            print(f"[!] Proxy error: {error}")
            print("    Check your proxy configuration or try a different proxy.")
        else:
            print(f"[!] Submission failed: {error}")
        sys.exit(1)

    task_id = data["request"]
    print(f"[+] Task submitted. ID: {task_id}")
    return task_id


def poll_result(task_id: str) -> dict:
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
            # The request field contains a JSON string with the 3 GeeTest values
            solution = data["request"]
            if isinstance(solution, str):
                solution = json.loads(solution)
            return solution

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
    solution = poll_result(task_id)
    print("[+] Solved!")
    print(f"[+] geetest_challenge: {solution['geetest_challenge']}")
    print(f"[+] geetest_validate: {solution['geetest_validate']}")
    print(f"[+] geetest_seccode: {solution['geetest_seccode']}")
    print()
    print("Next step: submit these three values to the site's")
    print("GeeTest verification endpoint.")


if __name__ == "__main__":
    main()
