// Solve GeeTest v4 using the CaptchaAI API.
//
// Usage:
//   dotnet run

using System.Text.Json;

const string SubmitUrl = "https://ocr.captchaai.com/in.php";
const string ResultUrl = "https://ocr.captchaai.com/res.php";

var authErrors = new HashSet<string> { "ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED" };
var balanceErrors = new HashSet<string> { "ERROR_ZERO_BALANCE" };
var inputErrors = new HashSet<string> { "ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS", "ERROR_BAD_TOKEN_OR_PAGEURL" };
var transientErrors = new HashSet<string> { "ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR" };
var solveErrors = new HashSet<string> { "ERROR_CAPTCHA_UNSOLVABLE" };
var proxyErrors = new HashSet<string> { "ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED" };

var env = LoadEnv(Path.Combine("..", ".env"));
string apiKey = GetEnv(env, "CAPTCHAAI_API_KEY", "");
string gt = GetEnv(env, "CAPTCHA_GT", "");
string pageurl = GetEnv(env, "CAPTCHA_PAGEURL", "");
int pollInterval = int.Parse(GetEnv(env, "POLL_INTERVAL", "5"));
int maxTimeout = int.Parse(GetEnv(env, "MAX_TIMEOUT", "120"));

// Validate
if (string.IsNullOrEmpty(apiKey) || apiKey == "YOUR_API_KEY")
{
    Console.WriteLine("[!] ERROR: CAPTCHAAI_API_KEY is not set.");
    Console.WriteLine("    Copy .env.example to .env and add your real API key.");
    Environment.Exit(1);
}
if (string.IsNullOrEmpty(gt) || gt == "YOUR_CAPTCHA_ID")
{
    Console.WriteLine("[!] ERROR: CAPTCHA_GT is not set.");
    Console.WriteLine("    Find the captcha_id in the page source or GeeTest v4 initialization call.");
    Environment.Exit(1);
}
if (string.IsNullOrEmpty(pageurl) || pageurl == "https://example.com")
{
    Console.WriteLine("[!] WARNING: CAPTCHA_PAGEURL may not be set correctly.");
    Console.WriteLine("    Make sure it points to the actual target page.");
}

using var client = new HttpClient { Timeout = TimeSpan.FromSeconds(30) };

// Submit task
Console.WriteLine("[*] Submitting GeeTest v4 task...");
var submitQuery = $"key={Uri.EscapeDataString(apiKey)}&method=geetest&gt={Uri.EscapeDataString(gt)}&pageurl={Uri.EscapeDataString(pageurl)}&version=4&json=1";

string submitBody;
try
{
    submitBody = await client.GetStringAsync($"{SubmitUrl}?{submitQuery}");
}
catch (Exception ex)
{
    Console.WriteLine($"[!] Network error during submission: {ex.Message}");
    Environment.Exit(1);
    return;
}

using var submitDoc = JsonDocument.Parse(submitBody);
int submitStatus = submitDoc.RootElement.GetProperty("status").GetInt32();
string submitRequest = submitDoc.RootElement.GetProperty("request").GetString() ?? "";

if (submitStatus != 1)
{
    HandleError(submitRequest, authErrors, balanceErrors, inputErrors, proxyErrors);
    Environment.Exit(1);
}

string taskId = submitRequest;
Console.WriteLine($"[+] Task submitted. ID: {taskId}");

// Poll for result
Console.WriteLine("[*] Waiting 15s before first poll...");
await Task.Delay(15000);

int elapsed = 15;
int attempt = 0;
int backoff = pollInterval;

