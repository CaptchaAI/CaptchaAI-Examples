// Solve Image CAPTCHA using the CaptchaAI API.
//
// Usage:
//   go run solve.go

package main

import (
	"bufio"
	"encoding/base64"
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
var inputErrors = map[string]bool{
	"ERROR_PAGEURL": true, "ERROR_WRONG_GOOGLEKEY": true, "ERROR_BAD_PARAMETERS": true,
	"ERROR_BAD_TOKEN_OR_PAGEURL": true, "ERROR_WRONG_FILE_EXTENSION": true,
	"ERROR_TOO_BIG_CAPTCHA_FILESIZE": true, "ERROR_EMPTY_CAPTCHA": true,
}
var transientErrors = map[string]bool{"ERROR_SERVER_ERROR": true, "ERROR_INTERNAL_SERVER_ERROR": true}
var solveErrors = map[string]bool{"ERROR_CAPTCHA_UNSOLVABLE": true}
var proxyErrors = map[string]bool{"ERROR_BAD_PROXY": true, "ERROR_PROXY_CONNECTION_FAILED": true}

type apiResponse struct {
	Status  int             `json:"status"`
	Request json.RawMessage `json:"request"`
}

func loadEnv() map[string]string {
	env := make(map[string]string)
	envPath := filepath.Join(filepath.Dir(os.Args[0]), "..", ".env")
	if _, err := os.Stat(envPath); err != nil {
		envPath = filepath.Join("..", ".env")
	}
	f, err := os.Open(envPath)
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

func getRequestString(raw json.RawMessage) string {
	var s string
	if err := json.Unmarshal(raw, &s); err == nil {
		return s
	}
	return string(raw)
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
		fmt.Println("    Verify your image file is valid and not too large.")
	} else if proxyErrors[error] {
		fmt.Printf("[!] Proxy error: %s\n", error)
		fmt.Println("    Check your proxy configuration or try a different proxy.")
	} else {
		fmt.Printf("[!] Submission failed: %s\n", error)
	}
}

func resolveImagePath(imageFile string) string {
	parentPath := filepath.Join("..", imageFile)
	if _, err := os.Stat(parentPath); err == nil {
		return parentPath
	}
	return imageFile
}

func main() {
	env := loadEnv()
	apiKey := getEnv(env, "CAPTCHAAI_API_KEY", "")
	imageFile := getEnv(env, "CAPTCHA_IMAGE_FILE", "captcha.png")
	pollInterval, _ := strconv.Atoi(getEnv(env, "POLL_INTERVAL", "5"))
	maxTimeout, _ := strconv.Atoi(getEnv(env, "MAX_TIMEOUT", "120"))

	// Validate
	if apiKey == "" || apiKey == "YOUR_API_KEY" {
		fmt.Println("[!] ERROR: CAPTCHAAI_API_KEY is not set.")
		fmt.Println("    Copy .env.example to .env and add your real API key.")
		os.Exit(1)
	}
	if imageFile == "" {
		fmt.Println("[!] ERROR: CAPTCHA_IMAGE_FILE is not set.")
		fmt.Println("    Set the path to the CAPTCHA image file in .env.")
		os.Exit(1)
	}
	imagePath := resolveImagePath(imageFile)
	if _, err := os.Stat(imagePath); err != nil {
		fmt.Printf("[!] ERROR: Image file not found: %s\n", imageFile)
		fmt.Println("    Make sure the file exists and the path is correct.")
		os.Exit(1)
	}

	// Load image and base64-encode
	fmt.Printf("[*] Loading image from %s...\n", imageFile)
	imageData, err := os.ReadFile(imagePath)
	if err != nil {
		fmt.Printf("[!] ERROR: Could not read image file: %v\n", err)
		os.Exit(1)
	}
	imageB64 := base64.StdEncoding.EncodeToString(imageData)

	client := &http.Client{Timeout: 30 * time.Second}

	// Submit task via POST
	fmt.Println("[*] Submitting Image CAPTCHA task...")
	formData := url.Values{
		"key":    {apiKey},
		"method": {"base64"},
		"body":   {imageB64},
		"json":   {"1"},
	}

	resp, err := client.PostForm(submitURL, formData)
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
	fmt.Println("[*] Waiting 10s before first poll...")
	time.Sleep(10 * time.Second)

	elapsed := 10
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
			text := getRequestString(result.Request)
			fmt.Printf("[+] Solved! Text: %s\n", text)
			fmt.Println()
			fmt.Println("Next step: enter this text into the CAPTCHA input field")
			fmt.Println("on the target page and submit the form.")
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
			fmt.Println("    The CAPTCHA could not be solved. Verify the image and retry.")
			os.Exit(1)
		}

		fmt.Printf("[!] Unexpected error: %s\n", reqStr)
		os.Exit(1)
	}

	fmt.Printf("[!] Timeout: no solution received within %d seconds.\n", maxTimeout)
	os.Exit(1)
}
