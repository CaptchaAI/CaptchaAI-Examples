// Solve reCAPTCHA v2 using the CaptchaAI API.
//
// Usage:
//   cargo run
//
// Requires .env file in parent directory with:
//   CAPTCHAAI_API_KEY and CAPTCHA-specific variables

use std::collections::HashSet;
use std::fs;
use std::thread;
use std::time::Duration;

fn load_env(path: &str) -> std::collections::HashMap<String, String> {
    let mut env = std::collections::HashMap::new();
    if let Ok(contents) = fs::read_to_string(path) {
        for line in contents.lines() {
            let line = line.trim();
            if line.is_empty() || line.starts_with('#') { continue; }
            if let Some((key, value)) = line.split_once('=') {
                env.insert(key.trim().to_string(), value.trim().to_string());
            }
        }
    }
    env
}

fn get_env(env: &std::collections::HashMap<String, String>, key: &str, fallback: &str) -> String {
    if let Some(val) = env.get(key) { if !val.is_empty() { return val.clone(); } }
    if let Ok(val) = std::env::var(key) { if !val.is_empty() { return val; } }
    fallback.to_string()
}

fn classify_error(error: &str, auth: &HashSet<&str>, balance: &HashSet<&str>,
                  input: &HashSet<&str>, proxy: &HashSet<&str>) {
    if auth.contains(error) {
        println!("[!] Authentication error: {}", error);
        println!("    Check your API key at https://captchaai.com/dashboard");
    } else if balance.contains(error) {
        println!("[!] Balance error: {}", error);
        println!("    Top up your account at https://captchaai.com");
    } else if input.contains(error) {
        println!("[!] Input error: {}", error);
        println!("    Verify your sitekey and page URL are correct.");
    } else if proxy.contains(error) {
        println!("[!] Proxy error: {}", error);
        println!("    Check your proxy configuration or try a different proxy.");
    } else {
        println!("[!] Submission failed: {}", error);
    }
}

fn main() {
    let env = load_env("../.env");

    let api_key = get_env(&env, "CAPTCHAAI_API_KEY", "");
    let googlekey = get_env(&env, "CAPTCHA_SITEKEY", "");
    let pageurl = get_env(&env, "CAPTCHA_PAGEURL", "");
    let poll_interval: u64 = get_env(&env, "POLL_INTERVAL", "5").parse().unwrap_or(5);
    let max_timeout: u64 = get_env(&env, "MAX_TIMEOUT", "120").parse().unwrap_or(120);

    let auth_errors: HashSet<&str> = ["ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED"].into();
    let balance_errors: HashSet<&str> = ["ERROR_ZERO_BALANCE"].into();
    let input_errors: HashSet<&str> = ["ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS", "ERROR_BAD_TOKEN_OR_PAGEURL"].into();
    let transient_errors: HashSet<&str> = ["ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR"].into();
    let solve_errors: HashSet<&str> = ["ERROR_CAPTCHA_UNSOLVABLE"].into();
    let proxy_errors: HashSet<&str> = ["ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED"].into();

    if api_key.is_empty() || api_key == "YOUR_API_KEY" {
        println!("[!] ERROR: CAPTCHAAI_API_KEY is not set.");
        println!("    Copy .env.example to .env and add your real API key.");
        std::process::exit(1);
    }

    // Submit
    println!("[*] Submitting reCAPTCHA v2 task...");
    let submit_url = format!(
        "https://ocr.captchaai.com/in.php?key={}&method=userrecaptcha&googlekey={}&pageurl={}&json=1",
        urlencoding::encode(&api_key), urlencoding::encode(&googlekey), urlencoding::encode(&pageurl)
    );

    let client = ureq::AgentBuilder::new()
        .timeout_connect(Duration::from_secs(30))
        .timeout_read(Duration::from_secs(30))
        .build();

    let submit_resp = match client.get(&submit_url).call() {
        Ok(resp) => resp.into_string().unwrap_or_default(),
        Err(e) => { println!("[!] Network error during submission: {}", e); std::process::exit(1); }
    };

    let submit_data: serde_json::Value = serde_json::from_str(&submit_resp).unwrap_or_default();
    let status = submit_data["status"].as_i64().unwrap_or(0);
    let request = submit_data["request"].as_str().unwrap_or("UNKNOWN_ERROR");

    if status != 1 {
        classify_error(request, &auth_errors, &balance_errors, &input_errors, &proxy_errors);
        std::process::exit(1);
    }

    let task_id = request.to_string();
    println!("[+] Task submitted. ID: {}", task_id);

    // Poll
    println!("[*] Waiting 15s before first poll...");
    thread::sleep(Duration::from_secs(15));

    let mut elapsed: u64 = 15;
    let mut attempt: u32 = 0;
    let mut backoff = poll_interval;

    while elapsed < max_timeout {
        attempt += 1;
        println!("[*] Polling for result (attempt {})...", attempt);

        let poll_url = format!(
            "https://ocr.captchaai.com/res.php?key={}&action=get&id={}&json=1",
            urlencoding::encode(&api_key), urlencoding::encode(&task_id)
        );

        let poll_resp = match client.get(&poll_url).call() {
            Ok(resp) => resp.into_string().unwrap_or_default(),
            Err(e) => {
                println!("[!] Network error during polling: {}", e);
                thread::sleep(Duration::from_secs(backoff));
                elapsed += backoff; backoff = std::cmp::min(backoff * 2, 30); continue;
            }
        };

        let result: serde_json::Value = serde_json::from_str(&poll_resp).unwrap_or_default();
        let r_status = result["status"].as_i64().unwrap_or(0);
        let r_request = result["request"].as_str().unwrap_or("");

        if r_status == 1 {
            let token = r_request;
            let truncated = if token.len() > 50 { &token[..50] } else { token };
            println!("[+] Solved! Token: {}...", truncated);
            println!("[+] Full token length: {} characters", token.len());
            std::process::exit(0);
        }

        if r_request == "CAPCHA_NOT_READY" {
            println!("[*] Not ready yet, waiting {}s...", poll_interval);
            thread::sleep(Duration::from_secs(poll_interval));
            elapsed += poll_interval; backoff = poll_interval; continue;
        }
        if transient_errors.contains(r_request) {
            println!("[!] Transient error: {}, retrying in {}s...", r_request, backoff);
            thread::sleep(Duration::from_secs(backoff));
            elapsed += backoff; backoff = std::cmp::min(backoff * 2, 30); continue;
        }
        if solve_errors.contains(r_request) {
            println!("[!] Solve error: {}", r_request);
            println!("    The CAPTCHA could not be solved. Verify parameters and retry.");
            std::process::exit(1);
        }
        if proxy_errors.contains(r_request) {
            println!("[!] Proxy error: {}", r_request);
            println!("    Check your proxy configuration or try a different proxy.");
            std::process::exit(1);
        }

        println!("[!] Unexpected error: {}", r_request);
        std::process::exit(1);
    }

    println!("[!] Timeout: no solution received within {} seconds.", max_timeout);
    std::process::exit(1);
}
