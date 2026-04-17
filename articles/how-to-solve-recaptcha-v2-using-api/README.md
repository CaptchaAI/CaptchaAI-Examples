# How to Solve reCAPTCHA v2 Using API: Step-by-Step Guide

Full working example for solving reCAPTCHA v2 using the CaptchaAI API.

**Languages:** Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash

## Related article

This example accompanies the blog article:
**[How to Solve reCAPTCHA v2 Using API: Step-by-Step Guide](https://blog.captchaai.com/how-to-solve-recaptcha-v2-using-api)**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A target page with reCAPTCHA v2 for testing
- One or more of: Python 3.8+, Node.js 16+, PHP 8.0+, Go 1.21+, Java 11+, .NET 8+, Ruby 3.0+, Rust 1.70+, Kotlin 1.9+, or Bash with curl and jq

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/how-to-solve-recaptcha-v2-using-api
   ```

2. Copy the environment file and add your credentials:
   ```bash
   cp .env.example .env
   ```

3. Edit `.env` with your API key and target page details.

4. Follow the language-specific setup below.

### Python

```bash
cd python
pip install -r requirements.txt
python solve.py
```

### Node.js

```bash
cd node
npm install
node solve.js
```

### PHP

```bash
cd php
composer install
php solve.php
```

### Go

```bash
cd go
go run solve.go
```

### Java

```bash
cd java
javac Solve.java
java Solve
```

### C#

```bash
cd csharp
dotnet run
```

### Ruby

```bash
cd ruby
ruby solve.rb
```

### Rust

```bash
cd rust
cargo run
```

### Kotlin

```bash
cd kotlin
kotlinc solve.kt -include-runtime -d solve.jar
java -jar solve.jar
```

### Bash

```bash
cd bash
chmod +x solve.sh
./solve.sh
```

## Configuration

| Variable | Description | Required |
|----------|-------------|----------|
| `CAPTCHAAI_API_KEY` | Your CaptchaAI API key (32 characters) | Yes |
| `CAPTCHA_SITEKEY` | reCAPTCHA v2 sitekey from the target page | Yes |
| `CAPTCHA_PAGEURL` | Full URL of the page with reCAPTCHA | Yes |
| `POLL_INTERVAL` | Seconds between poll requests (default: 5) | No |
| `MAX_TIMEOUT` | Maximum seconds to wait for solution (default: 120) | No |

## How it works

1. **Submit** — Sends the CAPTCHA parameters to `https://ocr.captchaai.com/in.php` using method `userrecaptcha`
2. **Wait** — Pauses 15 seconds for initial processing
3. **Poll** — Checks `https://ocr.captchaai.com/res.php` every 5 seconds for the result
4. **Result** — Returns the solved token ready for injection into `g-recaptcha-response`

## Expected output

```
[*] Submitting reCAPTCHA v2 task...
[+] Task submitted. ID: 71234567
[*] Waiting 15s before first poll...
[*] Polling for result (attempt 1)...
[*] Not ready yet, waiting 5s...
[*] Polling for result (attempt 2)...
[+] Solved! Token: 03AHJ_Vuve5Asa4koK3KSMyUkCq0vUFCR5Im4CwB7PzO3...
[+] Full token length: 280 characters

Next step: inject this token into the target page's
g-recaptcha-response hidden field and submit the form.
```

## Common errors

| Error | Cause | Fix |
|-------|-------|-----|
| `ERROR_WRONG_USER_KEY` | API key is invalid or wrong format | Check your key at https://captchaai.com/dashboard |
| `ERROR_KEY_DOES_NOT_EXIST` | API key not found | Verify the key exists in your dashboard |
| `ERROR_ZERO_BALANCE` | No balance remaining | Top up your account balance |
| `ERROR_CAPTCHA_UNSOLVABLE` | CAPTCHA could not be solved | Verify sitekey and page URL are correct |
| `CAPCHA_NOT_READY` | Solution still processing | This is normal — keep polling |
| `ERROR_BAD_TOKEN_OR_PAGEURL` | Wrong sitekey + URL combination | Extract the correct sitekey from the target page |

## Troubleshooting

**Script exits immediately with auth error**
- Verify your API key is exactly 32 characters
- Make sure `.env` file is in the `articles/how-to-solve-recaptcha-v2-using-api/` directory (not inside a language folder)

**Polling times out after 120 seconds**
- The CAPTCHA may be unusually complex — try increasing `MAX_TIMEOUT`
- Check that the sitekey and page URL are correct for the target page
- Verify your account has sufficient balance

**Token received but form submission fails**
- The token may have expired (tokens are valid for ~120 seconds)
- Make sure you are injecting the token into the `g-recaptcha-response` hidden field
- Some sites require additional cookies or headers alongside the token

## API documentation

- [CaptchaAI API Docs](https://captchaai.com/api-docs)

## Related examples

- [CaptchaAI Quickstart](../captchaai-quickstart/) — Your first solve in 5 minutes
- Browse more examples in the [CaptchaAI-Examples repository](https://github.com/CaptchaAI/CaptchaAI-Examples)
