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
      python/                   # Python implementation
      node/                     # Node.js implementation
      php/                      # PHP implementation
  templates/                    # Starter templates for new examples
    python-basic/
    node-basic/
    php-basic/
```

## Examples

| Example | CAPTCHA Type | Languages | Article |
|---------|-------------|-----------|---------|
| [captchaai-quickstart](articles/captchaai-quickstart/) | reCAPTCHA v2 | Python, Node.js, PHP | [Blog](https://blog.captchaai.com/captchaai-quickstart) |

_More examples are added as articles are published. Check back regularly._

## How each example works

Every example follows the same pattern:

1. **Submit** — Send CAPTCHA parameters to `https://ocr.captchaai.com/in.php`
2. **Wait** — Pause 15-20 seconds for initial processing
3. **Poll** — Check `https://ocr.captchaai.com/res.php` every 5 seconds
4. **Result** — Receive the solved token for injection

## Prerequisites

- A CaptchaAI account with API key ([sign up](https://captchaai.com))
- Python 3.8+, Node.js 16+, or PHP 8.0+ depending on the example

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
| Polling | `CAPCHA_NOT_READY` | Normal — keeps polling |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding new examples.

## Links

- [CaptchaAI Website](https://captchaai.com)
- [API Documentation](https://captchaai.com/api-docs)
- [CaptchaAI Blog](https://blog.captchaai.com)

## License

MIT
