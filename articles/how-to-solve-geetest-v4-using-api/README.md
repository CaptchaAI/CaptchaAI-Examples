# GeeTest v4 — CaptchaAI Example Pack

Full working example for solving GeeTest v4 using the CaptchaAI API.

**Languages:** Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash

## Related article

This example accompanies the blog article:
**[How to Solve GeeTest v4 Using API](https://blog.captchaai.com/how-to-solve-geetest-v4-using-api)**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A target page with GeeTest v4 for testing
- One or more of: Python 3.8+, Node.js 16+, PHP 8.0+, Go 1.21+, Java 11+, .NET 8+, Ruby 3.0+, Rust 1.70+, Kotlin 1.9+, or Bash with curl and jq

## GeeTest v4 parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `gt` | Yes | The `captcha_id` — GeeTest v4 identifier for the site (find in page source or GeeTest v4 init call) |
| `version` | Yes | Must be `4` for GeeTest v4 |
| `pageurl` | Yes | Full URL of the page with the GeeTest v4 widget |

> **Note:** Unlike GeeTest v3, GeeTest v4 does **not** require a `challenge` parameter.

## Response

The API returns five values that must be submitted together to the site's GeeTest v4 verification endpoint:

- `captcha_id` — the GeeTest captcha identifier
- `lot_number` — the lot number for this solve
- `pass_token` — the pass token
- `gen_time` — the generation timestamp
- `captcha_output` — the captcha output value

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/how-to-solve-geetest-v4-using-api
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
