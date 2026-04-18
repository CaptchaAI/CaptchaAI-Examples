// Solve {CAPTCHA_TYPE} using the CaptchaAI API.
//
// Usage:
//   dotnet run
//
// Requires .env file in parent directory with:
//   CAPTCHAAI_API_KEY and CAPTCHA-specific variables

using System;
using System.Collections.Generic;
using System.IO;
using System.Net.Http;
using System.Text.Json;
using System.Threading.Tasks;

class Solve
{
    private const string SubmitUrl = "https://ocr.captchaai.com/in.php";
    private const string ResultUrl = "https://ocr.captchaai.com/res.php";

    private static readonly HashSet<string> AuthErrors = new()
        { "ERROR_WRONG_USER_KEY", "ERROR_KEY_DOES_NOT_EXIST", "IP_BANNED" };
    private static readonly HashSet<string> BalanceErrors = new()
        { "ERROR_ZERO_BALANCE" };
    private static readonly HashSet<string> InputErrors = new()
        { "ERROR_PAGEURL", "ERROR_WRONG_GOOGLEKEY", "ERROR_BAD_PARAMETERS", "ERROR_BAD_TOKEN_OR_PAGEURL" };
    private static readonly HashSet<string> TransientErrors = new()
        { "ERROR_SERVER_ERROR", "ERROR_INTERNAL_SERVER_ERROR" };
    private static readonly HashSet<string> SolveErrors = new()
        { "ERROR_CAPTCHA_UNSOLVABLE" };
    private static readonly HashSet<string> ProxyErrors = new()
        { "ERROR_BAD_PROXY", "ERROR_PROXY_CONNECTION_FAILED" };

    private static readonly HttpClient Client = new() { Timeout = TimeSpan.FromSeconds(30) };

    private readonly string _apiKey;
    private readonly int _pollInterval;
    private readonly int _maxTimeout;
    // TODO: Add CAPTCHA-specific fields

    public Solve(Dictionary<string, string> env)
    {
        _apiKey = GetEnv(env, "CAPTCHAAI_API_KEY", "");
        // TODO: Add CAPTCHA-specific environment variables
        _pollInterval = int.Parse(GetEnv(env, "POLL_INTERVAL", "5"));
        _maxTimeout = int.Parse(GetEnv(env, "MAX_TIMEOUT", "120"));
    }

    private static string GetEnv(Dictionary<string, string> env, string key, string fallback)
    {
        if (env.TryGetValue(key, out var val) && !string.IsNullOrEmpty(val)) return val;
        var sysVal = Environment.GetEnvironmentVariable(key);
        return !string.IsNullOrEmpty(sysVal) ? sysVal : fallback;
    }

    private void ValidateConfig()
    {
        if (string.IsNullOrEmpty(_apiKey) || _apiKey == "YOUR_API_KEY")
        {
            Console.WriteLine("[!] ERROR: CAPTCHAAI_API_KEY is not set.");
            Console.WriteLine("    Copy .env.example to .env and add your real API key.");
            Environment.Exit(1);
        }
    }

    private async Task<string> SubmitTaskAsync()
    {
        Console.WriteLine("[*] Submitting CAPTCHA task...");
        var query = $"key={Uri.EscapeDataString(_apiKey)}" +
                    $"&method=userrecaptcha" + // TODO: Change method for your CAPTCHA type
                    // TODO: Add CAPTCHA-specific parameters
                    $"&json=1";

        string body;
        try { body = await Client.GetStringAsync($"{SubmitUrl}?{query}"); }
        catch (Exception ex)
        {
            Console.WriteLine($"[!] Network error during submission: {ex.Message}");
            Environment.Exit(1); return "";
        }

        using var doc = JsonDocument.Parse(body);
        var root = doc.RootElement;
        var status = root.GetProperty("status").GetInt32();
        var request = root.GetProperty("request").ToString();

        if (status != 1) { ClassifyError(request); Environment.Exit(1); }

        Console.WriteLine($"[+] Task submitted. ID: {request}");
        return request;
    }

