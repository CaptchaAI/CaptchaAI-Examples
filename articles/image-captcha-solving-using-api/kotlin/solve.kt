// Solve Image CAPTCHA using the CaptchaAI API.
//
// Usage:
//   kotlinc solve.kt -include-runtime -d solve.jar
//   java -jar solve.jar

import java.io.BufferedReader
import java.io.InputStreamReader
import java.io.OutputStreamWriter
import java.net.HttpURLConnection
import java.net.URL
import java.net.URLEncoder
import java.io.File
import java.nio.file.Files
import java.nio.file.Paths
import java.util.Base64

val SUBMIT_URL = "https://ocr.captchaai.com/in.php"
val RESULT_URL = "https://ocr.captchaai.com/res.php"

val AUTH_ERRORS = setOf("ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED")
val BALANCE_ERRORS = setOf("ERROR_ZERO_BALANCE")
val INPUT_ERRORS = setOf(
    "ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS",
    "ERROR_BAD_TOKEN_OR_PAGEURL", "ERROR_WRONG_FILE_EXTENSION",
    "ERROR_TOO_BIG_CAPTCHA_FILESIZE", "ERROR_EMPTY_CAPTCHA"
)
val TRANSIENT_ERRORS = setOf("ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR")
val SOLVE_ERRORS = setOf("ERROR_CAPTCHA_UNSOLVABLE")
val PROXY_ERRORS = setOf("ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED")

fun loadEnv(path: String): Map<String, String> {
    val env = mutableMapOf<String, String>()
    val file = File(path)
    if (!file.exists()) return env
    file.readLines().forEach { line ->
        val trimmed = line.trim()
        if (trimmed.isNotEmpty() && !trimmed.startsWith("#")) {
            val eq = trimmed.indexOf('=')
            if (eq > 0) {
                env[trimmed.substring(0, eq).trim()] = trimmed.substring(eq + 1).trim()
            }
        }
    }
    return env
}

fun getEnv(env: Map<String, String>, key: String, fallback: String = ""): String {
    val v = env[key]
    if (!v.isNullOrEmpty()) return v
    val sv = System.getenv(key)
    if (!sv.isNullOrEmpty()) return sv
    return fallback
}

fun httpPost(urlStr: String, postData: String): String {
    val conn = URL(urlStr).openConnection() as HttpURLConnection
    conn.requestMethod = "POST"
    conn.doOutput = true
    conn.connectTimeout = 30000
    conn.readTimeout = 30000
    conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded")
    OutputStreamWriter(conn.outputStream).use { it.write(postData); it.flush() }
    val reader = BufferedReader(InputStreamReader(conn.inputStream))
    val result = reader.readText()
    reader.close()
    return result
}

fun httpGet(urlStr: String): String {
    val conn = URL(urlStr).openConnection() as HttpURLConnection
    conn.connectTimeout = 30000
    conn.readTimeout = 30000
    val reader = BufferedReader(InputStreamReader(conn.inputStream))
    val result = reader.readText()
    reader.close()
    return result
}

fun jsonStr(json: String, key: String): String {
    val pattern = "\"$key\":\""
    val idx = json.indexOf(pattern)
    if (idx < 0) return ""
    val start = idx + pattern.length
    val end = json.indexOf("\"", start)
    if (end < 0) return ""
    return json.substring(start, end)
}

fun jsonInt(json: String, key: String): Int {
    val pattern = "\"$key\":"
    val idx = json.indexOf(pattern)
    if (idx < 0) return 0
    val start = idx + pattern.length
    val numStr = json.substring(start).takeWhile { it.isDigit() || it == '-' }
    return numStr.toIntOrNull() ?: 0
}

fun handleError(error: String) {
    when {
        error in AUTH_ERRORS -> {
            println("[!] Authentication error: $error")
            println("    Check your API key at https://captchaai.com/dashboard")
        }
        error in BALANCE_ERRORS -> {
            println("[!] Balance error: $error")
            println("    Top up your account at https://captchaai.com")
        }
        error in INPUT_ERRORS -> {
            println("[!] Input error: $error")
            println("    Verify your image file is valid and not too large.")
        }
        error in PROXY_ERRORS -> {
            println("[!] Proxy error: $error")
            println("    Check your proxy configuration or try a different proxy.")
        }
        else -> println("[!] Submission failed: $error")
    }
}

