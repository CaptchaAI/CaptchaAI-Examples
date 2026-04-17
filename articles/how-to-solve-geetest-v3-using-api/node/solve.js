/**
 * Solve GeeTest v3 using the CaptchaAI API.
 *
 * Usage:
 *   npm install
 *   cp ../.env.example ../.env   // then edit with your credentials
 *   node solve.js
 */

require("dotenv").config({ path: require("path").join(__dirname, "..", ".env") });
const axios = require("axios");

const SUBMIT_URL = "https://ocr.captchaai.com/in.php";
const RESULT_URL = "https://ocr.captchaai.com/res.php";

const API_KEY = process.env.CAPTCHAAI_API_KEY || "";
const CAPTCHA_GT = process.env.CAPTCHA_GT || "";
const CAPTCHA_CHALLENGE = process.env.CAPTCHA_CHALLENGE || "";
const CAPTCHA_PAGEURL = process.env.CAPTCHA_PAGEURL || "";
const CAPTCHA_API_SERVER = process.env.CAPTCHA_API_SERVER || "";
const POLL_INTERVAL = parseInt(process.env.POLL_INTERVAL || "5", 10);
const MAX_TIMEOUT = parseInt(process.env.MAX_TIMEOUT || "120", 10);

const AUTH_ERRORS = new Set(["ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED"]);
const BALANCE_ERRORS = new Set(["ERROR_ZERO_BALANCE"]);
const INPUT_ERRORS = new Set(["ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS", "ERROR_BAD_TOKEN_OR_PAGEURL"]);
const TRANSIENT_ERRORS = new Set(["ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR"]);
const SOLVE_ERRORS = new Set(["ERROR_CAPTCHA_UNSOLVABLE"]);
const PROXY_ERRORS = new Set(["ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED"]);

function sleep(seconds) {
  return new Promise((resolve) => setTimeout(resolve, seconds * 1000));
}

function validateConfig() {
  if (!API_KEY || API_KEY === "YOUR_API_KEY") {
    console.log("[!] ERROR: CAPTCHAAI_API_KEY is not set.");
    console.log("    Copy .env.example to .env and add your real API key.");
    process.exit(1);
  }
  if (!CAPTCHA_GT || CAPTCHA_GT === "YOUR_GT_VALUE") {
    console.log("[!] ERROR: CAPTCHA_GT is not set.");
    console.log("    Find the gt value in the page source or GeeTest initialization call.");
    process.exit(1);
  }
  if (!CAPTCHA_CHALLENGE || CAPTCHA_CHALLENGE === "YOUR_CHALLENGE_VALUE") {
    console.log("[!] ERROR: CAPTCHA_CHALLENGE is not set.");
    console.log("    The challenge token must be fresh — fetch a new one for each solve attempt.");
    process.exit(1);
  }
  if (!CAPTCHA_PAGEURL || CAPTCHA_PAGEURL === "https://example.com") {
    console.log("[!] WARNING: CAPTCHA_PAGEURL may not be set correctly.");
    console.log("    Make sure it points to the actual target page.");
  }
}

async function submitTask() {
  console.log("[*] Submitting GeeTest v3 task...");

  const params = {
    key: API_KEY,
    method: "geetest",
    gt: CAPTCHA_GT,
    challenge: CAPTCHA_CHALLENGE,
    pageurl: CAPTCHA_PAGEURL,
    json: "1",
  };
  if (CAPTCHA_API_SERVER) {
    params.api_server = CAPTCHA_API_SERVER;
  }

  let resp;
  try {
    resp = await axios.get(SUBMIT_URL, { params, timeout: 30000 });
  } catch (err) {
    console.log(`[!] Network error during submission: ${err.message}`);
    process.exit(1);
  }

  const data = resp.data;
  if (data.status !== 1) {
    const error = data.request || "UNKNOWN_ERROR";
    if (AUTH_ERRORS.has(error)) {
      console.log(`[!] Authentication error: ${error}`);
      console.log("    Check your API key at https://captchaai.com/dashboard");
    } else if (BALANCE_ERRORS.has(error)) {
      console.log(`[!] Balance error: ${error}`);
      console.log("    Top up your account at https://captchaai.com");
    } else if (INPUT_ERRORS.has(error)) {
      console.log(`[!] Input error: ${error}`);
      console.log("    Verify your gt, challenge, and page URL are correct.");
    } else if (PROXY_ERRORS.has(error)) {
      console.log(`[!] Proxy error: ${error}`);
      console.log("    Check your proxy configuration or try a different proxy.");
    } else {
      console.log(`[!] Submission failed: ${error}`);
    }
    process.exit(1);
  }

  const taskId = data.request;
  console.log(`[+] Task submitted. ID: ${taskId}`);
  return taskId;
}

async function pollResult(taskId) {
  console.log("[*] Waiting 15s before first poll...");
  await sleep(15);

  const params = { key: API_KEY, action: "get", id: taskId, json: "1" };
  let elapsed = 15;
  let attempt = 0;
  let backoff = POLL_INTERVAL;

  while (elapsed < MAX_TIMEOUT) {
    attempt++;
    console.log(`[*] Polling for result (attempt ${attempt})...`);

    let resp;
    try {
      resp = await axios.get(RESULT_URL, { params, timeout: 30000 });
    } catch (err) {
      console.log(`[!] Network error during polling: ${err.message}`);
      await sleep(backoff);
      elapsed += backoff;
      backoff = Math.min(backoff * 2, 30);
      continue;
    }

    const data = resp.data;

    if (data.status === 1) {
      // The request field contains a JSON string with the 3 GeeTest values
      let solution = data.request;
      if (typeof solution === "string") {
        solution = JSON.parse(solution);
      }
      return solution;
    }

    const error = data.request || "";
    if (error === "CAPCHA_NOT_READY") {
      console.log(`[*] Not ready yet, waiting ${POLL_INTERVAL}s...`);
      await sleep(POLL_INTERVAL);
      elapsed += POLL_INTERVAL;
      backoff = POLL_INTERVAL;
      continue;
    }

    if (TRANSIENT_ERRORS.has(error)) {
      console.log(`[!] Transient error: ${error}, retrying in ${backoff}s...`);
      await sleep(backoff);
      elapsed += backoff;
      backoff = Math.min(backoff * 2, 30);
      continue;
    }

    if (SOLVE_ERRORS.has(error)) {
      console.log(`[!] Solve error: ${error}`);
      console.log("    The CAPTCHA could not be solved. Verify parameters and retry.");
      process.exit(1);
    }

    console.log(`[!] Unexpected error: ${error}`);
    process.exit(1);
  }

  console.log(`[!] Timeout: no solution received within ${MAX_TIMEOUT} seconds.`);
  process.exit(1);
}

async function main() {
  validateConfig();
  const taskId = await submitTask();
  const solution = await pollResult(taskId);
  console.log("[+] Solved!");
  console.log(`[+] geetest_challenge: ${solution.geetest_challenge}`);
  console.log(`[+] geetest_validate: ${solution.geetest_validate}`);
  console.log(`[+] geetest_seccode: ${solution.geetest_seccode}`);
  console.log();
  console.log("Next step: submit these three values to the site's");
  console.log("GeeTest verification endpoint.");
}

main();
