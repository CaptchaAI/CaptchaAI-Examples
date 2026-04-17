import java.io.*;
import java.net.*;
import java.nio.file.*;
import java.util.*;

/**
 * Solve GeeTest v4 using the CaptchaAI API.
 *
 * Usage:
 *   javac Solve.java
 *   java Solve
 */
public class Solve {
    static final String SUBMIT_URL = "https://ocr.captchaai.com/in.php";
    static final String RESULT_URL = "https://ocr.captchaai.com/res.php";

    static final Set<String> AUTH_ERRORS = Set.of("ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED");
    static final Set<String> BALANCE_ERRORS = Set.of("ERROR_ZERO_BALANCE");
    static final Set<String> INPUT_ERRORS = Set.of("ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS", "ERROR_BAD_TOKEN_OR_PAGEURL");
    static final Set<String> TRANSIENT_ERRORS = Set.of("ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR");
    static final Set<String> SOLVE_ERRORS = Set.of("ERROR_CAPTCHA_UNSOLVABLE");
    static final Set<String> PROXY_ERRORS = Set.of("ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED");

    static Map<String, String> env = new HashMap<>();

    public static void main(String[] args) throws Exception {
        loadEnv();
        String apiKey = getEnv("CAPTCHAAI_API_KEY", "");
        String gt = getEnv("CAPTCHA_GT", "");
        String pageurl = getEnv("CAPTCHA_PAGEURL", "");
        int pollInterval = Integer.parseInt(getEnv("POLL_INTERVAL", "5"));
        int maxTimeout = Integer.parseInt(getEnv("MAX_TIMEOUT", "120"));

        // Validate
        if (apiKey.isEmpty() || apiKey.equals("YOUR_API_KEY")) {
            System.out.println("[!] ERROR: CAPTCHAAI_API_KEY is not set.");
            System.out.println("    Copy .env.example to .env and add your real API key.");
            System.exit(1);
        }
        if (gt.isEmpty() || gt.equals("YOUR_CAPTCHA_ID")) {
            System.out.println("[!] ERROR: CAPTCHA_GT is not set.");
            System.out.println("    Find the captcha_id in the page source or GeeTest v4 initialization call.");
            System.exit(1);
        }
        if (pageurl.isEmpty() || pageurl.equals("https://example.com")) {
            System.out.println("[!] WARNING: CAPTCHA_PAGEURL may not be set correctly.");
            System.out.println("    Make sure it points to the actual target page.");
        }

        // Submit task
        System.out.println("[*] Submitting GeeTest v4 task...");
        String submitParams = String.format(
            "key=%s&method=geetest&gt=%s&pageurl=%s&version=4&json=1",
            enc(apiKey), enc(gt), enc(pageurl)
        );

        String submitResp = httpGet(SUBMIT_URL + "?" + submitParams);
        int submitStatus = jsonInt(submitResp, "status");
        String submitRequest = jsonStr(submitResp, "request");

        if (submitStatus != 1) {
            handleError(submitRequest);
            System.exit(1);
        }

        String taskId = submitRequest;
        System.out.println("[+] Task submitted. ID: " + taskId);

        // Poll for result
        System.out.println("[*] Waiting 15s before first poll...");
        Thread.sleep(15000);

        int elapsed = 15;
        int attempt = 0;
        int backoff = pollInterval;

        while (elapsed < maxTimeout) {
            attempt++;
            System.out.println("[*] Polling for result (attempt " + attempt + ")...");

            String pollParams = String.format(
                "key=%s&action=get&id=%s&json=1",
                enc(apiKey), enc(taskId)
            );

            String resultResp;
            try {
                resultResp = httpGet(RESULT_URL + "?" + pollParams);
            } catch (Exception e) {
                System.out.println("[!] Network error during polling: " + e.getMessage());
                Thread.sleep(backoff * 1000L);
                elapsed += backoff;
                backoff = Math.min(backoff * 2, 30);
                continue;
            }

            int status = jsonInt(resultResp, "status");

            if (status == 1) {
                // The request field contains a JSON object with the 5 GeeTest v4 values
                String requestValue = extractRequestValue(resultResp);
                String captchaId = jsonStr(requestValue, "captcha_id");
                String lotNumber = jsonStr(requestValue, "lot_number");
                String passToken = jsonStr(requestValue, "pass_token");
                String genTime = jsonStr(requestValue, "gen_time");
                String captchaOutput = jsonStr(requestValue, "captcha_output");
                System.out.println("[+] Solved!");
                System.out.println("[+] captcha_id: " + captchaId);
                System.out.println("[+] lot_number: " + lotNumber);
                System.out.println("[+] pass_token: " + passToken);
                System.out.println("[+] gen_time: " + genTime);
                System.out.println("[+] captcha_output: " + captchaOutput);
                System.out.println();
                System.out.println("Next step: submit these five values to the site's");
                System.out.println("GeeTest v4 verification endpoint.");
                return;
            }

            String request = jsonStr(resultResp, "request");

            if ("CAPCHA_NOT_READY".equals(request)) {
                System.out.println("[*] Not ready yet, waiting " + pollInterval + "s...");
                Thread.sleep(pollInterval * 1000L);
                elapsed += pollInterval;
                backoff = pollInterval;
                continue;
            }

            if (TRANSIENT_ERRORS.contains(request)) {
                System.out.println("[!] Transient error: " + request + ", retrying in " + backoff + "s...");
                Thread.sleep(backoff * 1000L);
                elapsed += backoff;
                backoff = Math.min(backoff * 2, 30);
                continue;
            }

            if (SOLVE_ERRORS.contains(request)) {
                System.out.println("[!] Solve error: " + request);
                System.out.println("    The CAPTCHA could not be solved. Verify parameters and retry.");
                System.exit(1);
            }

            System.out.println("[!] Unexpected error: " + request);
            System.exit(1);
        }

        System.out.println("[!] Timeout: no solution received within " + maxTimeout + " seconds.");
        System.exit(1);
    }

