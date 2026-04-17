import java.io.*;
import java.net.*;
import java.nio.file.*;
import java.util.*;

/**
 * Solve BLS CAPTCHA using the CaptchaAI API.
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
        String imageFile = getEnv("CAPTCHA_IMAGE_FILE", "");
        String instructions = getEnv("CAPTCHA_INSTRUCTIONS", "");
        int pollInterval = Integer.parseInt(getEnv("POLL_INTERVAL", "5"));
        int maxTimeout = Integer.parseInt(getEnv("MAX_TIMEOUT", "120"));

        // Validate
        if (apiKey.isEmpty() || apiKey.equals("YOUR_API_KEY")) {
            System.out.println("[!] ERROR: CAPTCHAAI_API_KEY is not set.");
            System.out.println("    Copy .env.example to .env and add your real API key.");
            System.exit(1);
        }
        if (imageFile.isEmpty()) {
            System.out.println("[!] ERROR: CAPTCHA_IMAGE_FILE is not set.");
            System.out.println("    Set the path to the CAPTCHA image file in .env.");
            System.exit(1);
        }
        Path imagePath = resolveImagePath(imageFile);
        if (!Files.exists(imagePath)) {
            System.out.println("[!] ERROR: Image file not found: " + imageFile);
            System.out.println("    Make sure the file exists and the path is correct.");
            System.exit(1);
        }
        if (instructions.isEmpty()) {
            System.out.println("[!] ERROR: CAPTCHA_INSTRUCTIONS is not set.");
            System.out.println("    Provide text instructions (e.g. 'Select all images with a car').");
            System.exit(1);
        }

        // Load image and base64-encode
        System.out.println("[*] Loading image from " + imageFile + "...");
        byte[] imageData = Files.readAllBytes(imagePath);
        String imageB64 = Base64.getEncoder().encodeToString(imageData);

        // Submit task via POST
        System.out.println("[*] Submitting BLS CAPTCHA task...");
        String postData = String.format(
            "key=%s&method=bls&body=%s&textinstructions=%s&json=1",
            enc(apiKey), enc(imageB64), enc(instructions)
        );

        String submitResp = httpPost(SUBMIT_URL, postData);
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
                String answer = jsonStr(resultResp, "request");
                System.out.println("[+] Solved! Answer: " + answer);
                System.out.println();
                System.out.println("Next step: use these selected indices to click the");
                System.out.println("corresponding images on the target page and submit.");
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

    static Path resolveImagePath(String imageFile) {
        Path parentPath = Paths.get("..", imageFile);
        if (Files.exists(parentPath)) return parentPath;
        return Paths.get(imageFile);
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

    static String httpPost(String urlStr, String postData) throws Exception {
        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setDoOutput(true);
        conn.setConnectTimeout(30000);
        conn.setReadTimeout(30000);
        conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
        try (OutputStream os = conn.getOutputStream()) {
            os.write(postData.getBytes("UTF-8"));
        }
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) sb.append(line);
        reader.close();
        return sb.toString();
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

    static void handleError(String error) {
        if (AUTH_ERRORS.contains(error)) {
            System.out.println("[!] Authentication error: " + error);
            System.out.println("    Check your API key at https://captchaai.com/dashboard");
        } else if (BALANCE_ERRORS.contains(error)) {
            System.out.println("[!] Balance error: " + error);
            System.out.println("    Top up your account at https://captchaai.com");
        } else if (INPUT_ERRORS.contains(error)) {
            System.out.println("[!] Input error: " + error);
            System.out.println("    Verify your image and instructions are correct.");
        } else if (PROXY_ERRORS.contains(error)) {
            System.out.println("[!] Proxy error: " + error);
            System.out.println("    Check your proxy configuration or try a different proxy.");
        } else {
            System.out.println("[!] Submission failed: " + error);
        }
    }
}
