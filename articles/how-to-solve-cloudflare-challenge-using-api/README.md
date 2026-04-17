# Cloudflare Challenge — CaptchaAI Example Pack

Full working example for solving Cloudflare Challenge using the CaptchaAI API.

**Languages:** Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash

> **Note:** Cloudflare Challenge is different from Turnstile. It requires a proxy
> and returns a `cf_clearance` cookie + `User-Agent` string instead of a token.
> You must use the same proxy IP and User-Agent for all subsequent requests.

## Related article

This example accompanies the blog article:
**[How to Solve Cloudflare Challenge Using API](https://blog.captchaai.com/how-to-solve-cloudflare-challenge-using-api)**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A target page protected by Cloudflare Challenge
- A working proxy (HTTP, HTTPS, SOCKS4, or SOCKS5)
- One or more of: Python 3.8+, Node.js 16+, PHP 8.0+, Go 1.21+, Java 11+, .NET 8+, Ruby 3.0+, Rust 1.70+, Kotlin 1.9+, or Bash with curl and jq

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/how-to-solve-cloudflare-challenge-using-api
   ```

2. Copy the environment file and add your credentials:
   ```bash
   cp .env.example .env
   ```

3. Edit `.env` with your API key, target page URL, and proxy details.

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

1. The script submits the target page URL and proxy details to the CaptchaAI API.
2. CaptchaAI uses the proxy to navigate to the page and solve the Cloudflare Challenge.
3. The API returns the `cf_clearance` cookie value and the `User-Agent` string used.
4. You set the `cf_clearance` cookie and `User-Agent` header on all subsequent requests,
   using the **same proxy IP** that was used to solve the challenge.

## Environment variables

| Variable | Required | Description |
|---|---|---|
| `CAPTCHAAI_API_KEY` | Yes | Your CaptchaAI API key |
| `CAPTCHA_PAGEURL` | Yes | URL of the Cloudflare-protected page |
| `PROXY` | Yes | Proxy in `login:password@ip:port` format |
| `PROXYTYPE` | No | `HTTP` (default), `HTTPS`, `SOCKS4`, or `SOCKS5` |
| `POLL_INTERVAL` | No | Seconds between polls (default: 5) |
| `MAX_TIMEOUT` | No | Max seconds to wait (default: 120) |