    static void loadEnv() {
        try {
            Path envPath = Paths.get("..", ".env");
            if (!Files.exists(envPath)) return;
            for (String line : Files.readAllLines(envPath)) {
                line = line.trim();
                if (line.isEmpty() || line.startsWith("#")) continue;
                int eq = line.indexOf('=');
                if (eq > 0) {
                    env.put(line.substring(0, eq).trim(), line.substring(eq + 1).trim());
                }
            }
        } catch (IOException ignored) {}
    }

    static String getEnv(String key, String fallback) {
        String v = env.get(key);
        if (v != null && !v.isEmpty()) return v;
        v = System.getenv(key);
        if (v != null && !v.isEmpty()) return v;
        return fallback;
    }

    static String httpGet(String urlStr) throws Exception {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setConnectTimeout(30000);
        conn.setReadTimeout(30000);
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) sb.append(line);
        reader.close();
        return sb.toString();
    }

    static String enc(String s) throws Exception {
        return URLEncoder.encode(s, "UTF-8");
    }

    static int jsonInt(String json, String key) {
        String pattern = "\"" + key + "\":";
        int idx = json.indexOf(pattern);
        if (idx < 0) return 0;
        int start = idx + pattern.length();
        StringBuilder sb = new StringBuilder();
        for (int i = start; i < json.length(); i++) {
            char c = json.charAt(i);
            if (c == ',' || c == '}') break;
            if (c != ' ') sb.append(c);
        }
        try { return Integer.parseInt(sb.toString()); } catch (Exception e) { return 0; }
    }

    static String jsonStr(String json, String key) {
        String pattern = "\"" + key + "\":\"";
        int idx = json.indexOf(pattern);
        if (idx < 0) return "";
        int start = idx + pattern.length();
        int end = json.indexOf("\"", start);
        if (end < 0) return "";
        return json.substring(start, end);
    }

    static String extractRequestValue(String json) {
        // Find "request": and extract the value — could be a JSON string or JSON object
        String pattern = "\"request\":";
        int idx = json.indexOf(pattern);
        if (idx < 0) return "";
        int start = idx + pattern.length();
        // Skip whitespace
        while (start < json.length() && json.charAt(start) == ' ') start++;
        if (start >= json.length()) return "";

        if (json.charAt(start) == '"') {
            // It's a JSON string — extract and unescape
            int end = start + 1;
            while (end < json.length()) {
                if (json.charAt(end) == '\\') { end += 2; continue; }
                if (json.charAt(end) == '"') break;
                end++;
            }
            String inner = json.substring(start + 1, end);
            return inner.replace("\\\"", "\"").replace("\\\\", "\\");
        } else if (json.charAt(start) == '{') {
            // It's a JSON object — find matching brace
            int depth = 0;
            int end = start;
            for (; end < json.length(); end++) {
                if (json.charAt(end) == '{') depth++;
                else if (json.charAt(end) == '}') { depth--; if (depth == 0) { end++; break; } }
            }
            return json.substring(start, end);
        }
        return "";
    }

    static void handleError(String error) {
        if (AUTH_ERRORS.contains(error)) {
            System.out.println("[!] Authentication error: " + error);
            System.out.println("    Check your API key at https://captchaai.com/dashboard");
        } else if (BALANCE_ERRORS.contains(error)) {
            System.out.println("[!] Balance error: " + error);
            System.out.println("    Top up your account at https://captchaai.com");
        } else if (INPUT_ERRORS.contains(error)) {
            System.out.println("[!] Input error: " + error);
            System.out.println("    Verify your gt (captcha_id) and page URL are correct.");
        } else if (PROXY_ERRORS.contains(error)) {
            System.out.println("[!] Proxy error: " + error);
            System.out.println("    Check your proxy configuration or try a different proxy.");
        } else {
            System.out.println("[!] Submission failed: " + error);
        }
    }
}
