<?php
/**
 * Solve reCAPTCHA v3 Enterprise using the CaptchaAI API.
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
$googlekey = $_ENV['CAPTCHA_GOOGLEKEY'] ?? '';
$pageurl = $_ENV['CAPTCHA_PAGEURL'] ?? '';
$pollInterval = (int)($_ENV['POLL_INTERVAL'] ?? 5);
$maxTimeout = (int)($_ENV['MAX_TIMEOUT'] ?? 120);

$authErrors = ['ERROR_WRONG_USER_KEY', 'ERROR_KEY_DOES_NOT_EXIST', 'IP_BANNED'];
$balanceErrors = ['ERROR_ZERO_BALANCE'];
$inputErrors = ['ERROR_PAGEURL', 'ERROR_WRONG_GOOGLEKEY', 'ERROR_BAD_PARAMETERS', 'ERROR_BAD_TOKEN_OR_PAGEURL'];
$transientErrors = ['ERROR_SERVER_ERROR', 'ERROR_INTERNAL_SERVER_ERROR'];
$solveErrors = ['ERROR_CAPTCHA_UNSOLVABLE'];

// --- Validate configuration ---
if (empty($apiKey) || $apiKey === 'YOUR_API_KEY') {
    echo "[!] ERROR: CAPTCHAAI_API_KEY is not set.\n";
    echo "    Copy .env.example to .env and add your real API key.\n";
    exit(1);
}

// --- Submit task ---
echo "[*] Submitting reCAPTCHA v3 Enterprise task...\n";
$submitParams = http_build_query([
    'key' => $apiKey,
    'method' => 'userrecaptcha',
    'googlekey' => $googlekey,
    'pageurl' => $pageurl,
    'enterprise' => '1',
    'version' => 'v3',
    'action' => 'verify',
    'min_score' => '0.3',
    'json' => '1',
]);

$submitResponse = @file_get_contents(SUBMIT_URL . '?' . $submitParams);
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
        echo "    Verify your sitekey and page URL are correct.\n";
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

while ($elapsed < $maxTimeout) {
    $attempt++;
    echo "[*] Polling for result (attempt $attempt)...\n";

    $resultParams = http_build_query([
        'key' => $apiKey,
        'action' => 'get',
        'id' => $taskId,
        'json' => '1',
    ]);

    $resultResponse = @file_get_contents(RESULT_URL . '?' . $resultParams);
    if ($resultResponse === false) {
        echo "[!] Network error during polling.\n";
        sleep($backoff);
        $elapsed += $backoff;
        $backoff = min($backoff * 2, 30);
        continue;
    }

    $resultData = json_decode($resultResponse, true);

    if (($resultData['status'] ?? 0) === 1) {
        $token = $resultData['request'];
        echo "[+] Solved! Token: " . substr($token, 0, 50) . "...\n";
        echo "[+] Full token length: " . strlen($token) . " characters\n";
        echo "\n";
        echo "Next step: inject this token into the target page's\n";
        echo "g-recaptcha-response hidden field and submit the form.\n";
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
