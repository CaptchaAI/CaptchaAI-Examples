// Solve Cloudflare Turnstile using the CaptchaAI API.
//
// Usage:
//   go run solve.go
//
// Requires .env file in parent directory with:
//   CAPTCHAAI_API_KEY and CAPTCHA-specific variables

package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"net/http"
	"net/url"
	"os"
	"path/filepath"
	"strconv"
	"strings"
	"time"
)

const (
	submitURL = "https://ocr.captchaai.com/in.php"
	resultURL = "https://ocr.captchaai.com/res.php"
)

var (
	authErrors      = map[string]bool{"ERROR_WRONG_USER_KEY": true, "ERROR_KEY_DOES_NOT_EXIST": true, "IP_BANNED": true}
	balanceErrors   = map[string]bool{"ERROR_ZERO_BALANCE": true}
	inputErrors     = map[string]bool{"ERROR_PAGEURL": true, "ERROR_WRONG_GOOGLEKEY": true, "ERROR_BAD_PARAMETERS": true, "ERROR_BAD_TOKEN_OR_PAGEURL": true}
	transientErrors = map[string]bool{"ERROR_SERVER_ERROR": true, "ERROR_INTERNAL_SERVER_ERROR": true}
	solveErrors     = map[string]bool{"ERROR_CAPTCHA_UNSOLVABLE": true}
	proxyErrors     = map[string]bool{"ERROR_BAD_PROXY": true, "ERROR_PROXY_CONNECTION_FAILED": true}
)

type apiResponse struct {
	Status  int `json:"status"`
	Request any `json:"request"`
}

func requestValue(value any) string {
	switch v := value.(type) {
	case nil:
		return ""
	case string:
		return v
	case float64:
		return strconv.FormatInt(int64(v), 10)
	case json.Number:
		return v.String()
	default:
		return fmt.Sprintf("%v", v)
	}
}

func loadEnv(path string) map[string]string {
	env := make(map[string]string)
	f, err := os.Open(path)
	if err != nil {
		return env
	}
	defer f.Close()
	scanner := bufio.NewScanner(f)
	for scanner.Scan() {
		line := strings.TrimSpace(scanner.Text())
		if line == "" || strings.HasPrefix(line, "#") {
			continue
		}
		parts := strings.SplitN(line, "=", 2)
		if len(parts) == 2 {
			env[strings.TrimSpace(parts[0])] = strings.TrimSpace(parts[1])
		}
	}
	return env
}

func getEnv(env map[string]string, key, fallback string) string {
	if v, ok := env[key]; ok && v != "" {
		return v
	}
	if v := os.Getenv(key); v != "" {
		return v
	}
	return fallback
}

func getEnvInt(env map[string]string, key string, fallback int) int {
	s := getEnv(env, key, "")
	if s == "" {
		return fallback
	}
	v, err := strconv.Atoi(s)
	if err != nil {
		return fallback
	}
	return v
}

func classifyError(errCode string) {
	switch {
	case authErrors[errCode]:
		fmt.Printf("[!] Authentication error: %s\n", errCode)
		fmt.Println("    Check your API key at https://captchaai.com/dashboard")
	case balanceErrors[errCode]:
		fmt.Printf("[!] Balance error: %s\n", errCode)
		fmt.Println("    Top up your account at https://captchaai.com")
	case inputErrors[errCode]:
		fmt.Printf("[!] Input error: %s\n", errCode)
		fmt.Println("    Verify your sitekey and page URL are correct.")
	case proxyErrors[errCode]:
		fmt.Printf("[!] Proxy error: %s\n", errCode)
		fmt.Println("    Check your proxy configuration or try a different proxy.")
	case solveErrors[errCode]:
		fmt.Printf("[!] Solve error: %s\n", errCode)
		fmt.Println("    The CAPTCHA could not be solved. Verify parameters and retry.")
	default:
		fmt.Printf("[!] Submission failed: %s\n", errCode)
	}
}

