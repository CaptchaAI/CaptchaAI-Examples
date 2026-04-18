// Solve GeeTest v3 using the CaptchaAI API.
//
// Usage:
//   go run solve.go

package main

import (
	"bufio"
	"encoding/json"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
	"path/filepath"
	"strconv"
	"strings"
	"time"
)

const submitURL = "https://ocr.captchaai.com/in.php"
const resultURL = "https://ocr.captchaai.com/res.php"

var authErrors = map[string]bool{"ERROR_WRONG_USER_KEY": true, "ERROR_KEY_DOES_NOT_EXIST": true, "IP_BANNED": true}
var balanceErrors = map[string]bool{"ERROR_ZERO_BALANCE": true}
var inputErrors = map[string]bool{"ERROR_PAGEURL": true, "ERROR_WRONG_GOOGLEKEY": true, "ERROR_BAD_PARAMETERS": true, "ERROR_BAD_TOKEN_OR_PAGEURL": true}
var transientErrors = map[string]bool{"ERROR_SERVER_ERROR": true, "ERROR_INTERNAL_SERVER_ERROR": true}
var solveErrors = map[string]bool{"ERROR_CAPTCHA_UNSOLVABLE": true}
var proxyErrors = map[string]bool{"ERROR_BAD_PROXY": true, "ERROR_PROXY_CONNECTION_FAILED": true}

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

func handleError(error string) {
	if authErrors[error] {
		fmt.Printf("[!] Authentication error: %s\n", error)
		fmt.Println("    Check your API key at https://captchaai.com/dashboard")
	} else if balanceErrors[error] {
		fmt.Printf("[!] Balance error: %s\n", error)
		fmt.Println("    Top up your account at https://captchaai.com")
	} else if inputErrors[error] {
		fmt.Printf("[!] Input error: %s\n", error)
		fmt.Println("    Verify your gt, challenge, and page URL are correct.")
	} else if proxyErrors[error] {
		fmt.Printf("[!] Proxy error: %s\n", error)
		fmt.Println("    Check your proxy configuration or try a different proxy.")
	} else {
		fmt.Printf("[!] Submission failed: %s\n", error)
	}
}

func getRequestString(raw json.RawMessage) string {
	var s string
	if err := json.Unmarshal(raw, &s); err == nil {
		return s
	}
	return string(raw)
}

