<?php
/**
 * Solve Grid Image CAPTCHA using the CaptchaAI API.
 *
 * Usage:
 *   composer install
 *   cp ../.env.example ../.env   # then edit with your credentials
 *   php solve.php
 */

require __DIR__ . '/vendor/autoload.php';

$dotenv = Dotenv\Dotenv::createImmutable(dirname(__DIR__));
$dotenv->load();

define('SUBMIT_URL', 'https://ocr.captchaai.com/in.php');
define('RESULT_URL', 'https://ocr.captchaai.com/res.php');

$apiKey = $_ENV['CAPTCHAAI_API_KEY'] ?? '';
$imageFile = $_ENV['CAPTCHA_IMAGE_FILE'] ?? '';
$instructions = $_ENV['CAPTCHA_INSTRUCTIONS'] ?? '';
$pollInterval = (int)($_ENV['POLL_INTERVAL'] ?? 5);
$maxTimeout = (int)($_ENV['MAX_TIMEOUT'] ?? 120);

$authErrors = ['ERROR_WRONG_USER_KEY', 'ERROR_KEY_DOES_NOT_EXIST', 'IP_BANNED'];
$balanceErrors = ['ERROR_ZERO_BALANCE'];
$inputErrors = ['ERROR_PAGEURL', 'ERROR_WRONG_GOOGLEKEY', 'ERROR_BAD_PARAMETERS', 'ERROR_BAD_TOKEN_OR_PAGEURL'];
$transientErrors = ['ERROR_SERVER_ERROR', 'ERROR_INTERNAL_SERVER_ERROR'];
$solveErrors = ['ERROR_CAPTCHA_UNSOLVABLE'];
$proxyErrors = ['ERROR_BAD_PROXY', 'ERROR_PROXY_CONNECTION_FAILED'];

// --- Validate configuration ---
if (empty($apiKey) || $apiKey === 'YOUR_API_KEY') {
    echo "[!] ERROR: CAPTCHAAI_API_KEY is not set.\n";
    echo "    Copy .env.example to .env and add your real API key.\n";
    exit(1);
}
if (empty($imageFile)) {
    echo "[!] ERROR: CAPTCHA_IMAGE_FILE is not set.\n";
    echo "    Set the path to the grid CAPTCHA image file in .env.\n";
    exit(1);
}
$imagePath = dirname(__DIR__) . '/' . $imageFile;
if (!file_exists($imagePath)) {
    $imagePath = $imageFile;
}
if (!file_exists($imagePath)) {
    echo "[!] ERROR: Image file not found: $imageFile\n";
    echo "    Make sure the file exists and the path is correct.\n";
    exit(1);
}
if (empty($instructions)) {
    echo "[!] ERROR: CAPTCHA_INSTRUCTIONS is not set.\n";
    echo "    Provide text instructions (e.g. 'Select all squares with traffic lights').\n";
    exit(1);
}

// --- Load image and base64-encode ---
echo "[*] Loading grid image from $imageFile...\n";
$imageData = file_get_contents($imagePath);
$imageB64 = base64_encode($imageData);

// --- Submit task via POST ---
echo "[*] Submitting Grid Image CAPTCHA task...\n";
$postData = http_build_query([
    'key' => $apiKey,
    'method' => 'post',
    'body' => $imageB64,
    'recaptcha' => '1',
    'textinstructions' => $instructions,
    'json' => '1',
]);

$ctx = stream_context_create([
    'http' => [
        'method' => 'POST',
        'header' => 'Content-Type: application/x-www-form-urlencoded',
        'content' => $postData,
        'timeout' => 30,
    ],
]);
$submitResponse = @file_get_contents(SUBMIT_URL, false, $ctx);
if ($submitResponse === false) {
    echo "[!] Network error during submission.\n";
    exit(1);
}

$submitData = json_decode($submitResponse, true);
if (($submitData['status'] ?? 0) !== 1) {
    $error = $submitData['request'] ?? 'UNKNOWN_ERROR';
    if (in_array($error, $authErrors)) {
        echo "[!] Authentication error: $error\n";
        echo "    Check your API key at https://captchaai.com/dashboard\n";
    } elseif (in_array($error, $balanceErrors)) {
        echo "[!] Balance error: $error\n";
        echo "    Top up your account at https://captchaai.com\n";
    } elseif (in_array($error, $inputErrors)) {
        echo "[!] Input error: $error\n";
        echo "    Verify your image and instructions are correct.\n";
    } elseif (in_array($error, $proxyErrors)) {
        echo "[!] Proxy error: $error\n";
        echo "    Check your proxy configuration or try a different proxy.\n";
    } else {
        echo "[!] Submission failed: $error\n";
    }
    exit(1);
}

$taskId = $submitData['request'];
echo "[+] Task submitted. ID: $taskId\n";

// --- Poll for result ---
echo "[*] Waiting 15s before first poll...\n";
sleep(15);

$elapsed = 15;
$attempt = 0;
$backoff = $pollInterval;

$pollCtx = stream_context_create(['http' => ['timeout' => 30]]);

while ($elapsed < $maxTimeout) {
    $attempt++;
    echo "[*] Polling for result (attempt $attempt)...\n";

    $resultParams = http_build_query([
        'key' => $apiKey,
        'action' => 'get',
        'id' => $taskId,
        'json' => '1',
    ]);

    $resultResponse = @file_get_contents(RESULT_URL . '?' . $resultParams, false, $pollCtx);
    if ($resultResponse === false) {
        echo "[!] Network error during polling.\n";
        sleep($backoff);
        $elapsed += $backoff;
        $backoff = min($backoff * 2, 30);
        continue;
    }

    $resultData = json_decode($resultResponse, true);

    if (($resultData['status'] ?? 0) === 1) {
        $answer = $resultData['request'];
        echo "[+] Solved! Selected cells: $answer\n";
        echo "\n";
        echo "Next step: click the cells at the returned indices on\n";
        echo "the target page's grid and submit.\n";
        exit(0);
    }

    $error = $resultData['request'] ?? '';
    if ($error === 'CAPCHA_NOT_READY') {
        echo "[*] Not ready yet, waiting {$pollInterval}s...\n";
        sleep($pollInterval);
        $elapsed += $pollInterval;
        $backoff = $pollInterval;
        continue;
    }

    if (in_array($error, $transientErrors)) {
        echo "[!] Transient error: $error, retrying in {$backoff}s...\n";
        sleep($backoff);
        $elapsed += $backoff;
        $backoff = min($backoff * 2, 30);
        continue;
    }

    if (in_array($error, $solveErrors)) {
        echo "[!] Solve error: $error\n";
        echo "    The CAPTCHA could not be solved. Verify parameters and retry.\n";
        exit(1);
    }

    echo "[!] Unexpected error: $error\n";
    exit(1);
}

echo "[!] Timeout: no solution received within {$maxTimeout} seconds.\n";
exit(1);
