/**
 * Solve Image CAPTCHA using the CaptchaAI API.
 *
 * Usage:
 *   npm install
 *   cp ../.env.example ../.env   // then edit with your credentials
 *   node solve.js
 */

require("dotenv").config({ path: require("path").join(__dirname, "..", ".env") });
const axios = require("axios");
const fs = require("fs");
const path = require("path");

const SUBMIT_URL = "https://ocr.captchaai.com/in.php";
const RESULT_URL = "https://ocr.captchaai.com/res.php";

const API_KEY = process.env.CAPTCHAAI_API_KEY || "";
const CAPTCHA_IMAGE_FILE = process.env.CAPTCHA_IMAGE_FILE || "captcha.png";
const POLL_INTERVAL = parseInt(process.env.POLL_INTERVAL || "5", 10);
const MAX_TIMEOUT = parseInt(process.env.MAX_TIMEOUT || "120", 10);

const AUTH_ERRORS = new Set(["ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED"]);
const BALANCE_ERRORS = new Set(["ERROR_ZERO_BALANCE"]);
const INPUT_ERRORS = new Set([
  "ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS",
  "ERROR_BAD_TOKEN_OR_PAGEURL", "ERROR_WRONG_FILE_EXTENSION",
  "ERROR_TOO_BIG_CAPTCHA_FILESIZE", "ERROR_EMPTY_CAPTCHA",
]);
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
  if (!CAPTCHA_IMAGE_FILE) {
    console.log("[!] ERROR: CAPTCHA_IMAGE_FILE is not set.");
    console.log("    Set the path to the CAPTCHA image file in .env.");
    process.exit(1);
  }
  const imgPath = resolveImagePath();
  if (!fs.existsSync(imgPath)) {
    console.log(`[!] ERROR: Image file not found: ${CAPTCHA_IMAGE_FILE}`);
    console.log("    Make sure the file exists and the path is correct.");
    process.exit(1);
  }
}

function resolveImagePath() {
  const parentPath = path.join(__dirname, "..", CAPTCHA_IMAGE_FILE);
  if (fs.existsSync(parentPath)) return parentPath;
  return CAPTCHA_IMAGE_FILE;
}

function loadImageBase64() {
  const imgPath = resolveImagePath();
  console.log(`[*] Loading image from ${CAPTCHA_IMAGE_FILE}...`);
  const data = fs.readFileSync(imgPath);
  return data.toString("base64");
}

async function submitTask(imageB64) {
  console.log("[*] Submitting Image CAPTCHA task...");

  const params = new URLSearchParams();
  params.append("key", API_KEY);
  params.append("method", "base64");
  params.append("body", imageB64);
  params.append("json", "1");

  let resp;
  try {
    resp = await axios.post(SUBMIT_URL, params.toString(), {
      headers: { "Content-Type": "application/x-www-form-urlencoded" },
      timeout: 30000,
    });
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
      console.log("    Verify your image file is valid and not too large.");
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
  console.log("[*] Waiting 10s before first poll...");
  await sleep(10);

  const params = { key: API_KEY, action: "get", id: taskId, json: "1" };
  let elapsed = 10;
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
      return data.request;
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
      console.log("    The CAPTCHA could not be solved. Verify the image and retry.");
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
  const imageB64 = loadImageBase64();
  const taskId = await submitTask(imageB64);
  const text = await pollResult(taskId);
  console.log(`[+] Solved! Text: ${text}`);
  console.log();
  console.log("Next step: enter this text into the CAPTCHA input field");
  console.log("on the target page and submit the form.");
}

main();