func main() {
	envPath := filepath.Join("..", ".env")
	env := loadEnv(envPath)

	apiKey := getEnv(env, "CAPTCHAAI_API_KEY", "")
	sitekey := getEnv(env, "CAPTCHA_SITEKEY", "")
	pageurl := getEnv(env, "CAPTCHA_PAGEURL", "")
	pollInterval := getEnvInt(env, "POLL_INTERVAL", 5)
	maxTimeout := getEnvInt(env, "MAX_TIMEOUT", 120)

	// Validate
	if apiKey == "" || apiKey == "YOUR_API_KEY" {
		fmt.Println("[!] ERROR: CAPTCHAAI_API_KEY is not set.")
		fmt.Println("    Copy .env.example to .env and add your real API key.")
		os.Exit(1)
	}

	// Submit
	fmt.Println("[*] Submitting Cloudflare Turnstile task...")
	params := url.Values{
		"key":     {apiKey},
		"method":  {"turnstile"},
		"sitekey": {sitekey},
		"pageurl": {pageurl},
		"json":    {"1"},
	}

	client := &http.Client{Timeout: 30 * time.Second}
	resp, err := client.Get(submitURL + "?" + params.Encode())
	if err != nil {
		fmt.Printf("[!] Network error during submission: %s\n", err)
		os.Exit(1)
	}
	defer resp.Body.Close()

	var submitData apiResponse
	if err := json.NewDecoder(resp.Body).Decode(&submitData); err != nil {
		fmt.Printf("[!] Failed to parse submission response: %s\n", err)
		os.Exit(1)
	}

	if submitData.Status != 1 {
		classifyError(requestValue(submitData.Request))
		os.Exit(1)
	}

	taskID := requestValue(submitData.Request)
	fmt.Printf("[+] Task submitted. ID: %s\n", taskID)

	// Poll
	fmt.Println("[*] Waiting 15s before first poll...")
	time.Sleep(15 * time.Second)

	pollParams := url.Values{
		"key":    {apiKey},
		"action": {"get"},
		"id":     {taskID},
		"json":   {"1"},
	}

	elapsed := 15
	attempt := 0
	backoff := pollInterval

	for elapsed < maxTimeout {
		attempt++
		fmt.Printf("[*] Polling for result (attempt %d)...\n", attempt)

		resp, err := client.Get(resultURL + "?" + pollParams.Encode())
		if err != nil {
			fmt.Printf("[!] Network error during polling: %s\n", err)
			time.Sleep(time.Duration(backoff) * time.Second)
			elapsed += backoff
			if backoff < 30 {
				backoff *= 2
			}
			continue
		}

		var resultData apiResponse
		if err := json.NewDecoder(resp.Body).Decode(&resultData); err != nil {
			resp.Body.Close()
			fmt.Printf("[!] Failed to parse poll response: %s\n", err)
			time.Sleep(time.Duration(backoff) * time.Second)
			elapsed += backoff
			continue
		}
		resp.Body.Close()

		if resultData.Status == 1 {
			token := requestValue(resultData.Request)
			truncated := token
			if len(truncated) > 50 {
				truncated = truncated[:50]
			}
			fmt.Printf("[+] Solved! Token: %s...\n", truncated)
			fmt.Printf("[+] Full token length: %d characters\n", len(token))
			os.Exit(0)
		}

		errCode := requestValue(resultData.Request)
		if errCode == "CAPCHA_NOT_READY" {
			fmt.Printf("[*] Not ready yet, waiting %ds...\n", pollInterval)
			time.Sleep(time.Duration(pollInterval) * time.Second)
			elapsed += pollInterval
			backoff = pollInterval
			continue
		}

		if transientErrors[errCode] {
			fmt.Printf("[!] Transient error: %s, retrying in %ds...\n", errCode, backoff)
			time.Sleep(time.Duration(backoff) * time.Second)
			elapsed += backoff
			if backoff < 30 {
				backoff *= 2
			}
			continue
		}

		if solveErrors[errCode] {
			fmt.Printf("[!] Solve error: %s\n", errCode)
			fmt.Println("    The CAPTCHA could not be solved. Verify parameters and retry.")
			os.Exit(1)
		}

		if proxyErrors[errCode] {
			fmt.Printf("[!] Proxy error: %s\n", errCode)
			fmt.Println("    Check your proxy configuration or try a different proxy.")
			os.Exit(1)
		}

		fmt.Printf("[!] Unexpected error: %s\n", errCode)
		os.Exit(1)
	}

	fmt.Printf("[!] Timeout: no solution received within %d seconds.\n", maxTimeout)
	os.Exit(1)
}
