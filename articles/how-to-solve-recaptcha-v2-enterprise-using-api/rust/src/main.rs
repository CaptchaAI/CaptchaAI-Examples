// Solve reCAPTCHA v2 Enterprise using the CaptchaAI API.
//
// Usage:
//   cargo run

use std::collections::HashMap;
use std::fs;
use std::path::Path;
use std::thread;
use std::time::Duration;

const SUBMIT_URL: &str = "https://ocr.captchaai.com/in.php";
const RESULT_URL: &str = "https://ocr.captchaai.com/res.php";

fn load_env(path: &str) -> HashMap<String, String> {
    let mut env = HashMap::new();
    if let Ok(content) = fs::read_to_string(path) {
        for line in content.lines() {
            let trimmed = line.trim();
            if trimmed.is_empty() || trimmed.starts_with('#') {
                continue;
            }
            if let Some((key, value)) = trimmed.split_once('=') {
                env.insert(key.trim().to_string(), value.trim().to_string());
            }
        }
    }
    env
}

fn get_env(env: &HashMap<String, String>, key: &str, fallback: &str) -> String {
    if let Some(v) = env.get(key) {
        if !v.is_empty() {
            return v.clone();
        }
    }
    if let Ok(v) = std::env::var(key) {
        if !v.is_empty() {
            return v;
        }
    }
    fallback.to_string()
}

fn json_str(json: &str, key: &str) -> String {
    let pattern = format!("\"{}\":\"", key);
    if let Some(idx) = json.find(&pattern) {
        let start = idx + pattern.len();
        if let Some(end) = json[start..].find('"') {
            return json[start..start + end].to_string();
        }
    }
    String::new()
}

fn json_int(json: &str, key: &str) -> i32 {
    let pattern = format!("\"{}\":", key);
    if let Some(idx) = json.find(&pattern) {
        let start = idx + pattern.len();
        let num_str: String = json[start..]
            .chars()
            .take_while(|c| c.is_ascii_digit() || *c == '-')
            .collect();
        return num_str.parse().unwrap_or(0);
    }
    0
}

fn handle_error(error: &str) {
    let auth = ["ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED"];
    let balance = ["ERROR_ZERO_BALANCE"];
    let input = ["ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS", "ERROR_BAD_TOKEN_OR_PAGEURL"];
    let proxy = ["ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED"];

    if auth.contains(&error) {
        println!("[!] Authentication error: {}", error);
        println!("    Check your API key at https://captchaai.com/dashboard");
    } else if balance.contains(&error) {
        println!("[!] Balance error: {}", error);
        println!("    Top up your account at https://captchaai.com");
    } else if input.contains(&error) {
        println!("[!] Input error: {}", error);
        println!("    Verify your sitekey and page URL are correct.");
    } else if proxy.contains(&error) {
        println!("[!] Proxy error: {}", error);
        println!("    Check your proxy configuration or try a different proxy.");
    } else {
        println!("[!] Submission failed: {}", error);
    }
}