func main() {
	env := loadEnv()
	apiKey := getEnv(env, "CAPTCHAAI_API_KEY", "")
	gt := getEnv(env, "CAPTCHA_GT", "")
	challenge := getEnv(env, "CAPTCHA_CHALLENGE", "")
	pageurl := getEnv(env, "CAPTCHA_PAGEURL", "")
	apiServer := getEnv(env, "CAPTCHA_API_SERVER", "")
	pollInterval, _ := strconv.Atoi(getEnv(env, "POLL_INTERVAL", "5"))
	maxTimeout, _ := strconv.Atoi(getEnv(env, "MAX_TIMEOUT", "120"))

	if apiKey == "" || apiKey == "YOUR_API_KEY" {
		fmt.Println("[!] ERROR: CAPTCHAAI_API_KEY is not set.")
		fmt.Println("    Copy .env.example to .env and add your real API key.")
		os.Exit(1)
	}
	if gt == "" || gt == "YOUR_GT_VALUE" {
		fmt.Println("[!] ERROR: CAPTCHA_GT is not set.")
		fmt.Println("    Find the gt value in the page source or GeeTest initialization call.")
		os.Exit(1)
	}
	if challenge == "" || challenge == "YOUR_CHALLENGE_VALUE" {
		fmt.Println("[!] ERROR: CAPTCHA_CHALLENGE is not set.")
		fmt.Println("    The challenge token must be fresh — fetch a new one for each solve attempt.")
		os.Exit(1)
	}
	if pageurl == "" || pageurl == "https://example.com" {
		fmt.Println("[!] WARNING: CAPTCHA_PAGEURL may not be set correctly.")
		fmt.Println("    Make sure it points to the actual target page.")
	}

	client := &http.Client{Timeout: 30 * time.Second}

	// Submit task
	fmt.Println("[*] Submitting GeeTest v3 task...")
	params := url.Values{
		"key":       {apiKey},
		"method":    {"geetest"},
		"gt":        {gt},
		"challenge": {challenge},
		"pageurl":   {pageurl},
		"json":      {"1"},
	}
	if apiServer != "" {
		params.Set("api_server", apiServer)
	}

	resp, err := client.Get(submitURL + "?" + params.Encode())
	if err != nil {
		fmt.Printf("[!] Network error during submission: %v\n", err)
		os.Exit(1)
	}
	defer resp.Body.Close()

	body, _ := io.ReadAll(resp.Body)
	var submitResp apiResponse
	json.Unmarshal(body, &submitResp)

	if submitResp.Status != 1 {
		handleError(getRequestString(submitResp.Request))
		os.Exit(1)
	}

	taskID := getRequestString(submitResp.Request)
	fmt.Printf("[+] Task submitted. ID: %s\n", taskID)

	// Poll for result
	fmt.Println("[*] Waiting 15s before first poll...")
	time.Sleep(15 * time.Second)

	elapsed := 15
	attempt := 0
	backoff := pollInterval

	for elapsed < maxTimeout {
		attempt++
		fmt.Printf("[*] Polling for result (attempt %d)...\n", attempt)

		pollParams := url.Values{
			"key":    {apiKey},
			"action": {"get"},
			"id":     {taskID},
			"json":   {"1"},
		}

		resp, err := client.Get(resultURL + "?" + pollParams.Encode())
		if err != nil {
			fmt.Printf("[!] Network error during polling: %v\n", err)
			time.Sleep(time.Duration(backoff) * time.Second)
			elapsed += backoff
			if backoff < 30 {
				backoff *= 2
			}
			continue
		}

		body, _ := io.ReadAll(resp.Body)
		resp.Body.Close()
		var result apiResponse
		json.Unmarshal(body, &result)

		if result.Status == 1 {
			// The request field contains a JSON object or JSON string with 3 GeeTest values
			var solution geetestSolution
			// Try parsing the request field directly as a JSON object
			if err := json.Unmarshal(result.Request, &solution); err != nil {
				// If it's a JSON string, unwrap and parse
				var raw string
				json.Unmarshal(result.Request, &raw)
				json.Unmarshal([]byte(raw), &solution)
			}
			fmt.Println("[+] Solved!")
			fmt.Printf("[+] geetest_challenge: %s\n", solution.GeetestChallenge)
			fmt.Printf("[+] geetest_validate: %s\n", solution.GeetestValidate)
			fmt.Printf("[+] geetest_seccode: %s\n", solution.GeetestSeccode)
			fmt.Println()
			fmt.Println("Next step: submit these three values to the site's")
			fmt.Println("GeeTest verification endpoint.")
			return
		}

		reqStr := getRequestString(result.Request)

		if reqStr == "CAPCHA_NOT_READY" {
			fmt.Printf("[*] Not ready yet, waiting %ds...\n", pollInterval)
			time.Sleep(time.Duration(pollInterval) * time.Second)
			elapsed += pollInterval
			backoff = pollInterval
			continue
		}

		if transientErrors[reqStr] {
			fmt.Printf("[!] Transient error: %s, retrying in %ds...\n", reqStr, backoff)
			time.Sleep(time.Duration(backoff) * time.Second)
			elapsed += backoff
			if backoff < 30 {
				backoff *= 2
			}
			continue
		}

		if solveErrors[reqStr] {
			fmt.Printf("[!] Solve error: %s\n", reqStr)
			fmt.Println("    The CAPTCHA could not be solved. Verify parameters and retry.")
			os.Exit(1)
		}

		fmt.Printf("[!] Unexpected error: %s\n", reqStr)
		os.Exit(1)
	}

	fmt.Printf("[!] Timeout: no solution received within %d seconds.\n", maxTimeout)
	os.Exit(1)
}
