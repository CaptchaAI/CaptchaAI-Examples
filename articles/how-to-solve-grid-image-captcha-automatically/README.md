# Grid Image CAPTCHA — CaptchaAI Example Pack

Full working example for solving Grid Image CAPTCHA using the CaptchaAI API.

**Languages:** Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash

## Related article

This example accompanies the blog article:
**[How to Solve Grid Image CAPTCHA Automatically](https://blog.captchaai.com/how-to-solve-grid-image-captcha-automatically)**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A grid CAPTCHA image file for testing (PNG, JPG, etc.)
- One or more of: Python 3.8+, Node.js 16+, PHP 8.0+, Go 1.21+, Java 11+, .NET 8+, Ruby 3.0+, Rust 1.70+, Kotlin 1.9+, or Bash with curl and jq

## Grid Image CAPTCHA parameters

| Parameter | Required | Description |
|-----------|----------|-------------|
| `method` | Yes | Must be `post` |
| `body` | Yes | Base64-encoded grid CAPTCHA image data |
| `recaptcha` | Yes | Must be `1` — flags the image as a grid solve |
| `textinstructions` | Yes | Text prompt describing what to select (e.g. "Select all squares with traffic lights") |

## Response

The API returns the selected cell indices in the `request` field (e.g. `"click:1/4/5/7"` or `"1,4,5,7"`).

## Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/how-to-solve-grid-image-captcha-automatically
   ```

2. Copy the environment file and add your credentials:
   ```bash
   cp .env.example .env
   ```

3. Edit `.env` with your API key, grid image file path, and instructions.

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

## Output

All implementations produce identical output:

```
[*] Loading grid image from grid.png...
[*] Submitting Grid Image CAPTCHA task...
[+] Task submitted. ID: 74832156
[*] Waiting 15s before first poll...
[*] Polling for result (attempt 1)...
[+] Solved! Selected cells: click:1/4/5/7

Next step: click the cells at the returned indices on
the target page's grid and submit.
```

## License

MIT
