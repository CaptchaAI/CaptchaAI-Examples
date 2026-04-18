# Contributing to CaptchaAI Examples

## Overview

This repository holds full working code examples that accompany [CaptchaAI blog articles](https://blog.captchaai.com). Each example is a complete, runnable project — not a snippet.

## Support tiers

Every example pack is classified into a support tier:

| Tier | Badge | Criteria |
|------|-------|----------|
| **Verified** | 🟢 | All 10 languages CI-linted, solver-correct, manually reviewed |
| **Standard** | 🟡 | All 10 languages present, scaffolded from verified templates, basic validation passes |
| **Generated** | ⚪ | Scaffolded from template, may have known issues pending review |

### Promotion path

```
Generated → Standard → Verified
```

**Generated → Standard:** Fix any null labels, fix mojibake, ensure blog backlink, pass CI.

**Standard → Verified:** All 10 languages CI-linted, solver correctness validated (method + response field + params), manual code review completed.

### CI-validated languages

The following languages are checked in CI:

| Language | CI Check | Status |
|----------|----------|--------|
| Python | `ruff` (syntax + style) | Enforced |
| Node.js | `acorn` (ECMAScript 2020) | Enforced |
| PHP | `php -l` (syntax) | Enforced |
| Go | `go vet` / `gofmt` | Enforced |
| Ruby | `ruby -c` (syntax) | Enforced |
| Bash | `bash -n` + `shellcheck` | Enforced |
| Java | `javac` (compilation) | Enforced |
| Kotlin | `kotlinc` (syntax) | Best-effort |
| C# | — | Planned |
| Rust | — | Planned |

## When to add an example

An example pack should be created when:

- The blog article type is: API tutorial, Tutorial, Integration guide, Framework, DevOps tutorial, Project tutorial, or Use case guide
- The example provides clear value beyond the in-article code snippets
- The article has a complete draft (not a placeholder)
- The article's `editorial_review` is not `manual-only`

Do **not** create an example pack when:

- The in-article snippet is sufficient on its own
- The article is a comparison, explainer, or reference with no meaningful runnable code
- The example would be shallow or trivial (single API call with no workflow)

## Structure

Every example pack lives under `articles/{slug}/` and must contain:

```
articles/{slug}/
  README.md          # Setup, usage, expected output, troubleshooting
  .env.example       # All required environment variables with descriptive comments
  .gitignore         # Excludes .env, build artifacts for all languages
  python/            # Python implementation
    solve.py
    requirements.txt
  node/              # Node.js implementation
    solve.js
    package.json
  php/               # PHP implementation
    solve.php
    composer.json
  go/                # Go implementation
    solve.go
    go.mod
  java/              # Java implementation
    Solve.java
  csharp/            # C# implementation
    Solve.cs
    Solve.csproj
  ruby/              # Ruby implementation
    solve.rb
    Gemfile
  rust/              # Rust implementation
    src/main.rs
    Cargo.toml
  kotlin/            # Kotlin implementation
    solve.kt
  bash/              # Bash/cURL implementation
    solve.sh
```

## Supported languages

Every example pack **must** include all 10 supported languages:

| Language | Directory | Entry point | Manifest |
|----------|-----------|-------------|----------|
| Python | `python/` | `solve.py` | `requirements.txt` |
| Node.js | `node/` | `solve.js` | `package.json` |
| PHP | `php/` | `solve.php` | `composer.json` |
| Go | `go/` | `solve.go` | `go.mod` |
| Java | `java/` | `Solve.java` | — |
| C# | `csharp/` | `Solve.cs` | `Solve.csproj` |
| Ruby | `ruby/` | `solve.rb` | `Gemfile` |
| Rust | `rust/` | `src/main.rs` | `Cargo.toml` |
| Kotlin | `kotlin/` | `solve.kt` | — |
| Bash/cURL | `bash/` | `solve.sh` | — |

## Code requirements

### API endpoints

- Submit: `https://ocr.captchaai.com/in.php`
- Poll: `https://ocr.captchaai.com/res.php`
- Always use `json=1` for structured responses
- Never hardcode alternative or mock endpoints

### Credentials

- Load from `.env` file (dotenv for languages that support it, manual parsing for others)
- Use `YOUR_API_KEY` as the placeholder in `.env.example`
- Use `YOUR_SITE_KEY` as the placeholder for sitekeys
- Never commit real API keys
- `.gitignore` must exclude `.env`

### Input validation

Every example must validate before making any API call:

- API key is set and not a placeholder
- Sitekey is set and not a placeholder
- Page URL is set and not the default example value
- Exit immediately with a clear message on missing config

### Polling

- Wait 15-20 seconds before first poll
- Poll every 5 seconds (configurable via `POLL_INTERVAL`)
- Handle `CAPCHA_NOT_READY` as normal in-progress
- Implement a maximum timeout (default: 120 seconds, configurable via `MAX_TIMEOUT`)
- Log each poll attempt with attempt number

### Error handling

Handle **all** documented error categories:

| Category | Errors | Handling |
|----------|--------|----------|
| Auth | `ERROR_WRONG_USER_KEY`, `ERROR_KEY_DOES_NOT_EXIST`, `IP_BANNED` | Exit with clear message about API key |
| Balance | `ERROR_ZERO_BALANCE` | Exit with message to top up account |
| Input | `ERROR_PAGEURL`, `ERROR_WRONG_GOOGLEKEY`, `ERROR_BAD_PARAMETERS`, `ERROR_BAD_TOKEN_OR_PAGEURL` | Exit with parameter validation message |
| Transient | `ERROR_SERVER_ERROR`, `ERROR_INTERNAL_SERVER_ERROR` | Retry with exponential backoff (cap at 30s) |
| Solve | `ERROR_CAPTCHA_UNSOLVABLE` | Exit with message to verify parameters |
| Proxy | `ERROR_BAD_PROXY`, `ERROR_PROXY_CONNECTION_FAILED` | Exit with message to check proxy config |

### Token injection guidance

The final output message must reference the **correct** response field for the CAPTCHA type:

| CAPTCHA Type | Response field |
|-------------|---------------|
| reCAPTCHA v2/v3 | `g-recaptcha-response` |
| Cloudflare Turnstile | `cf-turnstile-response` |
| GeeTest | Custom callback |
| hCaptcha | `h-captcha-response` |
| Image CAPTCHA | Direct text value |

**Never** use `g-recaptcha-response` for non-reCAPTCHA types. This is a hard rule.

### Output format

All languages must produce identical output format:

```
[*] Submitting {CAPTCHA_TYPE} task...
[+] Task submitted. ID: {id}
[*] Waiting 15s before first poll...
[*] Polling for result (attempt {n})...
[*] Not ready yet, waiting {n}s...
[+] Solved! Token: {first_50_chars}...
[+] Full token length: {n} characters

Next step: inject this token into the target page's
{correct_response_field} hidden field and submit the form.
```

### Expected output

Include a section in the README showing what a successful run looks like.

### Code style

- Python: PEP 8
- Node.js: StandardJS or Prettier defaults
- PHP: PSR-12
- Go: gofmt
- Java: Google Java Style
- C#: .NET conventions
- Ruby: Standard Ruby style
- Rust: rustfmt
- Kotlin: Kotlin Coding Conventions
- Bash: ShellCheck-clean

## README template

Every example README must include:

1. Title (matches the article)
2. Description (includes CAPTCHA type)
3. Languages list
4. Link to the blog article
5. Prerequisites (with version requirements)
6. Setup instructions (clone → install → configure → run) for **every** language
7. Environment variables table with descriptions
8. How it works (4-step flow)
9. Expected output (full console output)
10. Common errors table (error → cause → fix)
11. Troubleshooting (at least 3 scenarios)
12. API docs link
13. Related examples

## Linking

- Example README links to: blog article, API docs, related examples
- Blog article links to: example repo path using a **clickable anchor**, not a raw URL

Correct article CTA format:

```md
## Full runnable example

Need a complete working project with environment setup, polling, retries, and error handling?

[See the full runnable example on GitHub →](https://github.com/CaptchaAI/CaptchaAI-Examples/tree/main/articles/{slug})
```

## Quality checklist — Code

Before submitting, **every language** in the example pack must pass:

### Correctness
- [ ] Code uses real CaptchaAI API endpoints (`in.php` submit, `res.php` poll)
- [ ] API method parameter matches the CAPTCHA type (e.g. `turnstile` not `userrecaptcha` for Turnstile)
- [ ] Token injection message references the correct response field for the CAPTCHA type
- [ ] Field names in code match the API documentation exactly
- [ ] `.env.example` lists all required variables with descriptive comments

### Consistency across languages
- [ ] All languages use the same `.env` variable names
- [ ] All languages use the same poll interval default (5s)
- [ ] All languages use the same max timeout default (120s)
- [ ] All languages use the same initial wait (15s)
- [ ] All languages produce the same output format
- [ ] All languages handle the same error categories
- [ ] All languages validate config before making API calls

### Error handling
- [ ] Auth errors → clear message about API key
- [ ] Balance errors → message to top up
- [ ] Input errors → parameter validation message
- [ ] Transient errors → retry with exponential backoff (cap at 30s)
- [ ] Solve errors → exit with verify message
- [ ] Proxy errors → exit with proxy check message
- [ ] Network errors → caught and reported (not unhandled crashes)
- [ ] Missing config → clear message before any API call

### Security
- [ ] No real API keys, tokens, or secrets in code
- [ ] No hardcoded credentials
- [ ] `.gitignore` excludes `.env` and all build artifacts
- [ ] HTTP timeouts set on all requests (30s)
- [ ] No eval() or equivalent dynamic code execution

### Quality
- [ ] Code follows the language's standard style guide
- [ ] Setup instructions work from clone to first run
- [ ] README links back to the blog article
- [ ] Expected output in README matches actual output format
- [ ] Dependencies are minimal (prefer stdlib where possible)

## Quality checklist — README

- [ ] Title matches the blog article title
- [ ] Description mentions the specific CAPTCHA type
- [ ] All supported languages are listed
- [ ] Prerequisites include version requirements
- [ ] Setup instructions cover every language
- [ ] Environment variables table is complete
- [ ] How it works matches the actual code flow
- [ ] Expected output matches what the code actually prints
- [ ] Common errors table covers all 6 error categories
- [ ] Troubleshooting covers at least 3 failure scenarios
- [ ] No references to wrong CAPTCHA types (e.g. reCAPTCHA wording in a Turnstile example)

## Scaffolding

New example packs are scaffolded using the tool in the `cai_content` repository:

```bash
python scripts/scaffold_example_pack.py articles/{slug}.md --examples-repo ../CaptchaAI-Examples
```

This generates the directory structure, README template, `.env.example`, and starter code files for all 10 languages.