while (elapsed < maxTimeout)
{
    attempt++;
    Console.WriteLine($"[*] Polling for result (attempt {attempt})...");

    var pollQuery = $"key={Uri.EscapeDataString(apiKey)}&action=get&id={Uri.EscapeDataString(taskId)}&json=1";

    string resultBody;
    try
    {
        resultBody = await client.GetStringAsync($"{ResultUrl}?{pollQuery}");
    }
    catch (Exception ex)
    {
        Console.WriteLine($"[!] Network error during polling: {ex.Message}");
        await Task.Delay(backoff * 1000);
        elapsed += backoff;
        backoff = Math.Min(backoff * 2, 30);
        continue;
    }

    using var resultDoc = JsonDocument.Parse(resultBody);
    int status = resultDoc.RootElement.GetProperty("status").GetInt32();
    var requestElement = resultDoc.RootElement.GetProperty("request");

    if (status == 1)
    {
        // The request field contains a JSON string or object with the 5 GeeTest v4 values
        JsonDocument solutionDoc;
        if (requestElement.ValueKind == JsonValueKind.String)
        {
            solutionDoc = JsonDocument.Parse(requestElement.GetString()!);
        }
        else
        {
            solutionDoc = JsonDocument.Parse(requestElement.GetRawText());
        }

        string captchaId = solutionDoc.RootElement.GetProperty("captcha_id").GetString() ?? "";
        string lotNumber = solutionDoc.RootElement.GetProperty("lot_number").GetString() ?? "";
        string passToken = solutionDoc.RootElement.GetProperty("pass_token").GetString() ?? "";
        string genTime = solutionDoc.RootElement.GetProperty("gen_time").GetString() ?? "";
        string captchaOutput = solutionDoc.RootElement.GetProperty("captcha_output").GetString() ?? "";
        solutionDoc.Dispose();

        Console.WriteLine("[+] Solved!");
        Console.WriteLine($"[+] captcha_id: {captchaId}");
        Console.WriteLine($"[+] lot_number: {lotNumber}");
        Console.WriteLine($"[+] pass_token: {passToken}");
        Console.WriteLine($"[+] gen_time: {genTime}");
        Console.WriteLine($"[+] captcha_output: {captchaOutput}");
        Console.WriteLine();
        Console.WriteLine("Next step: submit these five values to the site's");
        Console.WriteLine("GeeTest v4 verification endpoint.");
        return;
    }

    string request = requestElement.ValueKind == JsonValueKind.String
        ? requestElement.GetString() ?? ""
        : "";

    if (request == "CAPCHA_NOT_READY")
    {
        Console.WriteLine($"[*] Not ready yet, waiting {pollInterval}s...");
        await Task.Delay(pollInterval * 1000);
        elapsed += pollInterval;
        backoff = pollInterval;
        continue;
    }

    if (transientErrors.Contains(request))
    {
        Console.WriteLine($"[!] Transient error: {request}, retrying in {backoff}s...");
        await Task.Delay(backoff * 1000);
        elapsed += backoff;
        backoff = Math.Min(backoff * 2, 30);
        continue;
    }

    if (solveErrors.Contains(request))
    {
        Console.WriteLine($"[!] Solve error: {request}");
        Console.WriteLine("    The CAPTCHA could not be solved. Verify parameters and retry.");
        Environment.Exit(1);
    }

    Console.WriteLine($"[!] Unexpected error: {request}");
    Environment.Exit(1);
}

Console.WriteLine($"[!] Timeout: no solution received within {maxTimeout} seconds.");
Environment.Exit(1);

static Dictionary<string, string> LoadEnv(string path)
{
    var dict = new Dictionary<string, string>();
    if (!File.Exists(path)) return dict;
    foreach (var line in File.ReadAllLines(path))
    {
        var trimmed = line.Trim();
        if (string.IsNullOrEmpty(trimmed) || trimmed.StartsWith('#')) continue;
        var eq = trimmed.IndexOf('=');
        if (eq > 0)
            dict[trimmed[..eq].Trim()] = trimmed[(eq + 1)..].Trim();
    }
    return dict;
}

static string GetEnv(Dictionary<string, string> env, string key, string fallback)
{
    if (env.TryGetValue(key, out var v) && !string.IsNullOrEmpty(v)) return v;
    v = Environment.GetEnvironmentVariable(key);
    if (!string.IsNullOrEmpty(v)) return v;
    return fallback;
}

static void HandleError(string error, HashSet<string> auth, HashSet<string> balance, HashSet<string> input, HashSet<string> proxy)
{
    if (auth.Contains(error))
    {
        Console.WriteLine($"[!] Authentication error: {error}");
        Console.WriteLine("    Check your API key at https://captchaai.com/dashboard");
    }
    else if (balance.Contains(error))
    {
        Console.WriteLine($"[!] Balance error: {error}");
        Console.WriteLine("    Top up your account at https://captchaai.com");
    }
    else if (input.Contains(error))
    {
        Console.WriteLine($"[!] Input error: {error}");
        Console.WriteLine("    Verify your gt (captcha_id) and page URL are correct.");
    }
    else if (proxy.Contains(error))
    {
        Console.WriteLine($"[!] Proxy error: {error}");
        Console.WriteLine("    Check your proxy configuration or try a different proxy.");
    }
    else
    {
        Console.WriteLine($"[!] Submission failed: {error}");
    }
}
