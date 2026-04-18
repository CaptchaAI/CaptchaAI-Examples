# Grid Image CAPTCHA: Coordinate Mapping and Cell Selection

Full working example for solving Grid Image CAPTCHA using the CaptchaAI API.

**Languages:** Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash

## Related article

This example accompanies the blog article:
**[Grid Image CAPTCHA: Coordinate Mapping and Cell Selection](https://blog.captchaai.com/grid-image-coordinate-mapping)**

## Prerequisites

- A CaptchaAI account with API key ([get one here](https://captchaai.com))
- A target page with Grid Image CAPTCHA for testing

## Quick start

1. Clone the repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples/articles/grid-image-coordinate-mapping
   ```

2. Copy and edit the environment file:
   ```bash
   cp .env.example .env
   ```

3. Run any language example:

### Python
```bash
cd python && pip install -r requirements.txt && python solve.py
```

### Node.js
```bash
cd node && npm install && node solve.js
```

### PHP
```bash
cd php && composer install && php solve.php
```

### Go
```bash
cd go && go run solve.go
```

### Java
```bash
cd java && javac Solve.java && java Solve
```

### C#
```bash
cd csharp && dotnet run
```

### Ruby
```bash
cd ruby && ruby solve.rb
```

### Rust
```bash
cd rust && cargo run
```

### Kotlin
```bash
cd kotlin && kotlinc solve.kt -include-runtime -d solve.jar && java -jar solve.jar
```

### Bash
```bash
cd bash && chmod +x solve.sh && ./solve.sh
```

## How it works

1. **Submit** — Sends the CAPTCHA parameters to `https://ocr.captchaai.com/in.php` using method `base64`
2. **Poll** — Checks `https://ocr.captchaai.com/res.php` every 5 seconds for the result
3. **Result** — Returns the solved token/answer ready for use

## API documentation

- [CaptchaAI API Docs](https://captchaai.com/api-docs)

## Related examples

Browse more examples in the [CaptchaAI-Examples repository](https://github.com/CaptchaAI/CaptchaAI-Examples).