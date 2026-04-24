# How the CaptchaAI Extension Detects CAPTCHAs Under the Hood

Full working example for solving reCAPTCHA v2 using the CaptchaAI API.

**Languages:** Python

## Related article

This example accompanies the blog article:
**Pending publication**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A target page with reCAPTCHA v2 for testing
- Python installed on your system

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/captchaai-extension-architecture-how-it-detects-captchas
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
cp ../.env.example ../.env
# Edit ../.env with your API key and target page details
python solve.py
```

## Configuration

| Variable | Description | Required |
|----------|-------------|----------|
| `CAPTCHAAI_API_KEY` | Your CaptchaAI API key | Yes |
| `CAPTCHA_SITEKEY` | googlekey from the target page | Yes |
| `CAPTCHA_PAGEURL` | pageurl from the target page | Yes |
| `POLL_INTERVAL` | Seconds between poll requests (default: 5) | No |
| `MAX_TIMEOUT` | Maximum seconds to wait for solution (default: 120) | No |

## How it works

1. **Submit** — Sends the CAPTCHA parameters to `https://ocr.captchaai.com/in.php` using method `userrecaptcha`
2. **Wait** — Pauses 15-20 seconds for initial processing
3. **Poll** — Checks `https://ocr.captchaai.com/res.php` every 5 seconds for the result
4. **Result** — Returns the solved token ready for injection

## Expected output

```
[*] Submitting reCAPTCHA v2 task...
[+] Task submitted. ID: 71234567
[*] Waiting 15s before first poll...
[*] Polling for result (attempt 1)...
[*] Not ready yet, waiting 5s...
[*] Polling for result (attempt 2)...
[+] Solved! Token: 03AHJ_Vuve5Asa4koK3KSMyUkCq...
[+] Full token length: 280 characters
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
- Make sure `.env` file is in the `articles/captchaai-extension-architecture-how-it-detects-captchas/` directory (not inside a language folder)

**Polling times out after 120 seconds**
- The CAPTCHA may be unusually complex — try increasing `MAX_TIMEOUT`
- Check that the sitekey and page URL are correct for the target page
- Verify your account has sufficient balance

**Token received but form submission fails**
- The token may have expired (tokens are valid for ~120 seconds)
- Make sure you are injecting the token into the correct form field (see the injection message printed by the script)
- Some sites require additional cookies or headers

## API documentation

- [CaptchaAI API Docs](https://captchaai.com/api-docs)
- [Error Codes Reference](https://captchaai.com/api-docs)

## Related examples

Browse more examples in the [CaptchaAI-Examples repository](https://github.com/CaptchaAI/CaptchaAI-Examples).