    private async Task<string> PollResultAsync(string taskId)
    {
        Console.WriteLine("[*] Waiting 15s before first poll...");
        await Task.Delay(15000);

        var query = $"key={Uri.EscapeDataString(_apiKey)}&action=get&id={Uri.EscapeDataString(taskId)}&json=1";
        var elapsed = 15; var attempt = 0; var backoff = _pollInterval;

        while (elapsed < _maxTimeout)
        {
            attempt++;
            Console.WriteLine($"[*] Polling for result (attempt {attempt})...");

            string body;
            try { body = await Client.GetStringAsync($"{ResultUrl}?{query}"); }
            catch (Exception ex)
            {
                Console.WriteLine($"[!] Network error during polling: {ex.Message}");
                await Task.Delay(backoff * 1000);
                elapsed += backoff; backoff = Math.Min(backoff * 2, 30); continue;
            }

            using var doc = JsonDocument.Parse(body);
            var root = doc.RootElement;
            var status = root.GetProperty("status").GetInt32();
            var request = root.GetProperty("request").ToString();

            if (status == 1) return request;
            if (request == "CAPCHA_NOT_READY")
            {
                Console.WriteLine($"[*] Not ready yet, waiting {_pollInterval}s...");
                await Task.Delay(_pollInterval * 1000);
                elapsed += _pollInterval; backoff = _pollInterval; continue;
            }
            if (TransientErrors.Contains(request))
            {
                Console.WriteLine($"[!] Transient error: {request}, retrying in {backoff}s...");
                await Task.Delay(backoff * 1000);
                elapsed += backoff; backoff = Math.Min(backoff * 2, 30); continue;
            }
            if (SolveErrors.Contains(request))
            {
                Console.WriteLine($"[!] Solve error: {request}");
                Console.WriteLine("    The CAPTCHA could not be solved. Verify parameters and retry.");
                Environment.Exit(1);
            }
            if (ProxyErrors.Contains(request))
            {
                Console.WriteLine($"[!] Proxy error: {request}");
                Console.WriteLine("    Check your proxy configuration or try a different proxy.");
                Environment.Exit(1);
            }
            Console.WriteLine($"[!] Unexpected error: {request}");
            Environment.Exit(1);
        }

        Console.WriteLine($"[!] Timeout: no solution received within {_maxTimeout} seconds.");
        Environment.Exit(1); return "";
    }

    private static void ClassifyError(string error)
    {
        if (AuthErrors.Contains(error)) { Console.WriteLine($"[!] Authentication error: {error}"); Console.WriteLine("    Check your API key at https://captchaai.com/dashboard"); }
        else if (BalanceErrors.Contains(error)) { Console.WriteLine($"[!] Balance error: {error}"); Console.WriteLine("    Top up your account at https://captchaai.com"); }
        else if (InputErrors.Contains(error)) { Console.WriteLine($"[!] Input error: {error}"); Console.WriteLine("    Verify your sitekey and page URL are correct."); }
        else if (ProxyErrors.Contains(error)) { Console.WriteLine($"[!] Proxy error: {error}"); Console.WriteLine("    Check your proxy configuration or try a different proxy."); }
        else Console.WriteLine($"[!] Submission failed: {error}");
    }

    private static Dictionary<string, string> LoadEnv(string path)
    {
        var env = new Dictionary<string, string>();
        if (!File.Exists(path)) return env;
        foreach (var line in File.ReadAllLines(path))
        {
            var trimmed = line.Trim();
            if (string.IsNullOrEmpty(trimmed) || trimmed.StartsWith('#')) continue;
            var idx = trimmed.IndexOf('=');
            if (idx > 0) env[trimmed[..idx].Trim()] = trimmed[(idx + 1)..].Trim();
        }
        return env;
    }

    public static async Task Main(string[] args)
    {
        var env = LoadEnv(Path.Combine("..", ".env"));
        var solver = new Solve(env);
        solver.ValidateConfig();
        var taskId = await solver.SubmitTaskAsync();
        var token = await solver.PollResultAsync(taskId);
        var truncated = token.Length > 50 ? token[..50] : token;
        Console.WriteLine($"[+] Solved! Token: {truncated}...");
        Console.WriteLine($"[+] Full token length: {token.Length} characters");
    }
}
