# Cloudflare Turnstile — CaptchaAI Example Pack

Full working example for solving Cloudflare Turnstile using the CaptchaAI API.

**Languages:** Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash

## Related article

This example accompanies the blog article:
**[How to Solve Cloudflare Turnstile Using API](https://blog.captchaai.com/how-to-solve-cloudflare-turnstile-using-api)**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A target page with Cloudflare Turnstile for testing
- One or more of: Python 3.8+, Node.js 16+, PHP 8.0+, Go 1.21+, Java 11+, .NET 8+, Ruby 3.0+, Rust 1.70+, Kotlin 1.9+, or Bash with curl and jq

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/how-to-solve-cloudflare-turnstile-using-api
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

| Variable | Description |
|---|---|
| `CAPTCHAAI_API_KEY` | Your CaptchaAI API key |
| `CAPTCHA_SITEKEY` | Cloudflare Turnstile sitekey (starts with `0x`) |
| `CAPTCHA_PAGEURL` | Full URL of the target page |
| `POLL_INTERVAL` | Seconds between polls (default: 5) |
| `MAX_TIMEOUT` | Maximum wait in seconds (default: 120) |
