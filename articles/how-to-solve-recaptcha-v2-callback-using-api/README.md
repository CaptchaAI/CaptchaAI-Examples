# reCAPTCHA v2 (Callback) — CaptchaAI Example Pack

Full working example for solving reCAPTCHA v2 using the CaptchaAI API, where the token is delivered via a JavaScript callback function instead of a hidden form field.

**Languages:** Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash

## Related article

This example accompanies the blog article:
**[How to Solve reCAPTCHA v2 Callback Using API](https://blog.captchaai.com/how-to-solve-recaptcha-v2-callback-using-api)**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A target page with reCAPTCHA v2 that uses a callback for testing
- One or more of: Python 3.8+, Node.js 16+, PHP 8.0+, Go 1.21+, Java 11+, .NET 8+, Ruby 3.0+, Rust 1.70+, Kotlin 1.9+, or Bash with curl and jq

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/how-to-solve-recaptcha-v2-callback-using-api
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
bash solve.sh
```

## How it works

1. Submit the reCAPTCHA v2 sitekey and page URL to CaptchaAI via `in.php`
2. Poll `res.php` until the solution token is ready
3. Invoke the page's reCAPTCHA callback function with the token (instead of setting a hidden field)

The callback function can be found via:
- The `data-callback` attribute on the reCAPTCHA widget div
- The parameters passed to `grecaptcha.render()`
- The internal `___grecaptcha_cfg.clients[0]` object

## Environment variables

| Variable | Required | Default | Description |
|---|---|---|---|
| `CAPTCHAAI_API_KEY` | Yes | — | Your CaptchaAI API key |
| `CAPTCHA_SITEKEY` | Yes | — | reCAPTCHA v2 sitekey from the target page |
| `CAPTCHA_PAGEURL` | Yes | — | Full URL of the target page |
| `POLL_INTERVAL` | No | `5` | Seconds between polling attempts |
| `MAX_TIMEOUT` | No | `120` | Maximum seconds to wait for a solution |

## Environment variables

| Variable | Required | Description |
|---|---|---|
| `CAPTCHAAI_API_KEY` | Yes | Your CaptchaAI API key |
| `CAPTCHA_SITEKEY` | Yes | The reCAPTCHA v2 sitekey from the target page |
| `CAPTCHA_PAGEURL` | Yes | Full URL of the page with the CAPTCHA |
| `POLL_INTERVAL` | No | Seconds between polls (default: 5) |
| `MAX_TIMEOUT` | No | Max seconds to wait for solution (default: 120) |
