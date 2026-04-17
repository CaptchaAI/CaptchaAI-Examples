# GeeTest v3 — CaptchaAI Example Pack

Full working example for solving GeeTest v3 using the CaptchaAI API.

**Languages:** Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash

## Related article

This example accompanies the blog article:
**[How to Solve GeeTest v3 Using API](https://blog.captchaai.com/how-to-solve-geetest-v3-using-api)**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A target page with GeeTest v3 for testing
- One or more of: Python 3.8+, Node.js 16+, PHP 8.0+, Go 1.21+, Java 11+, .NET 8+, Ruby 3.0+, Rust 1.70+, Kotlin 1.9+, or Bash with curl and jq

## GeeTest v3 parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `gt` | Yes | Static GeeTest identifier for the site (find in page source or GeeTest init call) |
| `challenge` | Yes | Dynamic challenge token — **must be fresh for each solve attempt** |
| `pageurl` | Yes | Full URL of the page with the GeeTest widget |
| `api_server` | No | GeeTest API server domain (e.g. `api.geetest.com`) |

## Response

The API returns three values that must be submitted together to the site's GeeTest verification endpoint:

- `geetest_challenge` — the challenge string
- `geetest_validate` — the validation token
- `geetest_seccode` — the security code

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/how-to-solve-geetest-v3-using-api
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
bundle install   # optional — uses stdlib only
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

## Environment variables

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `CAPTCHAAI_API_KEY` | Yes | — | Your CaptchaAI API key |
| `CAPTCHA_GT` | Yes | — | GeeTest gt value (static per site) |
| `CAPTCHA_CHALLENGE` | Yes | — | GeeTest challenge token (dynamic, must be fresh) |
| `CAPTCHA_PAGEURL` | Yes | — | Target page URL |
| `CAPTCHA_API_SERVER` | No | *(empty)* | GeeTest API server domain |
| `POLL_INTERVAL` | No | `5` | Seconds between result polls |
| `MAX_TIMEOUT` | No | `120` | Maximum seconds to wait for a solution |
