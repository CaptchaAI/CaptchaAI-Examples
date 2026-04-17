/**
 * Solve reCAPTCHA Invisible using the CaptchaAI API.
 *
 * Usage:
 *   javac Solve.java
 *   java Solve
 *
 * Requires .env file in parent directory with:
 *   CAPTCHAAI_API_KEY and CAPTCHA-specific variables
 */

import java.io.*;
import java.net.*;
import java.nio.file.*;
import java.util.*;

public class Solve {

    private static final String SUBMIT_URL = "https://ocr.captchaai.com/in.php";
    private static final String RESULT_URL = "https://ocr.captchaai.com/res.php";

    private static final Set<String> AUTH_ERRORS = Set.of(
        "ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED");
    private static final Set<String> BALANCE_ERRORS = Set.of("ERROR_ZERO_BALANCE");
    private static final Set<String> INPUT_ERRORS = Set.of(
        "ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS", "ERROR_BAD_TOKEN_OR_PAGEURL");
    private static final Set<String> TRANSIENT_ERRORS = Set.of(
        "ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR");
    private static final Set<String> SOLVE_ERRORS = Set.of("ERROR_CAPTCHA_UNSOLVABLE");
    private static final Set<String> PROXY_ERRORS = Set.of(
        "ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED");

    private final String apiKey;
    private final int pollInterval;
    private final int maxTimeout;
    private final String googlekey;
    private final String pageurl;

    public Solve(Map<String, String> env) {
        this.apiKey = env.getOrDefault("CAPTCHAAI_API_KEY", "");
        this.googlekey = env.getOrDefault("CAPTCHA_GOOGLEKEY", "");
        this.pageurl = env.getOrDefault("CAPTCHA_PAGEURL", "");
        this.pollInterval = Integer.parseInt(env.getOrDefault("POLL_INTERVAL", "5"));
        this.maxTimeout = Integer.parseInt(env.getOrDefault("MAX_TIMEOUT", "120"));
    }

    private void validateConfig() {
        if (apiKey.isEmpty() || "YOUR_API_KEY".equals(apiKey)) {
            System.out.println("[!] ERROR: CAPTCHAAI_API_KEY is not set.");
            System.out.println("    Copy .env.example to .env and add your real API key.");
            System.exit(1);
        }
    }

