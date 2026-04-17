/**
 * Solve {CAPTCHA_TYPE} using the CaptchaAI API.
 *
 * Usage:
 *   kotlinc solve.kt -include-runtime -d solve.jar
 *   java -jar solve.jar
 *
 * Requires .env file in parent directory with:
 *   CAPTCHAAI_API_KEY and CAPTCHA-specific variables
 */

import java.io.BufferedReader
import java.io.File
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URI
import java.net.URLEncoder
import kotlin.system.exitProcess

val SUBMIT_URL = "https://ocr.captchaai.com/in.php"
val RESULT_URL = "https://ocr.captchaai.com/res.php"

val AUTH_ERRORS = setOf("ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED")
val BALANCE_ERRORS = setOf("ERROR_ZERO_BALANCE")
val INPUT_ERRORS = setOf("ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS", "ERROR_BAD_TOKEN_OR_PAGEURL")
val TRANSIENT_ERRORS = setOf("ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR")
val SOLVE_ERRORS = setOf("ERROR_CAPTCHA_UNSOLVABLE")
val PROXY_ERRORS = setOf("ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED")

fun loadEnv(path: String): Map<String, String> {
    val env = mutableMapOf<String, String>()
    val file = File(path)
    if (!file.exists()) return env
    file.readLines().forEach { line ->
        val trimmed = line.trim()
        if (trimmed.isEmpty() || trimmed.startsWith("#")) return@forEach
        val idx = trimmed.indexOf('=')
        if (idx > 0) env[trimmed.substring(0, idx).trim()] = trimmed.substring(idx + 1).trim()
    }
    return env
}

fun getEnv(env: Map<String, String>, key: String, fallback: String = ""): String {
    val fromFile = env[key]
    if (!fromFile.isNullOrEmpty()) return fromFile
    val fromSys = System.getenv(key)
    if (!fromSys.isNullOrEmpty()) return fromSys
    return fallback
}

fun httpGet(url: String): String {
    val conn = URI(url).toURL().openConnection() as HttpURLConnection
    conn.requestMethod = "GET"
    conn.connectTimeout = 30000
    conn.readTimeout = 30000
    return BufferedReader(InputStreamReader(conn.inputStream)).readText()
}

fun parseStatus(json: String): Int {
    val regex = """"status"\s*:\s*(\d+)""".toRegex()
    return regex.find(json)?.groupValues?.get(1)?.toIntOrNull() ?: 0
}

fun parseRequest(json: String): String {
    val strRegex = """"request"\s*:\s*"([^"]+)"""".toRegex()
    strRegex.find(json)?.groupValues?.get(1)?.let { return it }
    val numRegex = """"request"\s*:\s*(\d+)""".toRegex()
    numRegex.find(json)?.groupValues?.get(1)?.let { return it }
    return "UNKNOWN_ERROR"
}

fun classifyError(error: String) {
    when {
        error in AUTH_ERRORS -> { println("[!] Authentication error: $error"); println("    Check your API key at https://captchaai.com/dashboard") }
        error in BALANCE_ERRORS -> { println("[!] Balance error: $error"); println("    Top up your account at https://captchaai.com") }
        error in INPUT_ERRORS -> { println("[!] Input error: $error"); println("    Verify your sitekey and page URL are correct.") }
        error in PROXY_ERRORS -> { println("[!] Proxy error: $error"); println("    Check your proxy configuration or try a different proxy.") }
        else -> println("[!] Submission failed: $error")
    }
}

fun main() {
    val env = loadEnv("../.env")
    val apiKey = getEnv(env, "CAPTCHAAI_API_KEY")
    // TODO: Add CAPTCHA-specific environment variables
    val pollInterval = getEnv(env, "POLL_INTERVAL", "5").toInt()
    val maxTimeout = getEnv(env, "MAX_TIMEOUT", "120").toInt()

    if (apiKey.isEmpty() || apiKey == "YOUR_API_KEY") {
        println("[!] ERROR: CAPTCHAAI_API_KEY is not set.")
        println("    Copy .env.example to .env and add your real API key.")
        exitProcess(1)
    }

    // Submit — TODO: Change method and add CAPTCHA-specific parameters
    println("[*] Submitting CAPTCHA task...")
    val enc = java.nio.charset.StandardCharsets.UTF_8.name()
    val submitParams = "key=${URLEncoder.encode(apiKey, enc)}&method=userrecaptcha&json=1"

    val submitBody: String
    try { submitBody = httpGet("$SUBMIT_URL?$submitParams") }
    catch (e: Exception) { println("[!] Network error during submission: ${e.message}"); exitProcess(1) }

    if (parseStatus(submitBody) != 1) { classifyError(parseRequest(submitBody)); exitProcess(1) }
    val taskId = parseRequest(submitBody)
    println("[+] Task submitted. ID: $taskId")

    // Poll
    println("[*] Waiting 15s before first poll...")
    Thread.sleep(15_000)

    val pollParams = "key=${URLEncoder.encode(apiKey, enc)}&action=get&id=${URLEncoder.encode(taskId, enc)}&json=1"
    var elapsed = 15; var attempt = 0; var backoff = pollInterval

    while (elapsed < maxTimeout) {
        attempt++
        println("[*] Polling for result (attempt $attempt)...")

        val pollBody: String
        try { pollBody = httpGet("$RESULT_URL?$pollParams") }
        catch (e: Exception) {
            println("[!] Network error during polling: ${e.message}")
            Thread.sleep(backoff * 1000L); elapsed += backoff; backoff = minOf(backoff * 2, 30); continue
        }

        val rStatus = parseStatus(pollBody); val rRequest = parseRequest(pollBody)
        if (rStatus == 1) {
            val truncated = if (rRequest.length > 50) rRequest.substring(0, 50) else rRequest
            println("[+] Solved! Token: $truncated..."); println("[+] Full token length: ${rRequest.length} characters")
            exitProcess(0)
        }
        if (rRequest == "CAPCHA_NOT_READY") {
            println("[*] Not ready yet, waiting ${pollInterval}s...")
            Thread.sleep(pollInterval * 1000L); elapsed += pollInterval; backoff = pollInterval; continue
        }
        if (rRequest in TRANSIENT_ERRORS) {
            println("[!] Transient error: $rRequest, retrying in ${backoff}s...")
            Thread.sleep(backoff * 1000L); elapsed += backoff; backoff = minOf(backoff * 2, 30); continue
        }
        if (rRequest in SOLVE_ERRORS) { println("[!] Solve error: $rRequest"); println("    The CAPTCHA could not be solved. Verify parameters and retry."); exitProcess(1) }
        if (rRequest in PROXY_ERRORS) { println("[!] Proxy error: $rRequest"); println("    Check your proxy configuration or try a different proxy."); exitProcess(1) }
        println("[!] Unexpected error: $rRequest"); exitProcess(1)
    }

    println("[!] Timeout: no solution received within $maxTimeout seconds."); exitProcess(1)
}