fun enc(s: String) = URLEncoder.encode(s, "UTF-8")

fun resolveImagePath(imageFile: String): String {
    val parentPath = "../$imageFile"
    if (File(parentPath).exists()) return parentPath
    return imageFile
}

fun main() {
    val env = loadEnv("../.env")
    val apiKey = getEnv(env, "CAPTCHAAI_API_KEY")
    val imageFile = getEnv(env, "CAPTCHA_IMAGE_FILE", "captcha.png")
    val pollInterval = getEnv(env, "POLL_INTERVAL", "5").toInt()
    val maxTimeout = getEnv(env, "MAX_TIMEOUT", "120").toInt()

    // Validate
    if (apiKey.isEmpty() || apiKey == "YOUR_API_KEY") {
        println("[!] ERROR: CAPTCHAAI_API_KEY is not set.")
        println("    Copy .env.example to .env and add your real API key.")
        System.exit(1)
    }
    if (imageFile.isEmpty()) {
        println("[!] ERROR: CAPTCHA_IMAGE_FILE is not set.")
        println("    Set the path to the CAPTCHA image file in .env.")
        System.exit(1)
    }
    val imagePath = resolveImagePath(imageFile)
    if (!File(imagePath).exists()) {
        println("[!] ERROR: Image file not found: $imageFile")
        println("    Make sure the file exists and the path is correct.")
        System.exit(1)
    }

    // Load image and base64-encode
    println("[*] Loading image from $imageFile...")
    val imageData = Files.readAllBytes(Paths.get(imagePath))
    val imageB64 = Base64.getEncoder().encodeToString(imageData)

    // Submit task via POST
    println("[*] Submitting Image CAPTCHA task...")
    val postData = "key=${enc(apiKey)}&method=base64&body=${enc(imageB64)}&json=1"

    val submitResp = try {
        httpPost(SUBMIT_URL, postData)
    } catch (e: Exception) {
        println("[!] Network error during submission: ${e.message}")
        System.exit(1)
        return
    }

    val submitStatus = jsonInt(submitResp, "status")
    val submitRequest = jsonStr(submitResp, "request")

    if (submitStatus != 1) {
        handleError(submitRequest)
        System.exit(1)
    }

    val taskId = submitRequest
    println("[+] Task submitted. ID: $taskId")

    // Poll for result
    println("[*] Waiting 10s before first poll...")
    Thread.sleep(10000)

    var elapsed = 10
    var attempt = 0
    var backoff = pollInterval

    while (elapsed < maxTimeout) {
        attempt++
        println("[*] Polling for result (attempt $attempt)...")

        val pollParams = "key=${enc(apiKey)}&action=get&id=${enc(taskId)}&json=1"

        val resultResp = try {
            httpGet("$RESULT_URL?$pollParams")
        } catch (e: Exception) {
            println("[!] Network error during polling: ${e.message}")
            Thread.sleep(backoff * 1000L)
            elapsed += backoff
            backoff = minOf(backoff * 2, 30)
            continue
        }

        val status = jsonInt(resultResp, "status")

        if (status == 1) {
            val text = jsonStr(resultResp, "request")
            println("[+] Solved! Text: $text")
            println()
            println("Next step: enter this text into the CAPTCHA input field")
            println("on the target page and submit the form.")
            return
        }

        val request = jsonStr(resultResp, "request")

        if (request == "CAPCHA_NOT_READY") {
            println("[*] Not ready yet, waiting ${pollInterval}s...")
            Thread.sleep(pollInterval * 1000L)
            elapsed += pollInterval
            backoff = pollInterval
            continue
        }

        if (request in TRANSIENT_ERRORS) {
            println("[!] Transient error: $request, retrying in ${backoff}s...")
            Thread.sleep(backoff * 1000L)
            elapsed += backoff
            backoff = minOf(backoff * 2, 30)
            continue
        }

        if (request in SOLVE_ERRORS) {
            println("[!] Solve error: $request")
            println("    The CAPTCHA could not be solved. Verify the image and retry.")
            System.exit(1)
        }

        println("[!] Unexpected error: $request")
        System.exit(1)
    }

    println("[!] Timeout: no solution received within ${maxTimeout} seconds.")
    System.exit(1)
}
