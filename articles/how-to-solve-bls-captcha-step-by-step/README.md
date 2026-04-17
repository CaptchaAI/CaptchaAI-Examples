# BLS CAPTCHA — CaptchaAI Example Pack

Full working example for solving BLS CAPTCHA using the CaptchaAI API.

**Languages:** Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash

## Related article

This example accompanies the blog article:
**[How to Solve BLS CAPTCHA Step by Step](https://blog.captchaai.com/how-to-solve-bls-captcha-step-by-step)**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A CAPTCHA image file for testing (PNG, JPG, etc.)
- One or more of: Python 3.8+, Node.js 16+, PHP 8.0+, Go 1.21+, Java 11+, .NET 8+, Ruby 3.0+, Rust 1.70+, Kotlin 1.9+, or Bash with curl and jq

## BLS CAPTCHA parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `method` | Yes | Must be `bls` |
| `body` | Yes | Base64-encoded CAPTCHA image data |
| `textinstructions` | Yes | Text instructions describing what to select (e.g. "Select all images with a car") |

## Response

The API returns the selected cell indices in the `request` field (e.g. `"1,3,5"`).

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/how-to-solve-bls-captcha-step-by-step
   ```

2. Copy the environment file and add your credentials:
   ```bash
   cp .env.example .env
   ```

3. Edit `.env` with your API key, image file path, and instructions.

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

1. The script loads the CAPTCHA image from the file specified in `CAPTCHA_IMAGE_FILE`.
2. The image is base64-encoded and sent via **POST** to `in.php` with `method=bls` and `textinstructions`.
3. The API returns a task ID.
4. The script polls `res.php` until the solution is ready.
5. The answer contains the selected cell indices (e.g. `"1,3,5"`).

## Notes

- The image file must exist and be readable.
- Submission uses POST (not GET) because the base64-encoded image body is too large for a URL.
- The `textinstructions` parameter tells the solver what to look for in the image grid.