    private String httpGet(String urlStr) throws IOException {
        URL url = URI.create(urlStr).toURL();
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setConnectTimeout(30000);
        conn.setReadTimeout(30000);
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream()))) {
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) sb.append(line);
            return sb.toString();
        }
    }

    private String submitTask() {
        System.out.println("[*] Submitting reCAPTCHA Invisible task...");
        String params = String.format(
            "key=%s&method=userrecaptcha&googlekey=%s&pageurl=%s&invisible=1&json=1",
            URLEncoder.encode(apiKey, java.nio.charset.StandardCharsets.UTF_8),
            URLEncoder.encode(googlekey, java.nio.charset.StandardCharsets.UTF_8),
            URLEncoder.encode(pageurl, java.nio.charset.StandardCharsets.UTF_8));

        String body;
        try {
            body = httpGet(SUBMIT_URL + "?" + params);
        } catch (IOException e) {
            System.out.println("[!] Network error during submission: " + e.getMessage());
            System.exit(1);
            return "";
        }

        int status = parseStatus(body);
        String request = parseRequest(body);

        if (status != 1) {
            classifyError(request);
            System.exit(1);
        }

        System.out.println("[+] Task submitted. ID: " + request);
        return request;
    }

    private String pollResult(String taskId) {
        System.out.println("[*] Waiting 15s before first poll...");
        sleep(15);

        String params = String.format(
            "key=%s&action=get&id=%s&json=1",
            URLEncoder.encode(apiKey, java.nio.charset.StandardCharsets.UTF_8),
            URLEncoder.encode(taskId, java.nio.charset.StandardCharsets.UTF_8));

        int elapsed = 15, attempt = 0, backoff = pollInterval;

        while (elapsed < maxTimeout) {
            attempt++;
            System.out.printf("[*] Polling for result (attempt %d)...%n", attempt);

            String body;
            try {
                body = httpGet(RESULT_URL + "?" + params);
            } catch (IOException e) {
                System.out.println("[!] Network error during polling: " + e.getMessage());
                sleep(backoff);
                elapsed += backoff;
                backoff = Math.min(backoff * 2, 30);
                continue;
            }

            int status = parseStatus(body);
            String request = parseRequest(body);

            if (status == 1) return request;

            if ("CAPCHA_NOT_READY".equals(request)) {
                System.out.printf("[*] Not ready yet, waiting %ds...%n", pollInterval);
                sleep(pollInterval);
                elapsed += pollInterval;
                backoff = pollInterval;
                continue;
            }
            if (TRANSIENT_ERRORS.contains(request)) {
                System.out.printf("[!] Transient error: %s, retrying in %ds...%n", request, backoff);
                sleep(backoff);
                elapsed += backoff;
                backoff = Math.min(backoff * 2, 30);
                continue;
            }
            if (SOLVE_ERRORS.contains(request)) {
                System.out.println("[!] Solve error: " + request);
                System.out.println("    The CAPTCHA could not be solved. Verify parameters and retry.");
                System.exit(1);
            }
            if (PROXY_ERRORS.contains(request)) {
                System.out.println("[!] Proxy error: " + request);
                System.out.println("    Check your proxy configuration or try a different proxy.");
                System.exit(1);
            }
            System.out.println("[!] Unexpected error: " + request);
            System.exit(1);
        }

        System.out.printf("[!] Timeout: no solution received within %d seconds.%n", maxTimeout);
        System.exit(1);
        return "";
    }

    private static void classifyError(String error) {
        if (AUTH_ERRORS.contains(error)) {
            System.out.println("[!] Authentication error: " + error);
            System.out.println("    Check your API key at https://captchaai.com/dashboard");
        } else if (BALANCE_ERRORS.contains(error)) {
            System.out.println("[!] Balance error: " + error);
            System.out.println("    Top up your account at https://captchaai.com");
        } else if (INPUT_ERRORS.contains(error)) {
            System.out.println("[!] Input error: " + error);
            System.out.println("    Verify your sitekey and page URL are correct.");
        } else if (PROXY_ERRORS.contains(error)) {
            System.out.println("[!] Proxy error: " + error);
            System.out.println("    Check your proxy configuration or try a different proxy.");
        } else {
            System.out.println("[!] Submission failed: " + error);
        }
    }

    private static int parseStatus(String json) {
        int idx = json.indexOf("\"status\":");
        if (idx == -1) return 0;
        String sub = json.substring(idx + 9).trim();
        return sub.startsWith("1") ? 1 : 0;
    }

    private static String parseRequest(String json) {
        int idx = json.indexOf("\"request\":");
        if (idx == -1) return "UNKNOWN_ERROR";
        String sub = json.substring(idx + 10).trim();
        if (sub.startsWith("\"")) {
            int end = sub.indexOf("\"", 1);
            if (end > 0) return sub.substring(1, end);
        }
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < sub.length(); i++) {
            char c = sub.charAt(i);
            if (Character.isDigit(c)) sb.append(c); else break;
        }
        return sb.toString();
    }

    private static void sleep(int seconds) {
        try { Thread.sleep(seconds * 1000L); } catch (InterruptedException e) { Thread.currentThread().interrupt(); }
    }

    private static Map<String, String> loadEnv(String path) {
        Map<String, String> env = new HashMap<>();
        try {
            for (String line : Files.readAllLines(Path.of(path))) {
                line = line.trim();
                if (line.isEmpty() || line.startsWith("#")) continue;
                String[] parts = line.split("=", 2);
                if (parts.length == 2) env.put(parts[0].trim(), parts[1].trim());
            }
        } catch (IOException e) { /* fall back to system env */ }
        return env;
    }

    public static void main(String[] args) {
        Map<String, String> env = loadEnv("../.env");
        Solve solver = new Solve(env);
        solver.validateConfig();
        String taskId = solver.submitTask();
        String token = solver.pollResult(taskId);
        String truncated = token.length() > 50 ? token.substring(0, 50) : token;
        System.out.println("[+] Solved! Token: " + truncated + "...");
        System.out.println("[+] Full token length: " + token.length() + " characters");
    }
}
