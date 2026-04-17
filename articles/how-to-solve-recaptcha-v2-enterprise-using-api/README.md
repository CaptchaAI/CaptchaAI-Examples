# reCAPTCHA v2 Enterprise — CaptchaAI Example Pack

Full working example for solving reCAPTCHA v2 Enterprise using the CaptchaAI API.

**Languages:** Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash

## Related article

This example accompanies the blog article:
**[How to Solve reCAPTCHA v2 Enterprise Using API](https://blog.captchaai.com/how-to-solve-recaptcha-v2-enterprise-using-api)**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A target page with reCAPTCHA v2 Enterprise for testing
- One or more of: Python 3.8+, Node.js 16+, PHP 8.0+, Go 1.21+, Java 11+, .NET 8+, Ruby 3.0+, Rust 1.70+, Kotlin 1.9+, or Bash with curl and jq

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/how-to-solve-recaptcha-v2-enterprise-using-api
   ```

2. Copy the environment file and add your credentials:
   ```bash
   cp .env.example .env
   ```

3. Edit `.env` with your API key and target page details. If the target page includes a `data-s` attribute on the reCAPTCHA element, add that value to `CAPTCHA_DATA_S`.

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

1. **Submit** — sends the sitekey, page URL, and `enterprise=1` flag (plus optional `data-s`) to the CaptchaAI API
2. **Poll** — checks for the solution every few seconds (15 s initial wait, then every 5 s)
3. **Receive** — prints the `g-recaptcha-response` token for injection into the target form

## Environment variables

| Variable | Required | Description |
|---|---|---|
| `CAPTCHAAI_API_KEY` | Yes | Your CaptchaAI API key |
| `CAPTCHA_SITEKEY` | Yes | The `data-sitekey` from the target page |
| `CAPTCHA_PAGEURL` | Yes | Full URL of the page with the CAPTCHA |
| `CAPTCHA_DATA_S` | No | The `data-s` value if present on the page |
| `POLL_INTERVAL` | No | Seconds between polls (default: 5) |
| `MAX_TIMEOUT` | No | Max seconds to wait (default: 120) |