fn main() {
    let env = load_env("../.env");
    let api_key = get_env(&env, "CAPTCHAAI_API_KEY", "");
    let sitekey = get_env(&env, "CAPTCHA_SITEKEY", "");
    let pageurl = get_env(&env, "CAPTCHA_PAGEURL", "");
    let data_s = get_env(&env, "CAPTCHA_DATA_S", "");
    let poll_interval: u64 = get_env(&env, "POLL_INTERVAL", "5").parse().unwrap_or(5);
    let max_timeout: u64 = get_env(&env, "MAX_TIMEOUT", "120").parse().unwrap_or(120);

    // Validate
    if api_key.is_empty() || api_key == "YOUR_API_KEY" {
        println!("[!] ERROR: CAPTCHAAI_API_KEY is not set.");
        println!("    Copy .env.example to .env and add your real API key.");
        std::process::exit(1);
    }
    if sitekey.is_empty() || sitekey == "YOUR_SITE_KEY" {
        println!("[!] ERROR: CAPTCHA_SITEKEY is not set.");
        println!("    Add the reCAPTCHA v2 Enterprise sitekey from your target page to .env");
        std::process::exit(1);
    }
    if pageurl.is_empty() || pageurl == "https://example.com/login" {
        println!("[!] WARNING: CAPTCHA_PAGEURL may not be set correctly.");
        println!("    Make sure it points to the actual target page.");
    }

    // Submit task
    println!("[*] Submitting reCAPTCHA v2 Enterprise task...");
    let mut submit_url = format!(
        "{}?key={}&method=userrecaptcha&googlekey={}&pageurl={}&enterprise=1&json=1",
        SUBMIT_URL,
        urlencoding::encode(&api_key),
        urlencoding::encode(&sitekey),
        urlencoding::encode(&pageurl)
    );

    if !data_s.is_empty() {
        submit_url.push_str(&format!("&data-s={}", urlencoding::encode(&data_s)));
    }

    let submit_resp = match ureq::get(&submit_url).call() {
        Ok(r) => r.into_string().unwrap_or_default(),
        Err(e) => {
            println!("[!] Network error during submission: {}", e);
            std::process::exit(1);
        }
    };

    let submit_status = json_int(&submit_resp, "status");
    let submit_request = json_str(&submit_resp, "request");

    if submit_status != 1 {
        handle_error(&submit_request);
        std::process::exit(1);
    }

    let task_id = submit_request;
    println!("[+] Task submitted. ID: {}", task_id);

    // Poll for result
    println!("[*] Waiting 15s before first poll...");
    thread::sleep(Duration::from_secs(15));

    let mut elapsed: u64 = 15;
    let mut attempt = 0;
    let mut backoff = poll_interval;

    let transient = ["ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR"];
    let solve = ["ERROR_CAPTCHA_UNSOLVABLE"];

    while elapsed < max_timeout {
        attempt += 1;
        println!("[*] Polling for result (attempt {})...", attempt);

        let poll_url = format!(
            "{}?key={}&action=get&id={}&json=1",
            RESULT_URL,
            urlencoding::encode(&api_key),
            urlencoding::encode(&task_id)
        );

        let result_resp = match ureq::get(&poll_url).call() {
            Ok(r) => r.into_string().unwrap_or_default(),
            Err(e) => {
                println!("[!] Network error during polling: {}", e);
                thread::sleep(Duration::from_secs(backoff));
                elapsed += backoff;
                backoff = std::cmp::min(backoff * 2, 30);
                continue;
            }
        };

        let status = json_int(&result_resp, "status");
        let request = json_str(&result_resp, "request");

        if status == 1 {
            let display = if request.len() > 50 { &request[..50] } else { &request };
            println!("[+] Solved! Token: {}...", display);
            println!("[+] Full token length: {} characters", request.len());
            println!();
            println!("Next step: inject this token into the target page's");
            println!("g-recaptcha-response hidden field and submit the form.");
            return;
        }

        if request == "CAPCHA_NOT_READY" {
            println!("[*] Not ready yet, waiting {}s...", poll_interval);
            thread::sleep(Duration::from_secs(poll_interval));
            elapsed += poll_interval;
            backoff = poll_interval;
            continue;
        }

        if transient.contains(&request.as_str()) {
            println!("[!] Transient error: {}, retrying in {}s...", request, backoff);
            thread::sleep(Duration::from_secs(backoff));
            elapsed += backoff;
            backoff = std::cmp::min(backoff * 2, 30);
            continue;
        }

        if solve.contains(&request.as_str()) {
            println!("[!] Solve error: {}", request);
            println!("    The CAPTCHA could not be solved. Verify parameters and retry.");
            std::process::exit(1);
        }

        println!("[!] Unexpected error: {}", request);
        std::process::exit(1);
    }

    println!("[!] Timeout: no solution received within {} seconds.", max_timeout);
    std::process::exit(1);
}
