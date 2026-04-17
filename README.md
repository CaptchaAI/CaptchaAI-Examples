# CaptchaAI Examples

Full working code examples for the [CaptchaAI](https://captchaai.com) CAPTCHA solving API.

Every example in this repository is a complete, runnable project with setup instructions, environment configuration, polling, retries, error handling, and expected output.

## Quick start

1. Get your API key from [captchaai.com](https://captchaai.com)
2. Clone this repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples
   ```
3. Pick an example from the `articles/` directory
4. Follow the README inside that example folder

## Repository structure

```
CaptchaAI-Examples/
  articles/                     # Full example packs, one per article
    {slug}/
      README.md                 # Setup, usage, expected output, troubleshooting
      .env.example              # Required environment variables
      .gitignore                # Excludes .env and build artifacts
      python/                   # Python implementation
      node/                     # Node.js implementation
      php/                      # PHP implementation
      go/                       # Go implementation
      java/                     # Java implementation
      csharp/                   # C# implementation
      ruby/                     # Ruby implementation
      rust/                     # Rust implementation
      kotlin/                   # Kotlin implementation
      bash/                     # Bash/cURL implementation
  templates/                    # Starter templates for new examples
    python-basic/
    node-basic/
    php-basic/
    go-basic/
    java-basic/
    csharp-basic/
    ruby-basic/
    rust-basic/
    kotlin-basic/
    bash-basic/
```

## Examples

| Example | CAPTCHA Type | Languages | Article |
|---------|-------------|-----------|---------|
| [captchaai-quickstart](articles/captchaai-quickstart/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-quickstart) |
| [how-to-solve-recaptcha-v2-using-api](articles/how-to-solve-recaptcha-v2-using-api/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-v2-using-api) |
| [how-to-solve-recaptcha-v3-automatically-using-api](articles/how-to-solve-recaptcha-v3-automatically-using-api/) | reCAPTCHA v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-v3-automatically-using-api) |
| [how-to-solve-recaptcha-v2-enterprise-using-api](articles/how-to-solve-recaptcha-v2-enterprise-using-api/) | reCAPTCHA v2 Enterprise | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-v2-enterprise-using-api) |
| [how-to-solve-recaptcha-v3-enterprise-using-api](articles/how-to-solve-recaptcha-v3-enterprise-using-api/) | reCAPTCHA v3 Enterprise | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-v3-enterprise-using-api) |
| [how-to-solve-recaptcha-invisible-using-api](articles/how-to-solve-recaptcha-invisible-using-api/) | reCAPTCHA Invisible | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-invisible-using-api) |
| [how-to-solve-recaptcha-v2-callback-using-api](articles/how-to-solve-recaptcha-v2-callback-using-api/) | reCAPTCHA v2 (Callback) | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-v2-callback-using-api) |
| [how-to-solve-cloudflare-turnstile-using-api](articles/how-to-solve-cloudflare-turnstile-using-api/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-cloudflare-turnstile-using-api) |
| [how-to-solve-cloudflare-challenge-using-api](articles/how-to-solve-cloudflare-challenge-using-api/) | Cloudflare Challenge | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-cloudflare-challenge-using-api) |
| [how-to-solve-geetest-v3-using-api](articles/how-to-solve-geetest-v3-using-api/) | GeeTest v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-geetest-v3-using-api) |
| [how-to-solve-bls-captcha-step-by-step](articles/how-to-solve-bls-captcha-step-by-step/) | BLS CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-bls-captcha-step-by-step) |
| [image-captcha-solving-using-api](articles/image-captcha-solving-using-api/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/image-captcha-solving-using-api) |
| [how-to-solve-grid-image-captcha-automatically](articles/how-to-solve-grid-image-captcha-automatically/) | Grid Image CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-grid-image-captcha-automatically) |
| [how-to-solve-hcaptcha-using-api](articles/how-to-solve-hcaptcha-using-api/) | hCaptcha | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-hcaptcha-using-api) |
| [how-to-solve-geetest-v4-using-api](articles/how-to-solve-geetest-v4-using-api/) | GeeTest v4 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-geetest-v4-using-api) |
| [bash-curl-captchaai-shell-automation](articles/bash-curl-captchaai-shell-automation/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bash-curl-captchaai-shell-automation) |
| [batch-captcha-solving-multiple-tasks](articles/batch-captcha-solving-multiple-tasks/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/batch-captcha-solving-multiple-tasks) |
| [batch-image-captcha-solving-1000-images](articles/batch-image-captcha-solving-1000-images/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/batch-image-captcha-solving-1000-images) |
| [bls-captcha-image-order-grid-response-handling](articles/bls-captcha-image-order-grid-response-handling/) | BLS CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bls-captcha-image-order-grid-response-handling) |
| [bls-captcha-instructions-code-parameter-deep-dive](articles/bls-captcha-instructions-code-parameter-deep-dive/) | BLS CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bls-captcha-instructions-code-parameter-deep-dive) |
| [building-captchaai-usage-dashboard-monitoring](articles/building-captchaai-usage-dashboard-monitoring/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-captchaai-usage-dashboard-monitoring) |
| [building-custom-scraping-framework-captchaai](articles/building-custom-scraping-framework-captchaai/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-custom-scraping-framework-captchaai) |
| [building-go-client-captchaai-api](articles/building-go-client-captchaai-api/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-go-client-captchaai-api) |
| [building-nodejs-sdk-captchaai-api](articles/building-nodejs-sdk-captchaai-api/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-nodejs-sdk-captchaai-api) |
| [building-php-composer-package-captchaai](articles/building-php-composer-package-captchaai/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-php-composer-package-captchaai) |
| [captchaai-api-key-rotation](articles/captchaai-api-key-rotation/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-api-key-rotation) |
| [captchaai-api-latency-optimization](articles/captchaai-api-latency-optimization/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-api-latency-optimization) |
| [captchaai-balance-check-auto-refill](articles/captchaai-balance-check-auto-refill/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-balance-check-auto-refill) |
| [captchaai-callback-url-webhook-guide](articles/captchaai-callback-url-webhook-guide/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-callback-url-webhook-guide) |
| [captchaai-ip-whitelisting-api-key-security](articles/captchaai-ip-whitelisting-api-key-security/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-ip-whitelisting-api-key-security) |
| [captchaai-pingback-task-notification-patterns](articles/captchaai-pingback-task-notification-patterns/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-pingback-task-notification-patterns) |
| [captchaai-python-pydantic-validation](articles/captchaai-python-pydantic-validation/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-python-pydantic-validation) |
| [captchaai-soft-id-referral-tracking](articles/captchaai-soft-id-referral-tracking/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-soft-id-referral-tracking) |
| [captcha-image-preprocessing-better-solve-rates](articles/captcha-image-preprocessing-better-solve-rates/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-image-preprocessing-better-solve-rates) |
| [case-sensitive-captcha-api-parameter-guide](articles/case-sensitive-captcha-api-parameter-guide/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/case-sensitive-captcha-api-parameter-guide) |
| [circuit-breaker-pattern-captcha-api-calls](articles/circuit-breaker-pattern-captcha-api-calls/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/circuit-breaker-pattern-captcha-api-calls) |
| [cloudflare-challenge-page-parameters-token-flow](articles/cloudflare-challenge-page-parameters-token-flow/) | Cloudflare Challenge | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/cloudflare-challenge-page-parameters-token-flow) |
| [csharp-task-whenall-captchaai-async](articles/csharp-task-whenall-captchaai-async/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/csharp-task-whenall-captchaai-async) |
| [custom-captcha-types-submit-unusual-challenges](articles/custom-captcha-types-submit-unusual-challenges/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/custom-captcha-types-submit-unusual-challenges) |
| [custom-timeout-settings-captcha-types](articles/custom-timeout-settings-captcha-types/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/custom-timeout-settings-captcha-types) |
| [dead-letter-queue-failed-captcha-tasks](articles/dead-letter-queue-failed-captcha-tasks/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/dead-letter-queue-failed-captcha-tasks) |
| [geetest-slide-captcha-parameters-api-guide](articles/geetest-slide-captcha-parameters-api-guide/) | GeeTest v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/geetest-slide-captcha-parameters-api-guide) |
| [go-goroutines-captchaai-high-throughput](articles/go-goroutines-captchaai-high-throughput/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/go-goroutines-captchaai-high-throughput) |
| [graceful-degradation-captcha-solving-fails](articles/graceful-degradation-captcha-solving-fails/) | null | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/graceful-degradation-captcha-solving-fails) |
| [image-captcha-base64-encoding-best-practices](articles/image-captcha-base64-encoding-best-practices/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/image-captcha-base64-encoding-best-practices) |
| [implementing-retry-logic-captchaai-api](articles/implementing-retry-logic-captchaai-api/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/implementing-retry-logic-captchaai-api) |
| [improving-ocr-captcha-accuracy-captchaai-settings](articles/improving-ocr-captcha-accuracy-captchaai-settings/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/improving-ocr-captcha-accuracy-captchaai-settings) |
| [java-completablefuture-captchaai-async](articles/java-completablefuture-captchaai-async/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/java-completablefuture-captchaai-async) |
| [math-captcha-solving-captchaai-calc-parameter](articles/math-captcha-solving-captchaai-calc-parameter/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/math-captcha-solving-captchaai-calc-parameter) |
| [multi-character-image-captcha-solving-strategies](articles/multi-character-image-captcha-solving-strategies/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/multi-character-image-captcha-solving-strategies) |
| [nodejs-promise-allsettled-batch-captcha](articles/nodejs-promise-allsettled-batch-captcha/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nodejs-promise-allsettled-batch-captcha) |
| [phrase-min-max-length-parameters-image-captcha](articles/phrase-min-max-length-parameters-image-captcha/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/phrase-min-max-length-parameters-image-captcha) |
| [powershell-captchaai-windows-automation](articles/powershell-captchaai-windows-automation/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/powershell-captchaai-windows-automation) |
| [proxy-authentication-methods-captchaai](articles/proxy-authentication-methods-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/proxy-authentication-methods-captchaai) |
| [python-asyncio-captchaai-concurrent-solving](articles/python-asyncio-captchaai-concurrent-solving/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-asyncio-captchaai-concurrent-solving) |
| [python-wrapper-library-captchaai-api](articles/python-wrapper-library-captchaai-api/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-wrapper-library-captchaai-api) |
| [recaptcha-data-s-parameter-explained](articles/recaptcha-data-s-parameter-explained/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/recaptcha-data-s-parameter-explained) |
| [recaptcha-v3-action-parameter-explained](articles/recaptcha-v3-action-parameter-explained/) | reCAPTCHA v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/recaptcha-v3-action-parameter-explained) |
| [semaphore-patterns-captcha-concurrency](articles/semaphore-patterns-captcha-concurrency/) | null | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/semaphore-patterns-captcha-concurrency) |
| [socks5-proxy-captchaai-setup-configuration](articles/socks5-proxy-captchaai-setup-configuration/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/socks5-proxy-captchaai-setup-configuration) |
| [solve-bls-captcha-nodejs](articles/solve-bls-captcha-nodejs/) | BLS CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-bls-captcha-nodejs) |
| [solve-bls-captcha-python](articles/solve-bls-captcha-python/) | BLS CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-bls-captcha-python) |
| [solve-cloudflare-challenge-nodejs](articles/solve-cloudflare-challenge-nodejs/) | Cloudflare Challenge | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-cloudflare-challenge-nodejs) |
| [solve-cloudflare-challenge-python](articles/solve-cloudflare-challenge-python/) | Cloudflare Challenge | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-cloudflare-challenge-python) |
| [solve-geetest-v3-nodejs](articles/solve-geetest-v3-nodejs/) | GeeTest v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-geetest-v3-nodejs) |
| [solve-geetest-v3-php](articles/solve-geetest-v3-php/) | GeeTest v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-geetest-v3-php) |
| [solve-geetest-v3-python](articles/solve-geetest-v3-python/) | GeeTest v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-geetest-v3-python) |
| [solve-grid-image-captcha-nodejs](articles/solve-grid-image-captcha-nodejs/) | Grid Image CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-grid-image-captcha-nodejs) |
| [solve-grid-image-captcha-python](articles/solve-grid-image-captcha-python/) | Grid Image CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-grid-image-captcha-python) |
| [solve-image-captcha-base64-api](articles/solve-image-captcha-base64-api/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-image-captcha-base64-api) |
| [solve-image-captcha-nodejs](articles/solve-image-captcha-nodejs/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-image-captcha-nodejs) |
| [solve-image-captcha-python-ocr](articles/solve-image-captcha-python-ocr/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-image-captcha-python-ocr) |
| [solve-multiple-captcha-types-workflow](articles/solve-multiple-captcha-types-workflow/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-multiple-captcha-types-workflow) |
| [solve-recaptcha-invisible-nodejs](articles/solve-recaptcha-invisible-nodejs/) | reCAPTCHA Invisible | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-recaptcha-invisible-nodejs) |
| [solve-recaptcha-invisible-python](articles/solve-recaptcha-invisible-python/) | reCAPTCHA Invisible | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-recaptcha-invisible-python) |
| [solve-recaptcha-v2-enterprise-nodejs](articles/solve-recaptcha-v2-enterprise-nodejs/) | reCAPTCHA v2 Enterprise | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-recaptcha-v2-enterprise-nodejs) |
| [solve-recaptcha-v2-enterprise-python](articles/solve-recaptcha-v2-enterprise-python/) | reCAPTCHA v2 Enterprise | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-recaptcha-v2-enterprise-python) |
| [solve-recaptcha-v3-enterprise-php](articles/solve-recaptcha-v3-enterprise-php/) | reCAPTCHA v3 Enterprise | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-recaptcha-v3-enterprise-php) |
| [solving-captchas-dart-flutter-captchaai](articles/solving-captchas-dart-flutter-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-dart-flutter-captchaai) |
| [solving-captchas-kotlin-captchaai-api](articles/solving-captchas-kotlin-captchaai-api/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-kotlin-captchaai-api) |
| [solving-captchas-perl-captchaai-api](articles/solving-captchas-perl-captchaai-api/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-perl-captchaai-api) |
| [solving-captchas-r-research-data-collection](articles/solving-captchas-r-research-data-collection/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-r-research-data-collection) |
| [solving-captchas-ruby-captchaai-api](articles/solving-captchas-ruby-captchaai-api/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-ruby-captchaai-api) |
| [solving-captchas-rust-captchaai-api](articles/solving-captchas-rust-captchaai-api/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-rust-captchaai-api) |
| [solving-captchas-scala-captchaai-api](articles/solving-captchas-scala-captchaai-api/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-scala-captchaai-api) |
| [solving-captchas-swift-captchaai-api](articles/solving-captchas-swift-captchaai-api/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-swift-captchaai-api) |
| [type-safe-captchaai-client-typescript-generics](articles/type-safe-captchaai-client-typescript-generics/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/type-safe-captchaai-client-typescript-generics) |
| [ansible-captchaai-worker-deployment](articles/ansible-captchaai-worker-deployment/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/ansible-captchaai-worker-deployment) |
| [auto-scaling-captcha-solving-workers](articles/auto-scaling-captcha-solving-workers/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/auto-scaling-captcha-solving-workers) |
| [aws-lambda-captchaai-serverless-captcha](articles/aws-lambda-captchaai-serverless-captcha/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/aws-lambda-captchaai-serverless-captcha) |
| [aws-sns-captchaai-event-driven-captcha](articles/aws-sns-captchaai-event-driven-captcha/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/aws-sns-captchaai-event-driven-captcha) |
| [azure-functions-captchaai-cloud-integration](articles/azure-functions-captchaai-cloud-integration/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/azure-functions-captchaai-cloud-integration) |
| [blue-green-deployment-captcha-solving](articles/blue-green-deployment-captcha-solving/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/blue-green-deployment-captcha-solving) |
| [captchaai-alerts-pagerduty-integration](articles/captchaai-alerts-pagerduty-integration/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-alerts-pagerduty-integration) |
| [captchaai-load-balancer-architecture](articles/captchaai-load-balancer-architecture/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-load-balancer-architecture) |
| [captchaai-monitoring-datadog-metrics-alerts](articles/captchaai-monitoring-datadog-metrics-alerts/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-monitoring-datadog-metrics-alerts) |
| [captchaai-monitoring-new-relic-apm](articles/captchaai-monitoring-new-relic-apm/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-monitoring-new-relic-apm) |
| [disaster-recovery-captcha-solving-pipelines](articles/disaster-recovery-captcha-solving-pipelines/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/disaster-recovery-captcha-solving-pipelines) |
| [docker-captchaai-containerized-captcha-solving](articles/docker-captchaai-containerized-captcha-solving/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/docker-captchaai-containerized-captcha-solving) |
| [elk-stack-captcha-solving-log-analysis](articles/elk-stack-captcha-solving-log-analysis/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/elk-stack-captcha-solving-log-analysis) |
| [github-actions-captchaai-cicd-captcha-testing](articles/github-actions-captchaai-cicd-captcha-testing/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/github-actions-captchaai-cicd-captcha-testing) |
| [google-cloud-functions-captchaai-integration](articles/google-cloud-functions-captchaai-integration/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/google-cloud-functions-captchaai-integration) |
| [grafana-dashboard-templates-captchaai](articles/grafana-dashboard-templates-captchaai/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/grafana-dashboard-templates-captchaai) |
| [high-availability-captcha-solving-failover](articles/high-availability-captcha-solving-failover/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/high-availability-captcha-solving-failover) |
| [horizontal-scaling-captcha-solving-workers](articles/horizontal-scaling-captcha-solving-workers/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/horizontal-scaling-captcha-solving-workers) |
| [kafka-captchaai-streaming-captcha-processing](articles/kafka-captchaai-streaming-captcha-processing/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/kafka-captchaai-streaming-captcha-processing) |
| [kubernetes-job-queues-captcha-solving-scale](articles/kubernetes-job-queues-captcha-solving-scale/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/kubernetes-job-queues-captcha-solving-scale) |
| [monitoring-captcha-solve-rates-prometheus-grafana](articles/monitoring-captcha-solve-rates-prometheus-grafana/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/monitoring-captcha-solve-rates-prometheus-grafana) |
| [multi-region-captcha-solving-architecture](articles/multi-region-captcha-solving-architecture/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/multi-region-captcha-solving-architecture) |
| [nats-messaging-captchaai-task-distribution](articles/nats-messaging-captchaai-task-distribution/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nats-messaging-captchaai-task-distribution) |
| [opentelemetry-tracing-captcha-pipelines](articles/opentelemetry-tracing-captcha-pipelines/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/opentelemetry-tracing-captcha-pipelines) |
| [rabbitmq-captchaai-message-queue-integration](articles/rabbitmq-captchaai-message-queue-integration/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/rabbitmq-captchaai-message-queue-integration) |
| [redis-queue-captchaai-distributed-processing](articles/redis-queue-captchaai-distributed-processing/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/redis-queue-captchaai-distributed-processing) |
| [rolling-updates-captcha-solving-workers](articles/rolling-updates-captcha-solving-workers/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/rolling-updates-captcha-solving-workers) |
| [terraform-captchaai-infrastructure-as-code](articles/terraform-captchaai-infrastructure-as-code/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/terraform-captchaai-infrastructure-as-code) |
| [android-espresso-captcha-testing](articles/android-espresso-captcha-testing/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/android-espresso-captcha-testing) |
| [apify-captchaai-cloud-scraping-integration](articles/apify-captchaai-cloud-scraping-integration/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/apify-captchaai-cloud-scraping-integration) |
| [bright-data-captchaai-proxy-integration](articles/bright-data-captchaai-proxy-integration/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bright-data-captchaai-proxy-integration) |
| [colly-captchaai-go-scraping-captcha-solving](articles/colly-captchaai-go-scraping-captcha-solving/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/colly-captchaai-go-scraping-captcha-solving) |
| [crawlee-captchaai-modern-scraping-integration](articles/crawlee-captchaai-modern-scraping-integration/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/crawlee-captchaai-modern-scraping-integration) |
| [cypress-captchaai-e2e-testing-captcha](articles/cypress-captchaai-e2e-testing-captcha/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/cypress-captchaai-e2e-testing-captcha) |
| [flutter-webview-captcha-handling](articles/flutter-webview-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/flutter-webview-captcha-handling) |
| [ios-xcuitest-captcha-handling](articles/ios-xcuitest-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/ios-xcuitest-captcha-handling) |
| [octoparse-captchaai-visual-scraping-captcha](articles/octoparse-captchaai-visual-scraping-captcha/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/octoparse-captchaai-visual-scraping-captcha) |
| [oxylabs-captchaai-datacenter-proxy-integration](articles/oxylabs-captchaai-datacenter-proxy-integration/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/oxylabs-captchaai-datacenter-proxy-integration) |
| [parsehub-captchaai-no-code-scraping](articles/parsehub-captchaai-no-code-scraping/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/parsehub-captchaai-no-code-scraping) |
| [puppeteer-stealth-captchaai-browser-automation](articles/puppeteer-stealth-captchaai-browser-automation/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/puppeteer-stealth-captchaai-browser-automation) |
| [react-native-webview-captcha-solving](articles/react-native-webview-captcha-solving/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/react-native-webview-captcha-solving) |
| [scrapy-spider-middleware-captchaai-advanced](articles/scrapy-spider-middleware-captchaai-advanced/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scrapy-spider-middleware-captchaai-advanced) |
| [selenium-grid-captchaai-distributed-solving](articles/selenium-grid-captchaai-distributed-solving/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/selenium-grid-captchaai-distributed-solving) |
| [selenium-wire-captchaai-request-interception](articles/selenium-wire-captchaai-request-interception/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/selenium-wire-captchaai-request-interception) |
| [smartproxy-captchaai-residential-proxy-setup](articles/smartproxy-captchaai-residential-proxy-setup/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/smartproxy-captchaai-residential-proxy-setup) |
| [vault-integration-captchaai-api-key](articles/vault-integration-captchaai-api-key/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/vault-integration-captchaai-api-key) |
| [aiohttp-captchaai-async](articles/aiohttp-captchaai-async/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/aiohttp-captchaai-async) |
| [airtable-captchaai-database-captcha](articles/airtable-captchaai-database-captcha/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/airtable-captchaai-database-captcha) |
| [axios-captchaai-no-browser](articles/axios-captchaai-no-browser/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/axios-captchaai-no-browser) |
| [curl-captchaai-cli](articles/curl-captchaai-cli/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/curl-captchaai-cli) |
| [fastapi-captchaai-microservice](articles/fastapi-captchaai-microservice/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/fastapi-captchaai-microservice) |
| [google-apps-script-captchaai-captcha](articles/google-apps-script-captchaai-captcha/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/google-apps-script-captchaai-captcha) |
| [httpx-captchaai-integration](articles/httpx-captchaai-integration/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/httpx-captchaai-integration) |
| [make-integromat-captchaai-captcha-automation](articles/make-integromat-captchaai-captcha-automation/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/make-integromat-captchaai-captcha-automation) |
| [power-automate-captchaai-captcha-solving](articles/power-automate-captchaai-captcha-solving/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/power-automate-captchaai-captcha-solving) |
| [retool-captchaai-internal-tool-captcha](articles/retool-captchaai-internal-tool-captcha/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/retool-captchaai-internal-tool-captcha) |
| [scrapy-captchaai-integration](articles/scrapy-captchaai-integration/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scrapy-captchaai-integration) |
| [undetected-chromedriver-captchaai](articles/undetected-chromedriver-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/undetected-chromedriver-captchaai) |
| [build-automated-testing-pipeline-captchaai](articles/build-automated-testing-pipeline-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-automated-testing-pipeline-captchaai) |
| [build-competitor-analysis-dashboard-captchaai](articles/build-competitor-analysis-dashboard-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-competitor-analysis-dashboard-captchaai) |
| [build-content-change-monitoring-bot-captchaai](articles/build-content-change-monitoring-bot-captchaai/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-content-change-monitoring-bot-captchaai) |
| [build-job-listing-aggregator-captchaai](articles/build-job-listing-aggregator-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-job-listing-aggregator-captchaai) |
| [build-lead-generation-pipeline-captchaai](articles/build-lead-generation-pipeline-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-lead-generation-pipeline-captchaai) |
| [build-multi-site-data-aggregation-captchaai](articles/build-multi-site-data-aggregation-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-multi-site-data-aggregation-captchaai) |
| [build-price-comparison-bot-python-captchaai](articles/build-price-comparison-bot-python-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-price-comparison-bot-python-captchaai) |
| [build-review-monitoring-system-captchaai](articles/build-review-monitoring-system-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-review-monitoring-system-captchaai) |
| [abstract-captcha-solver-provider-agnostic](articles/abstract-captcha-solver-provider-agnostic/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/abstract-captcha-solver-provider-agnostic) |
| [async-captcha-solving-python-asyncio](articles/async-captcha-solving-python-asyncio/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/async-captcha-solving-python-asyncio) |
| [backpressure-handling-captcha-solving-queues](articles/backpressure-handling-captcha-solving-queues/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/backpressure-handling-captcha-solving-queues) |
| [batch-captcha-cost-estimation-budget-alerts](articles/batch-captcha-cost-estimation-budget-alerts/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/batch-captcha-cost-estimation-budget-alerts) |
| [batch-recaptcha-solving-form-pipelines](articles/batch-recaptcha-solving-form-pipelines/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/batch-recaptcha-solving-form-pipelines) |
| [bls-captcha-instructions-code-solving](articles/bls-captcha-instructions-code-solving/) | BLS | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bls-captcha-instructions-code-solving) |
| [browser-console-captcha-detection-sitekeys-parameters](articles/browser-console-captcha-detection-sitekeys-parameters/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/browser-console-captcha-detection-sitekeys-parameters) |
| [building-captcha-solving-queue-nodejs](articles/building-captcha-solving-queue-nodejs/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-captcha-solving-queue-nodejs) |
| [building-captcha-solving-queue-python](articles/building-captcha-solving-queue-python/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-captcha-solving-queue-python) |
| [building-client-captcha-pipelines-captchaai](articles/building-client-captcha-pipelines-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-client-captcha-pipelines-captchaai) |
| [bulkhead-pattern-captcha-solving-isolation](articles/bulkhead-pattern-captcha-solving-isolation/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bulkhead-pattern-captcha-solving-isolation) |
| [caching-captcha-tokens-reuse-guide](articles/caching-captcha-tokens-reuse-guide/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/caching-captcha-tokens-reuse-guide) |
| [captchaai-callback-error-handling-patterns](articles/captchaai-callback-error-handling-patterns/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-callback-error-handling-patterns) |
| [captchaai-debug-logger-development](articles/captchaai-debug-logger-development/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-debug-logger-development) |
| [captchaai-health-check-monitoring-script](articles/captchaai-health-check-monitoring-script/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-health-check-monitoring-script) |
| [captchaai-scraping-stack-100-budget](articles/captchaai-scraping-stack-100-budget/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-scraping-stack-100-budget) |
| [captchaai-webhook-security-callback-validation](articles/captchaai-webhook-security-callback-validation/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-webhook-security-callback-validation) |
| [captcha-chains-sequential-multi-step-forms](articles/captcha-chains-sequential-multi-step-forms/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-chains-sequential-multi-step-forms) |
| [captcha-event-bus-nodejs-captchaai](articles/captcha-event-bus-nodejs-captchaai/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-event-bus-nodejs-captchaai) |
| [captcha-handling-django-captchaai](articles/captcha-handling-django-captchaai/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-django-captchaai) |
| [captcha-handling-flask-captchaai](articles/captcha-handling-flask-captchaai/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-flask-captchaai) |
| [captcha-handling-mobile-appium](articles/captcha-handling-mobile-appium/) | null | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-mobile-appium) |
| [captcha-popup-modal-detection-injection](articles/captcha-popup-modal-detection-injection/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-popup-modal-detection-injection) |
| [captcha-retry-queue-exponential-backoff](articles/captcha-retry-queue-exponential-backoff/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-retry-queue-exponential-backoff) |
| [captcha-session-state-distributed-workers](articles/captcha-session-state-distributed-workers/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-session-state-distributed-workers) |
| [captcha-solving-10000-tasks-per-hour](articles/captcha-solving-10000-tasks-per-hour/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-10000-tasks-per-hour) |
| [captcha-solving-audit-logs-compliance](articles/captcha-solving-audit-logs-compliance/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-audit-logs-compliance) |
| [captcha-solving-csharp](articles/captcha-solving-csharp/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-csharp) |
| [captcha-solving-fallback-chains](articles/captcha-solving-fallback-chains/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-fallback-chains) |
| [captcha-solving-go](articles/captcha-solving-go/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-go) |
| [captcha-solving-java](articles/captcha-solving-java/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-java) |
| [captcha-solving-php](articles/captcha-solving-php/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-php) |
| [chaos-engineering-captcha-solving-pipelines](articles/chaos-engineering-captcha-solving-pipelines/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/chaos-engineering-captcha-solving-pipelines) |
| [chrome-devtools-network-captcha-debugging](articles/chrome-devtools-network-captcha-debugging/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/chrome-devtools-network-captcha-debugging) |
| [cloudflare-turnstile-sitekey-extraction](articles/cloudflare-turnstile-sitekey-extraction/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/cloudflare-turnstile-sitekey-extraction) |
| [compensating-transactions-captcha-workflows](articles/compensating-transactions-captcha-workflows/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/compensating-transactions-captcha-workflows) |
| [connection-keepalive-http2-captcha-api](articles/connection-keepalive-http2-captcha-api/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/connection-keepalive-http2-captcha-api) |
| [connection-pool-sizing-captcha-api-clients](articles/connection-pool-sizing-captcha-api-clients/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/connection-pool-sizing-captcha-api-clients) |
| [csv-batch-captcha-solving-python](articles/csv-batch-captcha-solving-python/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/csv-batch-captcha-solving-python) |
| [debugging-captcha-api-charles-proxy](articles/debugging-captcha-api-charles-proxy/) | null | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/debugging-captcha-api-charles-proxy) |
| [deduplicating-captcha-solves-database-locking](articles/deduplicating-captcha-solves-database-locking/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/deduplicating-captcha-solves-database-locking) |
| [dependency-injection-captcha-solving-services](articles/dependency-injection-captcha-solving-services/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/dependency-injection-captcha-solving-services) |
| [discord-webhook-captcha-pipeline-alerts](articles/discord-webhook-captcha-pipeline-alerts/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/discord-webhook-captcha-pipeline-alerts) |
| [dynamic-captcha-loading-lazy-loaded-detection](articles/dynamic-captcha-loading-lazy-loaded-detection/) | null | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/dynamic-captcha-loading-lazy-loaded-detection) |
| [dynamodb-serverless-captcha-solve-tracking](articles/dynamodb-serverless-captcha-solve-tracking/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/dynamodb-serverless-captcha-solve-tracking) |
| [encrypting-captcha-api-traffic-tls](articles/encrypting-captcha-api-traffic-tls/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/encrypting-captcha-api-traffic-tls) |
| [error-budget-tracking-captcha-reliability](articles/error-budget-tracking-captcha-reliability/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/error-budget-tracking-captcha-reliability) |
| [expressjs-captchaai-server-side-captcha](articles/expressjs-captchaai-server-side-captcha/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/expressjs-captchaai-server-side-captcha) |
| [extracting-recaptcha-parameters-page-source](articles/extracting-recaptcha-parameters-page-source/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/extracting-recaptcha-parameters-page-source) |
| [factory-pattern-multi-type-captcha-solving](articles/factory-pattern-multi-type-captcha-solving/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/factory-pattern-multi-type-captcha-solving) |
| [fiddler-inspect-captchaai-api-traffic](articles/fiddler-inspect-captchaai-api-traffic/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/fiddler-inspect-captchaai-api-traffic) |
| [geetest-token-injection-browser-automation](articles/geetest-token-injection-browser-automation/) | GeeTest v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/geetest-token-injection-browser-automation) |
| [geetest-v3-slider-parameter-extraction](articles/geetest-v3-slider-parameter-extraction/) | GeeTest | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/geetest-v3-slider-parameter-extraction) |
| [grid-image-coordinate-mapping](articles/grid-image-coordinate-mapping/) | Grid Image | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/grid-image-coordinate-mapping) |
| [handling-multiple-captchas-single-page](articles/handling-multiple-captchas-single-page/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/handling-multiple-captchas-single-page) |
| [health-check-endpoints-captcha-workers](articles/health-check-endpoints-captcha-workers/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/health-check-endpoints-captcha-workers) |
| [http-replay-captcha-api-debugging](articles/http-replay-captcha-api-debugging/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/http-replay-captcha-api-debugging) |
| [idempotent-captcha-solving-prevent-duplicates](articles/idempotent-captcha-solving-prevent-duplicates/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/idempotent-captcha-solving-prevent-duplicates) |
| [iframe-captcha-extraction-nested-frames](articles/iframe-captcha-extraction-nested-frames/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/iframe-captcha-extraction-nested-frames) |
| [image-captcha-confidence-scores-quality](articles/image-captcha-confidence-scores-quality/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/image-captcha-confidence-scores-quality) |
| [image-captcha-preprocessing-contrast-rotation](articles/image-captcha-preprocessing-contrast-rotation/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/image-captcha-preprocessing-contrast-rotation) |
| [load-testing-captcha-solving-pipeline](articles/load-testing-captcha-solving-pipeline/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/load-testing-captcha-solving-pipeline) |
| [memory-cpu-optimization-captcha-workers](articles/memory-cpu-optimization-captcha-workers/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/memory-cpu-optimization-captcha-workers) |
| [mobile-browser-automation-captcha-solving](articles/mobile-browser-automation-captcha-solving/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/mobile-browser-automation-captcha-solving) |
| [mongodb-captcha-solve-history-analytics](articles/mongodb-captcha-solve-history-analytics/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/mongodb-captcha-solve-history-analytics) |
| [n8n-captchaai-no-code-automation](articles/n8n-captchaai-no-code-automation/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/n8n-captchaai-no-code-automation) |
| [nodejs-captcha-solving-retry-error-handling](articles/nodejs-captcha-solving-retry-error-handling/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nodejs-captcha-solving-retry-error-handling) |
| [nodejs-playwright-captchaai-complete-integration](articles/nodejs-playwright-captchaai-complete-integration/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nodejs-playwright-captchaai-complete-integration) |
| [nodejs-puppeteer-captchaai-advanced-patterns](articles/nodejs-puppeteer-captchaai-advanced-patterns/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nodejs-puppeteer-captchaai-advanced-patterns) |
| [nodejs-worker-threads-parallel-captcha-solving](articles/nodejs-worker-threads-parallel-captcha-solving/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nodejs-worker-threads-parallel-captcha-solving) |
| [notion-api-captchaai-data-entry](articles/notion-api-captchaai-data-entry/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/notion-api-captchaai-data-entry) |
| [plugin-architecture-captcha-solving-pipelines](articles/plugin-architecture-captcha-solving-pipelines/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/plugin-architecture-captcha-solving-pipelines) |
| [profiling-captcha-bottlenecks-python](articles/profiling-captcha-bottlenecks-python/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/profiling-captcha-bottlenecks-python) |
| [pwa-captcha-handling-guide](articles/pwa-captcha-handling-guide/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/pwa-captcha-handling-guide) |
| [pytest-captchaai-test-fixtures](articles/pytest-captchaai-test-fixtures/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/pytest-captchaai-test-fixtures) |
| [python-beautifulsoup-captchaai-protected-pages](articles/python-beautifulsoup-captchaai-protected-pages/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-beautifulsoup-captchaai-protected-pages) |
| [python-captcha-solving-retry-error-patterns](articles/python-captcha-solving-retry-error-patterns/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-captcha-solving-retry-error-patterns) |
| [python-multiprocessing-parallel-captcha-solving](articles/python-multiprocessing-parallel-captcha-solving/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-multiprocessing-parallel-captcha-solving) |
| [python-playwright-captchaai-complete-guide](articles/python-playwright-captchaai-complete-guide/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-playwright-captchaai-complete-guide) |
| [python-selenium-captchaai-complete-guide](articles/python-selenium-captchaai-complete-guide/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-selenium-captchaai-complete-guide) |
| [python-threadpool-captcha-parallelism](articles/python-threadpool-captcha-parallelism/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-threadpool-captcha-parallelism) |
| [queue-batch-captcha-priority-processing](articles/queue-batch-captcha-priority-processing/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/queue-batch-captcha-priority-processing) |
| [rate-limiting-own-captcha-requests](articles/rate-limiting-own-captcha-requests/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/rate-limiting-own-captcha-requests) |
| [recaptcha-single-page-application-dynamic](articles/recaptcha-single-page-application-dynamic/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/recaptcha-single-page-application-dynamic) |
| [redis-captcha-token-ttl-management](articles/redis-captcha-token-ttl-management/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/redis-captcha-token-ttl-management) |
| [retry-storm-prevention-captcha-systems](articles/retry-storm-prevention-captcha-systems/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/retry-storm-prevention-captcha-systems) |
| [reusable-captcha-modules-client-projects](articles/reusable-captcha-modules-client-projects/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/reusable-captcha-modules-client-projects) |
| [scheduled-captcha-solving-cron-jobs](articles/scheduled-captcha-solving-cron-jobs/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scheduled-captcha-solving-cron-jobs) |
| [securing-captchaai-credentials-env-vars](articles/securing-captchaai-credentials-env-vars/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/securing-captchaai-credentials-env-vars) |
| [shadow-dom-captcha-handling-web-components](articles/shadow-dom-captcha-handling-web-components/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/shadow-dom-captcha-handling-web-components) |
| [slack-bot-captcha-notifications](articles/slack-bot-captcha-notifications/) | null | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/slack-bot-captcha-notifications) |
| [solving-cloudflare-turnstile-nodejs](articles/solving-cloudflare-turnstile-nodejs/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-cloudflare-turnstile-nodejs) |
| [solving-cloudflare-turnstile-python-requests](articles/solving-cloudflare-turnstile-python-requests/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-cloudflare-turnstile-python-requests) |
| [solving-geetest-v3-nodejs-captchaai](articles/solving-geetest-v3-nodejs-captchaai/) | GeeTest v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-geetest-v3-nodejs-captchaai) |
| [solving-geetest-v3-python-captchaai](articles/solving-geetest-v3-python-captchaai/) | reCAPTCHA v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-geetest-v3-python-captchaai) |
| [solving-recaptcha-v2-nodejs-fetch](articles/solving-recaptcha-v2-nodejs-fetch/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-recaptcha-v2-nodejs-fetch) |
| [solving-recaptcha-v2-python-requests](articles/solving-recaptcha-v2-python-requests/) | reCAPTCHA v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-recaptcha-v2-python-requests) |
| [sqlite-local-captcha-solve-caching](articles/sqlite-local-captcha-solve-caching/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/sqlite-local-captcha-solve-caching) |
| [sse-realtime-captcha-solve-notifications](articles/sse-realtime-captcha-solve-notifications/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/sse-realtime-captcha-solve-notifications) |
| [storing-captcha-results-postgresql](articles/storing-captcha-results-postgresql/) | null | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/storing-captcha-results-postgresql) |
| [streaming-batch-captcha-results-processing](articles/streaming-batch-captcha-results-processing/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/streaming-batch-captcha-results-processing) |
| [structured-logging-captcha-operations](articles/structured-logging-captcha-operations/) | null | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/structured-logging-captcha-operations) |
| [testing-captchaai-parallel-run-migration](articles/testing-captchaai-parallel-run-migration/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/testing-captchaai-parallel-run-migration) |
| [time-series-captcha-solve-performance-trends](articles/time-series-captcha-solve-performance-trends/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/time-series-captcha-solve-performance-trends) |
| [token-bucket-rate-limited-captcha-concurrency](articles/token-bucket-rate-limited-captcha-concurrency/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/token-bucket-rate-limited-captcha-concurrency) |
| [typescript-captchaai-type-safe-solving](articles/typescript-captchaai-type-safe-solving/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/typescript-captchaai-type-safe-solving) |
| [webhook-endpoint-monitoring-captcha-callbacks](articles/webhook-endpoint-monitoring-captcha-callbacks/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/webhook-endpoint-monitoring-captcha-callbacks) |
| [zapier-captchaai-no-code-automation](articles/zapier-captchaai-no-code-automation/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/zapier-captchaai-no-code-automation) |
| [academic-research-scraping-captcha-solving](articles/academic-research-scraping-captcha-solving/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/academic-research-scraping-captcha-solving) |
| [ad-verification-captcha-handling](articles/ad-verification-captcha-handling/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/ad-verification-captcha-handling) |
| [airline-fare-monitoring-captcha-handling](articles/airline-fare-monitoring-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/airline-fare-monitoring-captcha-handling) |
| [arabic-rtl-captcha-handling](articles/arabic-rtl-captcha-handling/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/arabic-rtl-captcha-handling) |
| [auction-site-monitoring-captcha-handling](articles/auction-site-monitoring-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/auction-site-monitoring-captcha-handling) |
| [automated-form-submission-captcha-handling](articles/automated-form-submission-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/automated-form-submission-captcha-handling) |
| [automated-login-captcha-handling](articles/automated-login-captcha-handling/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/automated-login-captcha-handling) |
| [automation-bot-captcha-handling](articles/automation-bot-captcha-handling/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/automation-bot-captcha-handling) |
| [bls-captcha-government-portals-handling](articles/bls-captcha-government-portals-handling/) | BLS CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bls-captcha-government-portals-handling) |
| [captcha-automation-scripts](articles/captcha-automation-scripts/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-automation-scripts) |
| [captcha-detection-scraping-explained](articles/captcha-detection-scraping-explained/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-detection-scraping-explained) |
| [captcha-handling-continuous-integration-testing](articles/captcha-handling-continuous-integration-testing/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-continuous-integration-testing) |
| [captcha-handling-registration-flow-testing](articles/captcha-handling-registration-flow-testing/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-registration-flow-testing) |
| [captcha-handling-sneaker-bot-automation](articles/captcha-handling-sneaker-bot-automation/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-sneaker-bot-automation) |
| [captcha-scraping-nodejs-tutorial](articles/captcha-scraping-nodejs-tutorial/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-scraping-nodejs-tutorial) |
| [captcha-scraping-python-guide](articles/captcha-scraping-python-guide/) | reCAPTCHA v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-scraping-python-guide) |
| [captcha-solving-api-endpoint-testing-web-forms](articles/captcha-solving-api-endpoint-testing-web-forms/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-api-endpoint-testing-web-forms) |
| [captcha-solving-qa-authorized-testing](articles/captcha-solving-qa-authorized-testing/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-qa-authorized-testing) |
| [captcha-solving-ticket-purchase-automation](articles/captcha-solving-ticket-purchase-automation/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-ticket-purchase-automation) |
| [cyrillic-text-captcha-solving](articles/cyrillic-text-captcha-solving/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/cyrillic-text-captcha-solving) |
| [domain-whois-lookup-captcha-handling](articles/domain-whois-lookup-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/domain-whois-lookup-captcha-handling) |
| [ecommerce-price-monitoring](articles/ecommerce-price-monitoring/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/ecommerce-price-monitoring) |
| [event-ticket-monitoring-captcha-handling](articles/event-ticket-monitoring-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/event-ticket-monitoring-captcha-handling) |
| [financial-data-scraping-captcha-handling](articles/financial-data-scraping-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/financial-data-scraping-captcha-handling) |
| [flight-status-monitoring-captcha-handling](articles/flight-status-monitoring-captcha-handling/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/flight-status-monitoring-captcha-handling) |
| [food-delivery-price-comparison-captcha-solving](articles/food-delivery-price-comparison-captcha-solving/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/food-delivery-price-comparison-captcha-solving) |
| [gis-mapping-data-captcha-extraction](articles/gis-mapping-data-captcha-extraction/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/gis-mapping-data-captcha-extraction) |
| [government-portal-automation-captcha-solving](articles/government-portal-automation-captcha-solving/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/government-portal-automation-captcha-solving) |
| [handle-captcha-in-web-scraping-workflows](articles/handle-captcha-in-web-scraping-workflows/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/handle-captcha-in-web-scraping-workflows) |
| [headless-browser-captcha-issues](articles/headless-browser-captcha-issues/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/headless-browser-captcha-issues) |
| [healthcare-data-collection-captcha-handling](articles/healthcare-data-collection-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/healthcare-data-collection-captcha-handling) |
| [insurance-quote-comparison-captcha-automation](articles/insurance-quote-comparison-captcha-automation/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/insurance-quote-comparison-captcha-automation) |
| [job-board-scraping-captcha-handling](articles/job-board-scraping-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/job-board-scraping-captcha-handling) |
| [legal-research-scraping-captcha-handling](articles/legal-research-scraping-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/legal-research-scraping-captcha-handling) |
| [market-research-data-collection](articles/market-research-data-collection/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/market-research-data-collection) |
| [multi-step-checkout-automation-captcha-solving](articles/multi-step-checkout-automation-captcha-solving/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/multi-step-checkout-automation-captcha-solving) |
| [multi-step-workflow-automation-captchaai](articles/multi-step-workflow-automation-captchaai/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/multi-step-workflow-automation-captchaai) |
| [news-media-aggregation-captcha-handling](articles/news-media-aggregation-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/news-media-aggregation-captcha-handling) |
| [pharmacy-price-comparison-captcha-handling](articles/pharmacy-price-comparison-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/pharmacy-price-comparison-captcha-handling) |
| [playwright-captcha-handling](articles/playwright-captcha-handling/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/playwright-captcha-handling) |
| [proxy-rotation-captcha-scraping](articles/proxy-rotation-captcha-scraping/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/proxy-rotation-captcha-scraping) |
| [public-records-search-captcha-handling](articles/public-records-search-captcha-handling/) | Image/OCR CAPTCHA | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/public-records-search-captcha-handling) |
| [puppeteer-captcha-solving-nodejs](articles/puppeteer-captcha-solving-nodejs/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/puppeteer-captcha-solving-nodejs) |
| [real-estate-data-scraping](articles/real-estate-data-scraping/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/real-estate-data-scraping) |
| [reduce-captcha-interruptions-in-web-scraping](articles/reduce-captcha-interruptions-in-web-scraping/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/reduce-captcha-interruptions-in-web-scraping) |
| [retail-inventory-monitoring-captcha-handling](articles/retail-inventory-monitoring-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/retail-inventory-monitoring-captcha-handling) |
| [retail-site-captcha-handling](articles/retail-site-captcha-handling/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/retail-site-captcha-handling) |
| [salary-compensation-data-captcha-handling](articles/salary-compensation-data-captcha-handling/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/salary-compensation-data-captcha-handling) |
| [scraping-automation-captcha-handling](articles/scraping-automation-captcha-handling/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scraping-automation-captcha-handling) |
| [scraping-protected-websites-captcha](articles/scraping-protected-websites-captcha/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scraping-protected-websites-captcha) |
| [scraping-reliability-captcha-handling](articles/scraping-reliability-captcha-handling/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scraping-reliability-captcha-handling) |
| [search-results-captcha-handling](articles/search-results-captcha-handling/) | reCAPTCHA v3 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/search-results-captcha-handling) |
| [selenium-captcha-handling-python](articles/selenium-captcha-handling-python/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/selenium-captcha-handling-python) |
| [shipping-logistics-rate-scraping-captcha](articles/shipping-logistics-rate-scraping-captcha/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/shipping-logistics-rate-scraping-captcha) |
| [social-media-research-captcha-handling](articles/social-media-research-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/social-media-research-captcha-handling) |
| [solving-captchas-chinese-websites](articles/solving-captchas-chinese-websites/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-chinese-websites) |
| [solving-captchas-japanese-korean-websites](articles/solving-captchas-japanese-korean-websites/) | Image/OCR | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-japanese-korean-websites) |
| [sports-statistics-data-captcha-handling](articles/sports-statistics-data-captcha-handling/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/sports-statistics-data-captcha-handling) |
| [stock-market-data-captcha-handling](articles/stock-market-data-captcha-handling/) | Cloudflare Turnstile | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/stock-market-data-captcha-handling) |
| [supply-chain-monitoring-captcha-handling](articles/supply-chain-monitoring-captcha-handling/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/supply-chain-monitoring-captcha-handling) |
| [travel-fare-monitoring](articles/travel-fare-monitoring/) | All types | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/travel-fare-monitoring) |
| [university-registration-captcha-testing](articles/university-registration-captcha-testing/) | reCAPTCHA v2 | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/university-registration-captcha-testing) |


## How each example works

Every example follows the same pattern:

1. **Submit** â€” Send CAPTCHA parameters to `https://ocr.captchaai.com/in.php`
2. **Wait** â€” Pause 15-20 seconds for initial processing
3. **Poll** â€” Check `https://ocr.captchaai.com/res.php` every 5 seconds
4. **Result** â€” Receive the solved token for injection

## Prerequisites

- A CaptchaAI account with API key ([sign up](https://captchaai.com))
- One or more of: Python 3.8+, Node.js 16+, PHP 8.0+, Go 1.21+, Java 11+, .NET 8+, Ruby 3.0+, Rust 1.70+, Kotlin 1.9+, or Bash with curl and jq

## Environment setup

Every example uses a `.env` file for configuration. Copy `.env.example` and add your credentials:

```bash
cp .env.example .env
# Edit .env with your API key and target page details
```

**Never commit your `.env` file.** It contains your API key.

## Error handling

Every example handles these error categories:

| Category | Errors | What happens |
|----------|--------|-------------|
| Auth | `ERROR_WRONG_USER_KEY`, `ERROR_KEY_DOES_NOT_EXIST` | Clear message about API key |
| Balance | `ERROR_ZERO_BALANCE` | Message to top up account |
| Input | `ERROR_PAGEURL`, `ERROR_WRONG_GOOGLEKEY` | Parameter validation message |
| Transient | `ERROR_SERVER_ERROR` | Automatic retry with backoff |
| Solve | `ERROR_CAPTCHA_UNSOLVABLE` | Log and suggest parameter check |
| Proxy | `ERROR_BAD_PROXY`, `ERROR_PROXY_CONNECTION_FAILED` | Message to check proxy config |
| Polling | `CAPCHA_NOT_READY` | Normal â€” keeps polling |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding new examples.

## Links

- [CaptchaAI Website](https://captchaai.com)
- [API Documentation](https://captchaai.com/api-docs)
- [CaptchaAI Blog](https://blog.captchaai.com)

## License

MIT
