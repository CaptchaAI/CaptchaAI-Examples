# CaptchaAI Examples

Public code examples for the [CaptchaAI](https://captchaai.com) CAPTCHA solving API.

This repository is published for clients who want a runnable starting point fast. Each pack includes setup instructions, shows the current support level honestly, and links back to the companion blog article once that article is live or scheduled for imminent publication.

For maintainers, start with `ONBOARDING.md` before changing repo-level messaging or pack contracts.

## Quick start

1. Get your API key from [captchaai.com](https://captchaai.com)
2. Clone this repository:
   ```bash
   git clone https://github.com/CaptchaAI/CaptchaAI-Examples.git
   cd CaptchaAI-Examples
   ```
3. Pick an example from the `articles/` directory
4. Follow the README inside that example folder

## What this repo is for

- Client-facing example packs that help readers move from article to working code.
- Public companion to the CaptchaAI blog at `blog.captchaai.com`.
- A practical reference library, not a public window into CaptchaAI's internal content factory.
- Published example packs only. Internal templates, tools, scaffolding, repair tooling, and validation automation are intentionally kept in the private factory repo.

The public repo contract is the pack directory plus the pack README, not the private workflow that produced it.

## Support levels

Each example pack is labeled with the level we can honestly stand behind today:

| Tier | Badge | What it means |
|------|-------|---------------|
| Verified | 🟢 | The pack's reference flow has been reviewed closely and checked against the current CaptchaAI flow and repo validation. This is our highest-confidence level, but not every included language always receives identical review depth. |
| Standard | 🟡 | The pack is public, documented, and structurally checked. At least one implementation has been reviewed, while other included implementations may still be receiving lighter validation or iterative improvement. |
| Available | ⚪ | The pack is published for client reference with lighter review depth. It is available because it is useful, not because we claim perfect parity across every implementation. |

## Language coverage

Many packs currently include Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, and Bash.

That is a current coverage choice, not a permanent promise for every pack. The pack README and support tier are the source of truth for what level of confidence you should expect right now.

## Repository structure

```
CaptchaAI-Examples/
  articles/                     # Full example packs, one per article
    {slug}/
      README.md                 # Setup, usage, expected output, troubleshooting
      .env.example              # Required environment variables
      .gitignore                # Excludes .env and build artifacts
      {language}/               # One or more supported implementations for that pack
```

Internal factory scripts, tools, and templates are intentionally not part of this public repository.

## Examples

<!-- BEGIN GENERATED INDEX -->
| Example | CAPTCHA Type | Tier | Languages | Article |
|---------|-------------|------|-----------|---------|
| [abstract-captcha-solver-provider-agnostic](articles/abstract-captcha-solver-provider-agnostic/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/abstract-captcha-solver-provider-agnostic) |
| [academic-research-scraping-captcha-solving](articles/academic-research-scraping-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/academic-research-scraping-captcha-solving) |
| [ad-verification-captcha-handling](articles/ad-verification-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/ad-verification-captcha-handling) |
| [aiohttp-captchaai-async](articles/aiohttp-captchaai-async/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/aiohttp-captchaai-async) |
| [airline-fare-monitoring-captcha-handling](articles/airline-fare-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/airline-fare-monitoring-captcha-handling) |
| [airtable-captchaai-database-captcha](articles/airtable-captchaai-database-captcha/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/airtable-captchaai-database-captcha) |
| [android-espresso-captcha-testing](articles/android-espresso-captcha-testing/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/android-espresso-captcha-testing) |
| [ansible-captchaai-worker-deployment](articles/ansible-captchaai-worker-deployment/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/ansible-captchaai-worker-deployment) |
| [apify-captchaai-cloud-scraping-integration](articles/apify-captchaai-cloud-scraping-integration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/apify-captchaai-cloud-scraping-integration) |
| [app-store-review-monitoring-captcha-handling](articles/app-store-review-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [arabic-rtl-captcha-handling](articles/arabic-rtl-captcha-handling/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/arabic-rtl-captcha-handling) |
| [async-captcha-solving-python-asyncio](articles/async-captcha-solving-python-asyncio/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/async-captcha-solving-python-asyncio) |
| [auction-site-monitoring-captcha-handling](articles/auction-site-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/auction-site-monitoring-captcha-handling) |
| [auto-scaling-captcha-solving-workers](articles/auto-scaling-captcha-solving-workers/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/auto-scaling-captcha-solving-workers) |
| [automated-form-submission-captcha-handling](articles/automated-form-submission-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/automated-form-submission-captcha-handling) |
| [automated-login-captcha-handling](articles/automated-login-captcha-handling/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/automated-login-captcha-handling) |
| [automation-bot-captcha-handling](articles/automation-bot-captcha-handling/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/automation-bot-captcha-handling) |
| [aws-lambda-captchaai-serverless-captcha](articles/aws-lambda-captchaai-serverless-captcha/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/aws-lambda-captchaai-serverless-captcha) |
| [aws-sns-captchaai-event-driven-captcha](articles/aws-sns-captchaai-event-driven-captcha/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/aws-sns-captchaai-event-driven-captcha) |
| [axios-captchaai-no-browser](articles/axios-captchaai-no-browser/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/axios-captchaai-no-browser) |
| [azure-functions-captchaai-cloud-integration](articles/azure-functions-captchaai-cloud-integration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/azure-functions-captchaai-cloud-integration) |
| [backlink-discovery-tool-captcha-handling](articles/backlink-discovery-tool-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [backpressure-handling-captcha-solving-queues](articles/backpressure-handling-captcha-solving-queues/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/backpressure-handling-captcha-solving-queues) |
| [bash-curl-captchaai-shell-automation](articles/bash-curl-captchaai-shell-automation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bash-curl-captchaai-shell-automation) |
| [batch-captcha-cost-estimation-budget-alerts](articles/batch-captcha-cost-estimation-budget-alerts/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/batch-captcha-cost-estimation-budget-alerts) |
| [batch-captcha-solving-multiple-tasks](articles/batch-captcha-solving-multiple-tasks/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/batch-captcha-solving-multiple-tasks) |
| [batch-image-captcha-solving-1000-images](articles/batch-image-captcha-solving-1000-images/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/batch-image-captcha-solving-1000-images) |
| [batch-recaptcha-solving-form-pipelines](articles/batch-recaptcha-solving-form-pipelines/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/batch-recaptcha-solving-form-pipelines) |
| [bls-captcha-government-portals-handling](articles/bls-captcha-government-portals-handling/) | BLS CAPTCHA | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bls-captcha-government-portals-handling) |
| [bls-captcha-image-order-grid-response-handling](articles/bls-captcha-image-order-grid-response-handling/) | BLS CAPTCHA | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bls-captcha-image-order-grid-response-handling) |
| [bls-captcha-instructions-code-parameter-deep-dive](articles/bls-captcha-instructions-code-parameter-deep-dive/) | BLS CAPTCHA | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bls-captcha-instructions-code-parameter-deep-dive) |
| [bls-captcha-instructions-code-solving](articles/bls-captcha-instructions-code-solving/) | BLS CAPTCHA | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bls-captcha-instructions-code-solving) |
| [blue-green-deployment-captcha-solving](articles/blue-green-deployment-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/blue-green-deployment-captcha-solving) |
| [brand-mention-monitoring-captcha-handling](articles/brand-mention-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [bright-data-captchaai-proxy-integration](articles/bright-data-captchaai-proxy-integration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bright-data-captchaai-proxy-integration) |
| [browser-console-captcha-detection-sitekeys-parameters](articles/browser-console-captcha-detection-sitekeys-parameters/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/browser-console-captcha-detection-sitekeys-parameters) |
| [build-automated-testing-pipeline-captchaai](articles/build-automated-testing-pipeline-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-automated-testing-pipeline-captchaai) |
| [build-competitor-analysis-dashboard-captchaai](articles/build-competitor-analysis-dashboard-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-competitor-analysis-dashboard-captchaai) |
| [build-content-change-monitoring-bot-captchaai](articles/build-content-change-monitoring-bot-captchaai/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-content-change-monitoring-bot-captchaai) |
| [build-job-listing-aggregator-captchaai](articles/build-job-listing-aggregator-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-job-listing-aggregator-captchaai) |
| [build-lead-generation-pipeline-captchaai](articles/build-lead-generation-pipeline-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-lead-generation-pipeline-captchaai) |
| [build-multi-site-data-aggregation-captchaai](articles/build-multi-site-data-aggregation-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-multi-site-data-aggregation-captchaai) |
| [build-price-comparison-bot-python-captchaai](articles/build-price-comparison-bot-python-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-price-comparison-bot-python-captchaai) |
| [build-review-monitoring-system-captchaai](articles/build-review-monitoring-system-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/build-review-monitoring-system-captchaai) |
| [building-captcha-solving-queue-nodejs](articles/building-captcha-solving-queue-nodejs/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-captcha-solving-queue-nodejs) |
| [building-captcha-solving-queue-python](articles/building-captcha-solving-queue-python/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-captcha-solving-queue-python) |
| [building-captchaai-usage-dashboard-monitoring](articles/building-captchaai-usage-dashboard-monitoring/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-captchaai-usage-dashboard-monitoring) |
| [building-client-captcha-pipelines-captchaai](articles/building-client-captcha-pipelines-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-client-captcha-pipelines-captchaai) |
| [building-custom-scraping-framework-captchaai](articles/building-custom-scraping-framework-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-custom-scraping-framework-captchaai) |
| [building-go-client-captchaai-api](articles/building-go-client-captchaai-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-go-client-captchaai-api) |
| [building-nodejs-sdk-captchaai-api](articles/building-nodejs-sdk-captchaai-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-nodejs-sdk-captchaai-api) |
| [building-php-composer-package-captchaai](articles/building-php-composer-package-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/building-php-composer-package-captchaai) |
| [bulkhead-pattern-captcha-solving-isolation](articles/bulkhead-pattern-captcha-solving-isolation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/bulkhead-pattern-captcha-solving-isolation) |
| [caching-captcha-tokens-reuse-guide](articles/caching-captcha-tokens-reuse-guide/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/caching-captcha-tokens-reuse-guide) |
| [captcha-automation-scripts](articles/captcha-automation-scripts/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-automation-scripts) |
| [captcha-chains-sequential-multi-step-forms](articles/captcha-chains-sequential-multi-step-forms/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-chains-sequential-multi-step-forms) |
| [captcha-detection-scraping-explained](articles/captcha-detection-scraping-explained/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-detection-scraping-explained) |
| [captcha-event-bus-nodejs-captchaai](articles/captcha-event-bus-nodejs-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-event-bus-nodejs-captchaai) |
| [captcha-handling-actix-rust-server](articles/captcha-handling-actix-rust-server/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-airflow-2-deferrable-operator](articles/captcha-handling-airflow-2-deferrable-operator/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-appwrite-functions](articles/captcha-handling-appwrite-functions/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-astro-server-islands](articles/captcha-handling-astro-server-islands/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-auth-js-credentials-provider](articles/captcha-handling-auth-js-credentials-provider/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-auth0-actions](articles/captcha-handling-auth0-actions/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-aws-stepfunctions-express](articles/captcha-handling-aws-stepfunctions-express/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-axum-rust-server](articles/captcha-handling-axum-rust-server/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-azure-durable-functions](articles/captcha-handling-azure-durable-functions/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-better-auth](articles/captcha-handling-better-auth/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-bubble-app-workflow](articles/captcha-handling-bubble-app-workflow/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-budibase-workflow](articles/captcha-handling-budibase-workflow/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-bullmq-nodejs-queue](articles/captcha-handling-bullmq-nodejs-queue/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-bun-runtime-fast-solver-client](articles/captcha-handling-bun-runtime-fast-solver-client/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-bunny-edge-scripting](articles/captcha-handling-bunny-edge-scripting/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-celery-redis-broker](articles/captcha-handling-celery-redis-broker/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-clerk-server-action](articles/captcha-handling-clerk-server-action/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-cloudflare-durable-objects](articles/captcha-handling-cloudflare-durable-objects/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-cloudflare-queues](articles/captcha-handling-cloudflare-queues/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-continuous-integration-testing](articles/captcha-handling-continuous-integration-testing/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-continuous-integration-testing) |
| [captcha-handling-crystal-language](articles/captcha-handling-crystal-language/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-dagster-asset](articles/captcha-handling-dagster-asset/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-defer-run-jobs](articles/captcha-handling-defer-run-jobs/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-deno-deploy](articles/captcha-handling-deno-deploy/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-deno-runtime-import-maps](articles/captcha-handling-deno-runtime-import-maps/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-django-captchaai](articles/captcha-handling-django-captchaai/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-django-captchaai) |
| [captcha-handling-edge-runtime-vercel](articles/captcha-handling-edge-runtime-vercel/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-effect-ts-pipeline](articles/captcha-handling-effect-ts-pipeline/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-elixir-broadway-pipelines](articles/captcha-handling-elixir-broadway-pipelines/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-elixir-phoenix](articles/captcha-handling-elixir-phoenix/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-elysia-bun-server](articles/captcha-handling-elysia-bun-server/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-encore-go-microservice](articles/captcha-handling-encore-go-microservice/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-encore-ts-resource](articles/captcha-handling-encore-ts-resource/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-fastapi-htmx](articles/captcha-handling-fastapi-htmx/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-fastly-compute-edge](articles/captcha-handling-fastly-compute-edge/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-fiber-go-server](articles/captcha-handling-fiber-go-server/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-firebase-auth-recaptcha](articles/captcha-handling-firebase-auth-recaptcha/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-flask-captchaai](articles/captcha-handling-flask-captchaai/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-flask-captchaai) |
| [captcha-handling-flink-streaming-job](articles/captcha-handling-flink-streaming-job/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-flutterflow-cloud-function](articles/captcha-handling-flutterflow-cloud-function/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-fly-machines-on-demand](articles/captcha-handling-fly-machines-on-demand/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-for-llm-training-data-scraping](articles/captcha-handling-for-llm-training-data-scraping/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-for-perplexity-style-search-agents](articles/captcha-handling-for-perplexity-style-search-agents/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-for-rag-pipeline-data-collection](articles/captcha-handling-for-rag-pipeline-data-collection/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-gcp-workflows](articles/captcha-handling-gcp-workflows/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-gleam-language](articles/captcha-handling-gleam-language/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-glide-apps-action](articles/captcha-handling-glide-apps-action/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-graphile-worker-postgres](articles/captcha-handling-graphile-worker-postgres/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-hono-edge-worker](articles/captcha-handling-hono-edge-worker/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-inngest-functions](articles/captcha-handling-inngest-functions/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-internal-tool-bun-bunny](articles/captcha-handling-internal-tool-bun-bunny/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-julia-http-client](articles/captcha-handling-julia-http-client/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-keycloak-recaptcha-flow](articles/captcha-handling-keycloak-recaptcha-flow/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-koyeb-edge-workers](articles/captcha-handling-koyeb-edge-workers/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-langgraph-node](articles/captcha-handling-langgraph-node/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-llamaindex-tool](articles/captcha-handling-llamaindex-tool/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-mage-ai-pipeline](articles/captcha-handling-mage-ai-pipeline/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-mcp-server-pattern](articles/captcha-handling-mcp-server-pattern/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-micronaut-app](articles/captcha-handling-micronaut-app/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-mobile-appium](articles/captcha-handling-mobile-appium/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-mobile-appium) |
| [captcha-handling-mojo-language-future](articles/captcha-handling-mojo-language-future/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-nextjs-app-router-server-actions](articles/captcha-handling-nextjs-app-router-server-actions/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-nim-language](articles/captcha-handling-nim-language/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-nuxt3-server-routes](articles/captcha-handling-nuxt3-server-routes/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-ocaml-http-client](articles/captcha-handling-ocaml-http-client/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-pgmq-postgres-queue](articles/captcha-handling-pgmq-postgres-queue/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-pocketbase-hooks](articles/captcha-handling-pocketbase-hooks/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-prefect-flow](articles/captcha-handling-prefect-flow/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-quarkus-microservice](articles/captcha-handling-quarkus-microservice/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-railway-cron-workers](articles/captcha-handling-railway-cron-workers/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-ray-task-distributed](articles/captcha-handling-ray-task-distributed/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-registration-flow-testing](articles/captcha-handling-registration-flow-testing/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-registration-flow-testing) |
| [captcha-handling-remix-action-functions](articles/captcha-handling-remix-action-functions/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-render-background-workers](articles/captcha-handling-render-background-workers/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-restate-workflow](articles/captcha-handling-restate-workflow/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-retool-workflow-2026](articles/captcha-handling-retool-workflow-2026/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-river-go-queue](articles/captcha-handling-river-go-queue/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-sidekiq-ruby-queue](articles/captcha-handling-sidekiq-ruby-queue/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-sneaker-bot-automation](articles/captcha-handling-sneaker-bot-automation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-handling-sneaker-bot-automation) |
| [captcha-handling-softr-noco](articles/captcha-handling-softr-noco/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-spark-structured-streaming](articles/captcha-handling-spark-structured-streaming/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-spring-boot-3](articles/captcha-handling-spring-boot-3/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-supabase-edge-functions](articles/captcha-handling-supabase-edge-functions/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-supabase-rls-protected-pages](articles/captcha-handling-supabase-rls-protected-pages/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-svelte-kit-form-actions](articles/captcha-handling-svelte-kit-form-actions/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-tanstack-start-server-functions](articles/captcha-handling-tanstack-start-server-functions/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-temporal-workflow-activity](articles/captcha-handling-temporal-workflow-activity/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-tooljet-workflow](articles/captcha-handling-tooljet-workflow/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-trigger-dev-jobs](articles/captcha-handling-trigger-dev-jobs/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-vercel-ai-sdk-tools](articles/captcha-handling-vercel-ai-sdk-tools/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-vlang-v-language](articles/captcha-handling-vlang-v-language/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-webflow-logic-flows](articles/captcha-handling-webflow-logic-flows/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-windmill-workflow](articles/captcha-handling-windmill-workflow/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-handling-zig-language](articles/captcha-handling-zig-language/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-image-preprocessing-better-solve-rates](articles/captcha-image-preprocessing-better-solve-rates/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-image-preprocessing-better-solve-rates) |
| [captcha-popup-modal-detection-injection](articles/captcha-popup-modal-detection-injection/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-popup-modal-detection-injection) |
| [captcha-retry-queue-exponential-backoff](articles/captcha-retry-queue-exponential-backoff/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-retry-queue-exponential-backoff) |
| [captcha-scraping-nodejs-tutorial](articles/captcha-scraping-nodejs-tutorial/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-scraping-nodejs-tutorial) |
| [captcha-scraping-python-guide](articles/captcha-scraping-python-guide/) | reCAPTCHA v3 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-scraping-python-guide) |
| [captcha-session-state-distributed-workers](articles/captcha-session-state-distributed-workers/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-session-state-distributed-workers) |
| [captcha-solve-rate-residential-vs-isp-vs-mobile-2026](articles/captcha-solve-rate-residential-vs-isp-vs-mobile-2026/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captcha-solving-10000-tasks-per-hour](articles/captcha-solving-10000-tasks-per-hour/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-10000-tasks-per-hour) |
| [captcha-solving-api-endpoint-testing-web-forms](articles/captcha-solving-api-endpoint-testing-web-forms/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-api-endpoint-testing-web-forms) |
| [captcha-solving-audit-logs-compliance](articles/captcha-solving-audit-logs-compliance/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-audit-logs-compliance) |
| [captcha-solving-csharp](articles/captcha-solving-csharp/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-csharp) |
| [captcha-solving-fallback-chains](articles/captcha-solving-fallback-chains/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-fallback-chains) |
| [captcha-solving-go](articles/captcha-solving-go/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-go) |
| [captcha-solving-java](articles/captcha-solving-java/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-java) |
| [captcha-solving-php](articles/captcha-solving-php/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-php) |
| [captcha-solving-qa-authorized-testing](articles/captcha-solving-qa-authorized-testing/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-qa-authorized-testing) |
| [captcha-solving-ticket-purchase-automation](articles/captcha-solving-ticket-purchase-automation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captcha-solving-ticket-purchase-automation) |
| [captchaai-alerts-pagerduty-integration](articles/captchaai-alerts-pagerduty-integration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-alerts-pagerduty-integration) |
| [captchaai-api-key-rotation](articles/captchaai-api-key-rotation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-api-key-rotation) |
| [captchaai-api-latency-optimization](articles/captchaai-api-latency-optimization/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-api-latency-optimization) |
| [captchaai-balance-check-auto-refill](articles/captchaai-balance-check-auto-refill/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-balance-check-auto-refill) |
| [captchaai-callback-error-handling-patterns](articles/captchaai-callback-error-handling-patterns/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-callback-error-handling-patterns) |
| [captchaai-callback-url-webhook-guide](articles/captchaai-callback-url-webhook-guide/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-callback-url-webhook-guide) |
| [captchaai-chrome-extension-complete-guide](articles/captchaai-chrome-extension-complete-guide/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-cli-tool-vs-chrome-extension](articles/captchaai-cli-tool-vs-chrome-extension/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-debug-logger-development](articles/captchaai-debug-logger-development/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-debug-logger-development) |
| [captchaai-extension-2fa-flow-with-captcha](articles/captchaai-extension-2fa-flow-with-captcha/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-and-mfa-vendor-flows](articles/captchaai-extension-and-mfa-vendor-flows/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-android-emulator-bluestacks](articles/captchaai-extension-android-emulator-bluestacks/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-api-key-validation-troubleshooting](articles/captchaai-extension-api-key-validation-troubleshooting/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-architecture-how-it-detects-captchas](articles/captchaai-extension-architecture-how-it-detects-captchas/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-as-fallback-when-api-degrades](articles/captchaai-extension-as-fallback-when-api-degrades/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-auto-evaluate-math-captcha](articles/captchaai-extension-auto-evaluate-math-captcha/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-auto-solve-toggles-recommended-setup](articles/captchaai-extension-auto-solve-toggles-recommended-setup/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-blacklist-skip-sites](articles/captchaai-extension-blacklist-skip-sites/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-bls-auto-open-auto-submit](articles/captchaai-extension-bls-auto-open-auto-submit/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-brave-arc-vivaldi-compatibility](articles/captchaai-extension-brave-arc-vivaldi-compatibility/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-cli-companion-future](articles/captchaai-extension-cli-companion-future/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-content-script-injection-explained](articles/captchaai-extension-content-script-injection-explained/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-context-table-image-captcha-mapping](articles/captchaai-extension-context-table-image-captcha-mapping/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-debug-logger-export-support](articles/captchaai-extension-debug-logger-export-support/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-discord-100-free-threads-promo](articles/captchaai-extension-discord-100-free-threads-promo/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-edge-browser-installation](articles/captchaai-extension-edge-browser-installation/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-emulator-debugging-pages](articles/captchaai-extension-emulator-debugging-pages/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-enterprise-rollout-strategy](articles/captchaai-extension-enterprise-rollout-strategy/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-feature-flags-team-rollout](articles/captchaai-extension-feature-flags-team-rollout/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-firefox-alternative-workflow](articles/captchaai-extension-firefox-alternative-workflow/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-for-bls-government-portal-staff](articles/captchaai-extension-for-bls-government-portal-staff/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-for-customer-support-teams](articles/captchaai-extension-for-customer-support-teams/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-for-form-testing-uat](articles/captchaai-extension-for-form-testing-uat/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-for-government-bls-bookings](articles/captchaai-extension-for-government-bls-bookings/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-for-qa-engineers](articles/captchaai-extension-for-qa-engineers/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-for-recruitment-agency-research](articles/captchaai-extension-for-recruitment-agency-research/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-for-seo-link-building-workflows](articles/captchaai-extension-for-seo-link-building-workflows/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-free-trial-threads-guide](articles/captchaai-extension-free-trial-threads-guide/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-geetest-v3-settings-guide](articles/captchaai-extension-geetest-v3-settings-guide/) | GeeTest v3 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-headless-chrome-compatibility](articles/captchaai-extension-headless-chrome-compatibility/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-image-captcha-context-table-real-examples](articles/captchaai-extension-image-captcha-context-table-real-examples/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-install-setup-5-minutes](articles/captchaai-extension-install-setup-5-minutes/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-keyboard-shortcuts-power-users](articles/captchaai-extension-keyboard-shortcuts-power-users/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-load-via-cdp](articles/captchaai-extension-load-via-cdp/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-multi-language-prompts](articles/captchaai-extension-multi-language-prompts/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-multiple-chrome-profiles](articles/captchaai-extension-multiple-chrome-profiles/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-mv3-manifest-v3-explained](articles/captchaai-extension-mv3-manifest-v3-explained/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-no-thread-available-fix](articles/captchaai-extension-no-thread-available-fix/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-not-solving-checklist](articles/captchaai-extension-not-solving-checklist/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-permissions-explained-host-storage](articles/captchaai-extension-permissions-explained-host-storage/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-pin-multiple-tabs-parallel-solving](articles/captchaai-extension-pin-multiple-tabs-parallel-solving/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-pin-toolbar-faster-access](articles/captchaai-extension-pin-toolbar-faster-access/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-plan-threads-explained](articles/captchaai-extension-plan-threads-explained/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-privacy-data-handling](articles/captchaai-extension-privacy-data-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-proxy-settings-walkthrough](articles/captchaai-extension-proxy-settings-walkthrough/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-publish-real-world-case-study](articles/captchaai-extension-publish-real-world-case-study/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-rate-limited-by-target-site](articles/captchaai-extension-rate-limited-by-target-site/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-recaptcha-v3-min-score-configuration](articles/captchaai-extension-recaptcha-v3-min-score-configuration/) | reCAPTCHA v3 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-screencast-walkthrough-guide](articles/captchaai-extension-screencast-walkthrough-guide/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-source-of-truth-shared-config](articles/captchaai-extension-source-of-truth-shared-config/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-ssh-jumphost-bastion-flows](articles/captchaai-extension-ssh-jumphost-bastion-flows/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-team-shared-api-key-best-practices](articles/captchaai-extension-team-shared-api-key-best-practices/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-troubleshoot-bls-no-result](articles/captchaai-extension-troubleshoot-bls-no-result/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-troubleshoot-recaptcha-grid](articles/captchaai-extension-troubleshoot-recaptcha-grid/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-troubleshoot-turnstile-token-not-injected](articles/captchaai-extension-troubleshoot-turnstile-token-not-injected/) | Cloudflare Turnstile | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-version-pinning-team-stability](articles/captchaai-extension-version-pinning-team-stability/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-2captcha-solver-extension](articles/captchaai-extension-vs-2captcha-solver-extension/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-anticaptcha-plugin](articles/captchaai-extension-vs-anticaptcha-plugin/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-api-when-to-use-each](articles/captchaai-extension-vs-api-when-to-use-each/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-buster-feature-by-feature](articles/captchaai-extension-vs-buster-feature-by-feature/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-capmonster-extension](articles/captchaai-extension-vs-capmonster-extension/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-capsolver-extension](articles/captchaai-extension-vs-capsolver-extension/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-cloud-api-decision-tree](articles/captchaai-extension-vs-cloud-api-decision-tree/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-cloud-emulator-vs-api-decision-2026](articles/captchaai-extension-vs-cloud-emulator-vs-api-decision-2026/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-emulator-vs-api](articles/captchaai-extension-vs-emulator-vs-api/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-headless-api-cost-model](articles/captchaai-extension-vs-headless-api-cost-model/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-vs-nopecha-extension](articles/captchaai-extension-vs-nopecha-extension/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-with-1password-bitwarden-flows](articles/captchaai-extension-with-1password-bitwarden-flows/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-with-citrix-vdi-flows](articles/captchaai-extension-with-citrix-vdi-flows/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-with-mobile-proxies-success-rate](articles/captchaai-extension-with-mobile-proxies-success-rate/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-with-playwright-persistent-context](articles/captchaai-extension-with-playwright-persistent-context/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-with-puppeteer-stealth](articles/captchaai-extension-with-puppeteer-stealth/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-with-residential-proxies-best-practices](articles/captchaai-extension-with-residential-proxies-best-practices/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-extension-with-selenium-undetected-chromedriver](articles/captchaai-extension-with-selenium-undetected-chromedriver/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-health-check-monitoring-script](articles/captchaai-health-check-monitoring-script/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-health-check-monitoring-script) |
| [captchaai-ip-whitelisting-api-key-security](articles/captchaai-ip-whitelisting-api-key-security/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-ip-whitelisting-api-key-security) |
| [captchaai-load-balancer-architecture](articles/captchaai-load-balancer-architecture/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-load-balancer-architecture) |
| [captchaai-mcp-server-claude-desktop](articles/captchaai-mcp-server-claude-desktop/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-mcp-server-cursor-windsurf](articles/captchaai-mcp-server-cursor-windsurf/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-monitoring-datadog-metrics-alerts](articles/captchaai-monitoring-datadog-metrics-alerts/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-monitoring-datadog-metrics-alerts) |
| [captchaai-monitoring-new-relic-apm](articles/captchaai-monitoring-new-relic-apm/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-monitoring-new-relic-apm) |
| [captchaai-pingback-task-notification-patterns](articles/captchaai-pingback-task-notification-patterns/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-pingback-task-notification-patterns) |
| [captchaai-python-pydantic-validation](articles/captchaai-python-pydantic-validation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-python-pydantic-validation) |
| [captchaai-quickstart](articles/captchaai-quickstart/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-quickstart) |
| [captchaai-scraping-stack-100-budget](articles/captchaai-scraping-stack-100-budget/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-scraping-stack-100-budget) |
| [captchaai-soft-id-referral-tracking](articles/captchaai-soft-id-referral-tracking/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-soft-id-referral-tracking) |
| [captchaai-vs-low-code-zapier-extension-2026](articles/captchaai-vs-low-code-zapier-extension-2026/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [captchaai-webhook-security-callback-validation](articles/captchaai-webhook-security-callback-validation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/captchaai-webhook-security-callback-validation) |
| [case-sensitive-captcha-api-parameter-guide](articles/case-sensitive-captcha-api-parameter-guide/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/case-sensitive-captcha-api-parameter-guide) |
| [cdn-pricing-monitoring-captcha-handling](articles/cdn-pricing-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [chaos-engineering-captcha-solving-pipelines](articles/chaos-engineering-captcha-solving-pipelines/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/chaos-engineering-captcha-solving-pipelines) |
| [chrome-devtools-network-captcha-debugging](articles/chrome-devtools-network-captcha-debugging/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/chrome-devtools-network-captcha-debugging) |
| [chrome-extension-captcha-solver-buyer-guide-2026](articles/chrome-extension-captcha-solver-buyer-guide-2026/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [circuit-breaker-pattern-captcha-api-calls](articles/circuit-breaker-pattern-captcha-api-calls/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/circuit-breaker-pattern-captcha-api-calls) |
| [cloud-hosting-pricing-monitoring-captcha-handling](articles/cloud-hosting-pricing-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [cloudflare-challenge-page-parameters-token-flow](articles/cloudflare-challenge-page-parameters-token-flow/) | Cloudflare Challenge | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/cloudflare-challenge-page-parameters-token-flow) |
| [cloudflare-turnstile-sitekey-extraction](articles/cloudflare-turnstile-sitekey-extraction/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/cloudflare-turnstile-sitekey-extraction) |
| [colly-captchaai-go-scraping-captcha-solving](articles/colly-captchaai-go-scraping-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/colly-captchaai-go-scraping-captcha-solving) |
| [compensating-transactions-captcha-workflows](articles/compensating-transactions-captcha-workflows/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/compensating-transactions-captcha-workflows) |
| [connection-keepalive-http2-captcha-api](articles/connection-keepalive-http2-captcha-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/connection-keepalive-http2-captcha-api) |
| [connection-pool-sizing-captcha-api-clients](articles/connection-pool-sizing-captcha-api-clients/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/connection-pool-sizing-captcha-api-clients) |
| [corporate-registry-data-captcha-handling](articles/corporate-registry-data-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [court-records-portal-captcha-handling](articles/court-records-portal-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [crawlee-captchaai-modern-scraping-integration](articles/crawlee-captchaai-modern-scraping-integration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/crawlee-captchaai-modern-scraping-integration) |
| [crypto-exchange-public-data-captcha-handling](articles/crypto-exchange-public-data-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [csharp-task-whenall-captchaai-async](articles/csharp-task-whenall-captchaai-async/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/csharp-task-whenall-captchaai-async) |
| [csv-batch-captcha-solving-python](articles/csv-batch-captcha-solving-python/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/csv-batch-captcha-solving-python) |
| [curl-captchaai-cli](articles/curl-captchaai-cli/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/curl-captchaai-cli) |
| [custom-captcha-types-submit-unusual-challenges](articles/custom-captcha-types-submit-unusual-challenges/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/custom-captcha-types-submit-unusual-challenges) |
| [custom-timeout-settings-captcha-types](articles/custom-timeout-settings-captcha-types/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/custom-timeout-settings-captcha-types) |
| [cypress-captchaai-e2e-testing-captcha](articles/cypress-captchaai-e2e-testing-captcha/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/cypress-captchaai-e2e-testing-captcha) |
| [cyrillic-text-captcha-solving](articles/cyrillic-text-captcha-solving/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/cyrillic-text-captcha-solving) |
| [dead-letter-queue-failed-captcha-tasks](articles/dead-letter-queue-failed-captcha-tasks/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/dead-letter-queue-failed-captcha-tasks) |
| [debugging-captcha-api-charles-proxy](articles/debugging-captcha-api-charles-proxy/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/debugging-captcha-api-charles-proxy) |
| [deduplicating-captcha-solves-database-locking](articles/deduplicating-captcha-solves-database-locking/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/deduplicating-captcha-solves-database-locking) |
| [defi-yield-monitoring-captcha-handling](articles/defi-yield-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [dependency-injection-captcha-solving-services](articles/dependency-injection-captcha-solving-services/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/dependency-injection-captcha-solving-services) |
| [dex-aggregator-monitoring-captcha-handling](articles/dex-aggregator-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [disaster-recovery-captcha-solving-pipelines](articles/disaster-recovery-captcha-solving-pipelines/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/disaster-recovery-captcha-solving-pipelines) |
| [discord-webhook-captcha-pipeline-alerts](articles/discord-webhook-captcha-pipeline-alerts/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/discord-webhook-captcha-pipeline-alerts) |
| [docker-captchaai-containerized-captcha-solving](articles/docker-captchaai-containerized-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/docker-captchaai-containerized-captcha-solving) |
| [domain-marketplace-monitoring-captcha-handling](articles/domain-marketplace-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [domain-whois-lookup-captcha-handling](articles/domain-whois-lookup-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/domain-whois-lookup-captcha-handling) |
| [driver-license-portal-captcha-test-automation](articles/driver-license-portal-captcha-test-automation/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [dynamic-captcha-loading-lazy-loaded-detection](articles/dynamic-captcha-loading-lazy-loaded-detection/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/dynamic-captcha-loading-lazy-loaded-detection) |
| [dynamodb-serverless-captcha-solve-tracking](articles/dynamodb-serverless-captcha-solve-tracking/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/dynamodb-serverless-captcha-solve-tracking) |
| [ecommerce-price-monitoring](articles/ecommerce-price-monitoring/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/ecommerce-price-monitoring) |
| [elk-stack-captcha-solving-log-analysis](articles/elk-stack-captcha-solving-log-analysis/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/elk-stack-captcha-solving-log-analysis) |
| [encrypting-captcha-api-traffic-tls](articles/encrypting-captcha-api-traffic-tls/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/encrypting-captcha-api-traffic-tls) |
| [error-budget-tracking-captcha-reliability](articles/error-budget-tracking-captcha-reliability/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/error-budget-tracking-captcha-reliability) |
| [event-ticket-monitoring-captcha-handling](articles/event-ticket-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/event-ticket-monitoring-captcha-handling) |
| [expressjs-captchaai-server-side-captcha](articles/expressjs-captchaai-server-side-captcha/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/expressjs-captchaai-server-side-captcha) |
| [extracting-recaptcha-parameters-page-source](articles/extracting-recaptcha-parameters-page-source/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/extracting-recaptcha-parameters-page-source) |
| [factory-pattern-multi-type-captcha-solving](articles/factory-pattern-multi-type-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/factory-pattern-multi-type-captcha-solving) |
| [fastapi-captchaai-microservice](articles/fastapi-captchaai-microservice/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/fastapi-captchaai-microservice) |
| [fiddler-inspect-captchaai-api-traffic](articles/fiddler-inspect-captchaai-api-traffic/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/fiddler-inspect-captchaai-api-traffic) |
| [financial-data-scraping-captcha-handling](articles/financial-data-scraping-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/financial-data-scraping-captcha-handling) |
| [flight-status-monitoring-captcha-handling](articles/flight-status-monitoring-captcha-handling/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/flight-status-monitoring-captcha-handling) |
| [flutter-webview-captcha-handling](articles/flutter-webview-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/flutter-webview-captcha-handling) |
| [food-delivery-price-comparison-captcha-solving](articles/food-delivery-price-comparison-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/food-delivery-price-comparison-captcha-solving) |
| [gds-india-vfs-portal-captcha-handling](articles/gds-india-vfs-portal-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [geetest-slide-captcha-parameters-api-guide](articles/geetest-slide-captcha-parameters-api-guide/) | GeeTest v3 | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/geetest-slide-captcha-parameters-api-guide) |
| [geetest-token-injection-browser-automation](articles/geetest-token-injection-browser-automation/) | GeeTest v3 | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/geetest-token-injection-browser-automation) |
| [geetest-v3-slider-parameter-extraction](articles/geetest-v3-slider-parameter-extraction/) | GeeTest v3 | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/geetest-v3-slider-parameter-extraction) |
| [gis-mapping-data-captcha-extraction](articles/gis-mapping-data-captcha-extraction/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/gis-mapping-data-captcha-extraction) |
| [github-actions-captchaai-cicd-captcha-testing](articles/github-actions-captchaai-cicd-captcha-testing/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/github-actions-captchaai-cicd-captcha-testing) |
| [go-goroutines-captchaai-high-throughput](articles/go-goroutines-captchaai-high-throughput/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/go-goroutines-captchaai-high-throughput) |
| [google-apps-script-captchaai-captcha](articles/google-apps-script-captchaai-captcha/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/google-apps-script-captchaai-captcha) |
| [google-cloud-functions-captchaai-integration](articles/google-cloud-functions-captchaai-integration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/google-cloud-functions-captchaai-integration) |
| [government-portal-automation-captcha-solving](articles/government-portal-automation-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/government-portal-automation-captcha-solving) |
| [graceful-degradation-captcha-solving-fails](articles/graceful-degradation-captcha-solving-fails/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/graceful-degradation-captcha-solving-fails) |
| [grafana-dashboard-templates-captchaai](articles/grafana-dashboard-templates-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/grafana-dashboard-templates-captchaai) |
| [grid-image-coordinate-mapping](articles/grid-image-coordinate-mapping/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/grid-image-coordinate-mapping) |
| [handle-captcha-in-web-scraping-workflows](articles/handle-captcha-in-web-scraping-workflows/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/handle-captcha-in-web-scraping-workflows) |
| [handling-multiple-captchas-single-page](articles/handling-multiple-captchas-single-page/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/handling-multiple-captchas-single-page) |
| [headers-cookies-tls-fingerprint-captcha-rate](articles/headers-cookies-tls-fingerprint-captcha-rate/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [headless-browser-captcha-issues](articles/headless-browser-captcha-issues/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/headless-browser-captcha-issues) |
| [health-check-endpoints-captcha-workers](articles/health-check-endpoints-captcha-workers/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/health-check-endpoints-captcha-workers) |
| [healthcare-data-collection-captcha-handling](articles/healthcare-data-collection-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/healthcare-data-collection-captcha-handling) |
| [high-availability-captcha-solving-failover](articles/high-availability-captcha-solving-failover/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/high-availability-captcha-solving-failover) |
| [horizontal-scaling-captcha-solving-workers](articles/horizontal-scaling-captcha-solving-workers/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/horizontal-scaling-captcha-solving-workers) |
| [how-akamai-bot-manager-captcha-works](articles/how-akamai-bot-manager-captcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-altcha-works-and-how-to-handle-it](articles/how-altcha-works-and-how-to-handle-it/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-audio-fingerprint-captcha-works](articles/how-audio-fingerprint-captcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-aws-waf-bot-control-captcha-works](articles/how-aws-waf-bot-control-captcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-cap-canvas-fingerprint-captcha-works](articles/how-cap-canvas-fingerprint-captcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-cap-js-works-and-how-to-handle-it](articles/how-cap-js-works-and-how-to-handle-it/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-cloudflare-managed-challenge-2026-works](articles/how-cloudflare-managed-challenge-2026-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-distil-networks-captcha-works](articles/how-distil-networks-captcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-fingerprintjs-bot-detection-works](articles/how-fingerprintjs-bot-detection-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-friendlycaptcha-works-and-how-to-handle-it](articles/how-friendlycaptcha-works-and-how-to-handle-it/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-incapsula-imperva-captcha-works](articles/how-incapsula-imperva-captcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-kasada-bot-defender-challenge-works](articles/how-kasada-bot-defender-challenge-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-mtcaptcha-works-explained](articles/how-mtcaptcha-works-explained/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-netease-easy-captcha-works](articles/how-netease-easy-captcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-passive-behavioral-captcha-works](articles/how-passive-behavioral-captcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-perimeterx-human-challenge-works](articles/how-perimeterx-human-challenge-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-pow-captcha-works-and-how-to-handle-it](articles/how-pow-captcha-works-and-how-to-handle-it/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-procaptcha-prosopo-works-explained](articles/how-procaptcha-prosopo-works-explained/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-recaptcha-enterprise-account-defender-works](articles/how-recaptcha-enterprise-account-defender-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-recaptcha-enterprise-payment-fraud-works](articles/how-recaptcha-enterprise-payment-fraud-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-recaptcha-multi-factor-mfa-pattern-works](articles/how-recaptcha-multi-factor-mfa-pattern-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-shape-security-imperva-challenge-works](articles/how-shape-security-imperva-challenge-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-tencent-captcha-works](articles/how-tencent-captcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-to-solve-bls-captcha-step-by-step](articles/how-to-solve-bls-captcha-step-by-step/) | BLS CAPTCHA | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-bls-captcha-step-by-step) |
| [how-to-solve-cloudflare-challenge-using-api](articles/how-to-solve-cloudflare-challenge-using-api/) | Cloudflare Challenge | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-cloudflare-challenge-using-api) |
| [how-to-solve-cloudflare-turnstile-using-api](articles/how-to-solve-cloudflare-turnstile-using-api/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-cloudflare-turnstile-using-api) |
| [how-to-solve-geetest-v3-using-api](articles/how-to-solve-geetest-v3-using-api/) | GeeTest v3 | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-geetest-v3-using-api) |
| [how-to-solve-geetest-v4-using-api](articles/how-to-solve-geetest-v4-using-api/) | GeeTest v4 | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-geetest-v4-using-api) |
| [how-to-solve-grid-image-captcha-automatically](articles/how-to-solve-grid-image-captcha-automatically/) | Grid Image CAPTCHA | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-grid-image-captcha-automatically) |
| [how-to-solve-hcaptcha-using-api](articles/how-to-solve-hcaptcha-using-api/) | hCaptcha | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-hcaptcha-using-api) |
| [how-to-solve-recaptcha-invisible-using-api](articles/how-to-solve-recaptcha-invisible-using-api/) | reCAPTCHA Invisible | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-invisible-using-api) |
| [how-to-solve-recaptcha-v2-callback-using-api](articles/how-to-solve-recaptcha-v2-callback-using-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-v2-callback-using-api) |
| [how-to-solve-recaptcha-v2-enterprise-using-api](articles/how-to-solve-recaptcha-v2-enterprise-using-api/) | reCAPTCHA v2 Enterprise | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-v2-enterprise-using-api) |
| [how-to-solve-recaptcha-v2-using-api](articles/how-to-solve-recaptcha-v2-using-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-v2-using-api) |
| [how-to-solve-recaptcha-v3-automatically-using-api](articles/how-to-solve-recaptcha-v3-automatically-using-api/) | reCAPTCHA v3 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-v3-automatically-using-api) |
| [how-to-solve-recaptcha-v3-enterprise-using-api](articles/how-to-solve-recaptcha-v3-enterprise-using-api/) | reCAPTCHA v3 Enterprise | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/how-to-solve-recaptcha-v3-enterprise-using-api) |
| [how-webgl-fingerprint-captcha-works](articles/how-webgl-fingerprint-captcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [how-yandex-smartcaptcha-works](articles/how-yandex-smartcaptcha-works/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [http-replay-captcha-api-debugging](articles/http-replay-captcha-api-debugging/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/http-replay-captcha-api-debugging) |
| [httpx-captchaai-integration](articles/httpx-captchaai-integration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/httpx-captchaai-integration) |
| [idempotent-captcha-solving-prevent-duplicates](articles/idempotent-captcha-solving-prevent-duplicates/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/idempotent-captcha-solving-prevent-duplicates) |
| [iframe-captcha-extraction-nested-frames](articles/iframe-captcha-extraction-nested-frames/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/iframe-captcha-extraction-nested-frames) |
| [igaming-affiliate-monitoring-captcha-handling](articles/igaming-affiliate-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [image-captcha-base64-encoding-best-practices](articles/image-captcha-base64-encoding-best-practices/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/image-captcha-base64-encoding-best-practices) |
| [image-captcha-confidence-scores-quality](articles/image-captcha-confidence-scores-quality/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/image-captcha-confidence-scores-quality) |
| [image-captcha-preprocessing-contrast-rotation](articles/image-captcha-preprocessing-contrast-rotation/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/image-captcha-preprocessing-contrast-rotation) |
| [image-captcha-solving-using-api](articles/image-captcha-solving-using-api/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/image-captcha-solving-using-api) |
| [immigration-portal-bookings-captcha-handling](articles/immigration-portal-bookings-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [implementing-retry-logic-captchaai-api](articles/implementing-retry-logic-captchaai-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/implementing-retry-logic-captchaai-api) |
| [improving-ocr-captcha-accuracy-captchaai-settings](articles/improving-ocr-captcha-accuracy-captchaai-settings/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/improving-ocr-captcha-accuracy-captchaai-settings) |
| [insurance-quote-comparison-captcha-automation](articles/insurance-quote-comparison-captcha-automation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/insurance-quote-comparison-captcha-automation) |
| [ios-xcuitest-captcha-handling](articles/ios-xcuitest-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/ios-xcuitest-captcha-handling) |
| [java-completablefuture-captchaai-async](articles/java-completablefuture-captchaai-async/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/java-completablefuture-captchaai-async) |
| [job-board-scraping-captcha-handling](articles/job-board-scraping-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/job-board-scraping-captcha-handling) |
| [kafka-captchaai-streaming-captcha-processing](articles/kafka-captchaai-streaming-captcha-processing/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/kafka-captchaai-streaming-captcha-processing) |
| [kubernetes-job-queues-captcha-solving-scale](articles/kubernetes-job-queues-captcha-solving-scale/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/kubernetes-job-queues-captcha-solving-scale) |
| [legal-research-scraping-captcha-handling](articles/legal-research-scraping-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/legal-research-scraping-captcha-handling) |
| [llm-data-pipeline-captchaai-airbyte](articles/llm-data-pipeline-captchaai-airbyte/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [load-testing-captcha-solving-pipeline](articles/load-testing-captcha-solving-pipeline/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/load-testing-captcha-solving-pipeline) |
| [make-integromat-captchaai-captcha-automation](articles/make-integromat-captchaai-captcha-automation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/make-integromat-captchaai-captcha-automation) |
| [market-research-data-collection](articles/market-research-data-collection/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/market-research-data-collection) |
| [math-captcha-solving-captchaai-calc-parameter](articles/math-captcha-solving-captchaai-calc-parameter/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/math-captcha-solving-captchaai-calc-parameter) |
| [memory-cpu-optimization-captcha-workers](articles/memory-cpu-optimization-captcha-workers/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/memory-cpu-optimization-captcha-workers) |
| [migrate-buster-to-captchaai-extension](articles/migrate-buster-to-captchaai-extension/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [migrate-nopecha-to-captchaai-extension](articles/migrate-nopecha-to-captchaai-extension/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [migration-from-2captcha-to-captchaai-extension](articles/migration-from-2captcha-to-captchaai-extension/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [migration-from-anti-captcha-helper-extension-to-captchaai](articles/migration-from-anti-captcha-helper-extension-to-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [migration-from-deathbycaptcha-extension-to-captchaai](articles/migration-from-deathbycaptcha-extension-to-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [mobile-browser-automation-captcha-solving](articles/mobile-browser-automation-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/mobile-browser-automation-captcha-solving) |
| [mongodb-captcha-solve-history-analytics](articles/mongodb-captcha-solve-history-analytics/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/mongodb-captcha-solve-history-analytics) |
| [monitoring-captcha-solve-rates-prometheus-grafana](articles/monitoring-captcha-solve-rates-prometheus-grafana/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/monitoring-captcha-solve-rates-prometheus-grafana) |
| [multi-character-image-captcha-solving-strategies](articles/multi-character-image-captcha-solving-strategies/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/multi-character-image-captcha-solving-strategies) |
| [multi-region-captcha-solving-architecture](articles/multi-region-captcha-solving-architecture/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/multi-region-captcha-solving-architecture) |
| [multi-step-checkout-automation-captcha-solving](articles/multi-step-checkout-automation-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/multi-step-checkout-automation-captcha-solving) |
| [multi-step-workflow-automation-captchaai](articles/multi-step-workflow-automation-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/multi-step-workflow-automation-captchaai) |
| [n8n-captchaai-no-code-automation](articles/n8n-captchaai-no-code-automation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/n8n-captchaai-no-code-automation) |
| [nats-messaging-captchaai-task-distribution](articles/nats-messaging-captchaai-task-distribution/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nats-messaging-captchaai-task-distribution) |
| [news-media-aggregation-captcha-handling](articles/news-media-aggregation-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/news-media-aggregation-captcha-handling) |
| [nft-marketplace-public-data-captcha-handling](articles/nft-marketplace-public-data-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [nodejs-captcha-solving-retry-error-handling](articles/nodejs-captcha-solving-retry-error-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nodejs-captcha-solving-retry-error-handling) |
| [nodejs-playwright-captchaai-complete-integration](articles/nodejs-playwright-captchaai-complete-integration/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nodejs-playwright-captchaai-complete-integration) |
| [nodejs-promise-allsettled-batch-captcha](articles/nodejs-promise-allsettled-batch-captcha/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nodejs-promise-allsettled-batch-captcha) |
| [nodejs-puppeteer-captchaai-advanced-patterns](articles/nodejs-puppeteer-captchaai-advanced-patterns/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nodejs-puppeteer-captchaai-advanced-patterns) |
| [nodejs-worker-threads-parallel-captcha-solving](articles/nodejs-worker-threads-parallel-captcha-solving/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/nodejs-worker-threads-parallel-captcha-solving) |
| [notion-api-captchaai-data-entry](articles/notion-api-captchaai-data-entry/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/notion-api-captchaai-data-entry) |
| [observability-axiom-logs-captchaai](articles/observability-axiom-logs-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [observability-baselime-captchaai](articles/observability-baselime-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [observability-betterstack-uptime-captchaai](articles/observability-betterstack-uptime-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [observability-captcha-pipelines-otel-2026](articles/observability-captcha-pipelines-otel-2026/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [observability-grafana-loki-captchaai-logs](articles/observability-grafana-loki-captchaai-logs/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [observability-grafana-tempo-captchaai](articles/observability-grafana-tempo-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [observability-honeycomb-captchaai](articles/observability-honeycomb-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [observability-sentry-error-tracking-captchaai](articles/observability-sentry-error-tracking-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [octoparse-captchaai-visual-scraping-captcha](articles/octoparse-captchaai-visual-scraping-captcha/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/octoparse-captchaai-visual-scraping-captcha) |
| [opentelemetry-tracing-captcha-pipelines](articles/opentelemetry-tracing-captcha-pipelines/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/opentelemetry-tracing-captcha-pipelines) |
| [oxylabs-captchaai-datacenter-proxy-integration](articles/oxylabs-captchaai-datacenter-proxy-integration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/oxylabs-captchaai-datacenter-proxy-integration) |
| [parsehub-captchaai-no-code-scraping](articles/parsehub-captchaai-no-code-scraping/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/parsehub-captchaai-no-code-scraping) |
| [passport-renewal-portal-captcha-testing](articles/passport-renewal-portal-captcha-testing/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [patent-trademark-search-captcha-handling](articles/patent-trademark-search-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [pharmacy-price-comparison-captcha-handling](articles/pharmacy-price-comparison-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/pharmacy-price-comparison-captcha-handling) |
| [phrase-min-max-length-parameters-image-captcha](articles/phrase-min-max-length-parameters-image-captcha/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/phrase-min-max-length-parameters-image-captcha) |
| [playwright-captcha-handling](articles/playwright-captcha-handling/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/playwright-captcha-handling) |
| [plugin-architecture-captcha-solving-pipelines](articles/plugin-architecture-captcha-solving-pipelines/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/plugin-architecture-captcha-solving-pipelines) |
| [power-automate-captchaai-captcha-solving](articles/power-automate-captchaai-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/power-automate-captchaai-captcha-solving) |
| [powershell-captchaai-windows-automation](articles/powershell-captchaai-windows-automation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/powershell-captchaai-windows-automation) |
| [profiling-captcha-bottlenecks-python](articles/profiling-captcha-bottlenecks-python/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/profiling-captcha-bottlenecks-python) |
| [property-records-portal-captcha-handling](articles/property-records-portal-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [proxy-authentication-methods-captchaai](articles/proxy-authentication-methods-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/proxy-authentication-methods-captchaai) |
| [proxy-rotation-captcha-scraping](articles/proxy-rotation-captcha-scraping/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/proxy-rotation-captcha-scraping) |
| [public-records-search-captcha-handling](articles/public-records-search-captcha-handling/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/public-records-search-captcha-handling) |
| [puppeteer-captcha-solving-nodejs](articles/puppeteer-captcha-solving-nodejs/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/puppeteer-captcha-solving-nodejs) |
| [puppeteer-stealth-captchaai-browser-automation](articles/puppeteer-stealth-captchaai-browser-automation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/puppeteer-stealth-captchaai-browser-automation) |
| [pwa-captcha-handling-guide](articles/pwa-captcha-handling-guide/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/pwa-captcha-handling-guide) |
| [pytest-captchaai-test-fixtures](articles/pytest-captchaai-test-fixtures/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/pytest-captchaai-test-fixtures) |
| [python-asyncio-captchaai-concurrent-solving](articles/python-asyncio-captchaai-concurrent-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-asyncio-captchaai-concurrent-solving) |
| [python-beautifulsoup-captchaai-protected-pages](articles/python-beautifulsoup-captchaai-protected-pages/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-beautifulsoup-captchaai-protected-pages) |
| [python-captcha-solving-retry-error-patterns](articles/python-captcha-solving-retry-error-patterns/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-captcha-solving-retry-error-patterns) |
| [python-multiprocessing-parallel-captcha-solving](articles/python-multiprocessing-parallel-captcha-solving/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-multiprocessing-parallel-captcha-solving) |
| [python-playwright-captchaai-complete-guide](articles/python-playwright-captchaai-complete-guide/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-playwright-captchaai-complete-guide) |
| [python-selenium-captchaai-complete-guide](articles/python-selenium-captchaai-complete-guide/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-selenium-captchaai-complete-guide) |
| [python-threadpool-captcha-parallelism](articles/python-threadpool-captcha-parallelism/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-threadpool-captcha-parallelism) |
| [python-wrapper-library-captchaai-api](articles/python-wrapper-library-captchaai-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/python-wrapper-library-captchaai-api) |
| [queue-batch-captcha-priority-processing](articles/queue-batch-captcha-priority-processing/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/queue-batch-captcha-priority-processing) |
| [rabbitmq-captchaai-message-queue-integration](articles/rabbitmq-captchaai-message-queue-integration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/rabbitmq-captchaai-message-queue-integration) |
| [rate-limiting-own-captcha-requests](articles/rate-limiting-own-captcha-requests/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/rate-limiting-own-captcha-requests) |
| [react-native-webview-captcha-solving](articles/react-native-webview-captcha-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/react-native-webview-captcha-solving) |
| [real-estate-data-scraping](articles/real-estate-data-scraping/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/real-estate-data-scraping) |
| [recaptcha-data-s-parameter-explained](articles/recaptcha-data-s-parameter-explained/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/recaptcha-data-s-parameter-explained) |
| [recaptcha-single-page-application-dynamic](articles/recaptcha-single-page-application-dynamic/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/recaptcha-single-page-application-dynamic) |
| [recaptcha-v3-action-parameter-explained](articles/recaptcha-v3-action-parameter-explained/) | reCAPTCHA v3 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/recaptcha-v3-action-parameter-explained) |
| [recaptcha-vs-turnstile-vs-hcaptcha-vs-altcha-2026](articles/recaptcha-vs-turnstile-vs-hcaptcha-vs-altcha-2026/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [redis-captcha-token-ttl-management](articles/redis-captcha-token-ttl-management/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/redis-captcha-token-ttl-management) |
| [redis-queue-captchaai-distributed-processing](articles/redis-queue-captchaai-distributed-processing/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/redis-queue-captchaai-distributed-processing) |
| [reduce-captcha-interruptions-in-web-scraping](articles/reduce-captcha-interruptions-in-web-scraping/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/reduce-captcha-interruptions-in-web-scraping) |
| [retail-inventory-monitoring-captcha-handling](articles/retail-inventory-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/retail-inventory-monitoring-captcha-handling) |
| [retail-site-captcha-handling](articles/retail-site-captcha-handling/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/retail-site-captcha-handling) |
| [retool-captchaai-internal-tool-captcha](articles/retool-captchaai-internal-tool-captcha/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/retool-captchaai-internal-tool-captcha) |
| [retry-storm-prevention-captcha-systems](articles/retry-storm-prevention-captcha-systems/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/retry-storm-prevention-captcha-systems) |
| [reusable-captcha-modules-client-projects](articles/reusable-captcha-modules-client-projects/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/reusable-captcha-modules-client-projects) |
| [review-aggregator-google-trustpilot-captcha-handling](articles/review-aggregator-google-trustpilot-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [rolling-updates-captcha-solving-workers](articles/rolling-updates-captcha-solving-workers/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/rolling-updates-captcha-solving-workers) |
| [saas-pricing-page-monitoring-captcha-handling](articles/saas-pricing-page-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [salary-compensation-data-captcha-handling](articles/salary-compensation-data-captcha-handling/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/salary-compensation-data-captcha-handling) |
| [scheduled-captcha-solving-cron-jobs](articles/scheduled-captcha-solving-cron-jobs/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scheduled-captcha-solving-cron-jobs) |
| [scraping-automation-captcha-handling](articles/scraping-automation-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scraping-automation-captcha-handling) |
| [scraping-protected-websites-captcha](articles/scraping-protected-websites-captcha/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scraping-protected-websites-captcha) |
| [scraping-reliability-captcha-handling](articles/scraping-reliability-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scraping-reliability-captcha-handling) |
| [scrapy-captchaai-integration](articles/scrapy-captchaai-integration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scrapy-captchaai-integration) |
| [scrapy-spider-middleware-captchaai-advanced](articles/scrapy-spider-middleware-captchaai-advanced/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/scrapy-spider-middleware-captchaai-advanced) |
| [search-results-captcha-handling](articles/search-results-captcha-handling/) | reCAPTCHA v3 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/search-results-captcha-handling) |
| [sec-edgar-style-feed-captcha-handling](articles/sec-edgar-style-feed-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [securing-captchaai-credentials-env-vars](articles/securing-captchaai-credentials-env-vars/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/securing-captchaai-credentials-env-vars) |
| [security-1password-cli-captchaai](articles/security-1password-cli-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [security-age-encrypted-secrets-captchaai](articles/security-age-encrypted-secrets-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [security-aws-secrets-manager-captchaai](articles/security-aws-secrets-manager-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [security-azure-key-vault-captchaai](articles/security-azure-key-vault-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [security-bitwarden-secrets-manager-captchaai](articles/security-bitwarden-secrets-manager-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [security-doppler-captchaai](articles/security-doppler-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [security-gcp-secret-manager-captchaai](articles/security-gcp-secret-manager-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [security-infisical-captchaai](articles/security-infisical-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [security-sops-encrypted-secrets-captchaai](articles/security-sops-encrypted-secrets-captchaai/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [selenium-captcha-handling-python](articles/selenium-captcha-handling-python/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/selenium-captcha-handling-python) |
| [selenium-grid-captchaai-distributed-solving](articles/selenium-grid-captchaai-distributed-solving/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/selenium-grid-captchaai-distributed-solving) |
| [selenium-wire-captchaai-request-interception](articles/selenium-wire-captchaai-request-interception/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/selenium-wire-captchaai-request-interception) |
| [semaphore-patterns-captcha-concurrency](articles/semaphore-patterns-captcha-concurrency/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/semaphore-patterns-captcha-concurrency) |
| [seo-rank-tracker-captcha-handling](articles/seo-rank-tracker-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [serp-feature-monitoring-captcha-handling](articles/serp-feature-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [shadow-dom-captcha-handling-web-components](articles/shadow-dom-captcha-handling-web-components/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/shadow-dom-captcha-handling-web-components) |
| [shipping-logistics-rate-scraping-captcha](articles/shipping-logistics-rate-scraping-captcha/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/shipping-logistics-rate-scraping-captcha) |
| [slack-bot-captcha-notifications](articles/slack-bot-captcha-notifications/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/slack-bot-captcha-notifications) |
| [smartproxy-captchaai-residential-proxy-setup](articles/smartproxy-captchaai-residential-proxy-setup/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/smartproxy-captchaai-residential-proxy-setup) |
| [social-media-research-captcha-handling](articles/social-media-research-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/social-media-research-captcha-handling) |
| [socks5-proxy-captchaai-setup-configuration](articles/socks5-proxy-captchaai-setup-configuration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/socks5-proxy-captchaai-setup-configuration) |
| [solve-bls-captcha-nodejs](articles/solve-bls-captcha-nodejs/) | BLS CAPTCHA | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-bls-captcha-nodejs) |
| [solve-bls-captcha-python](articles/solve-bls-captcha-python/) | BLS CAPTCHA | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-bls-captcha-python) |
| [solve-cloudflare-challenge-nodejs](articles/solve-cloudflare-challenge-nodejs/) | Cloudflare Challenge | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-cloudflare-challenge-nodejs) |
| [solve-cloudflare-challenge-python](articles/solve-cloudflare-challenge-python/) | Cloudflare Challenge | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-cloudflare-challenge-python) |
| [solve-geetest-v3-nodejs](articles/solve-geetest-v3-nodejs/) | GeeTest v3 | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-geetest-v3-nodejs) |
| [solve-geetest-v3-php](articles/solve-geetest-v3-php/) | GeeTest v3 | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-geetest-v3-php) |
| [solve-geetest-v3-python](articles/solve-geetest-v3-python/) | GeeTest v3 | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-geetest-v3-python) |
| [solve-grid-image-captcha-nodejs](articles/solve-grid-image-captcha-nodejs/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-grid-image-captcha-nodejs) |
| [solve-grid-image-captcha-python](articles/solve-grid-image-captcha-python/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-grid-image-captcha-python) |
| [solve-image-captcha-base64-api](articles/solve-image-captcha-base64-api/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-image-captcha-base64-api) |
| [solve-image-captcha-nodejs](articles/solve-image-captcha-nodejs/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-image-captcha-nodejs) |
| [solve-image-captcha-python-ocr](articles/solve-image-captcha-python-ocr/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-image-captcha-python-ocr) |
| [solve-multiple-captcha-types-workflow](articles/solve-multiple-captcha-types-workflow/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-multiple-captcha-types-workflow) |
| [solve-recaptcha-invisible-nodejs](articles/solve-recaptcha-invisible-nodejs/) | reCAPTCHA Invisible | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-recaptcha-invisible-nodejs) |
| [solve-recaptcha-invisible-python](articles/solve-recaptcha-invisible-python/) | reCAPTCHA Invisible | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-recaptcha-invisible-python) |
| [solve-recaptcha-v2-enterprise-nodejs](articles/solve-recaptcha-v2-enterprise-nodejs/) | reCAPTCHA v2 Enterprise | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-recaptcha-v2-enterprise-nodejs) |
| [solve-recaptcha-v2-enterprise-python](articles/solve-recaptcha-v2-enterprise-python/) | reCAPTCHA v2 Enterprise | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-recaptcha-v2-enterprise-python) |
| [solve-recaptcha-v3-enterprise-php](articles/solve-recaptcha-v3-enterprise-php/) | reCAPTCHA v3 Enterprise | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solve-recaptcha-v3-enterprise-php) |
| [solving-captcha-in-langchain-agent-pipelines](articles/solving-captcha-in-langchain-agent-pipelines/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [solving-captcha-in-llamaindex-data-loaders](articles/solving-captcha-in-llamaindex-data-loaders/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [solving-captcha-with-anthropic-computer-use](articles/solving-captcha-with-anthropic-computer-use/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [solving-captcha-with-browser-use-agent](articles/solving-captcha-with-browser-use-agent/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [solving-captcha-with-multi-on-agent](articles/solving-captcha-with-multi-on-agent/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [solving-captcha-with-openai-computer-use-agent](articles/solving-captcha-with-openai-computer-use-agent/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [solving-captcha-with-skyvern-agent](articles/solving-captcha-with-skyvern-agent/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [solving-captcha-with-stagehand-ai-browser](articles/solving-captcha-with-stagehand-ai-browser/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [solving-captchas-chinese-websites](articles/solving-captchas-chinese-websites/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-chinese-websites) |
| [solving-captchas-dart-flutter-captchaai](articles/solving-captchas-dart-flutter-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-dart-flutter-captchaai) |
| [solving-captchas-japanese-korean-websites](articles/solving-captchas-japanese-korean-websites/) | Image/OCR CAPTCHA | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-japanese-korean-websites) |
| [solving-captchas-kotlin-captchaai-api](articles/solving-captchas-kotlin-captchaai-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-kotlin-captchaai-api) |
| [solving-captchas-perl-captchaai-api](articles/solving-captchas-perl-captchaai-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-perl-captchaai-api) |
| [solving-captchas-r-research-data-collection](articles/solving-captchas-r-research-data-collection/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-r-research-data-collection) |
| [solving-captchas-ruby-captchaai-api](articles/solving-captchas-ruby-captchaai-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-ruby-captchaai-api) |
| [solving-captchas-rust-captchaai-api](articles/solving-captchas-rust-captchaai-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-rust-captchaai-api) |
| [solving-captchas-scala-captchaai-api](articles/solving-captchas-scala-captchaai-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-scala-captchaai-api) |
| [solving-captchas-swift-captchaai-api](articles/solving-captchas-swift-captchaai-api/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-captchas-swift-captchaai-api) |
| [solving-cloudflare-turnstile-nodejs](articles/solving-cloudflare-turnstile-nodejs/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-cloudflare-turnstile-nodejs) |
| [solving-cloudflare-turnstile-python-requests](articles/solving-cloudflare-turnstile-python-requests/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-cloudflare-turnstile-python-requests) |
| [solving-geetest-v3-nodejs-captchaai](articles/solving-geetest-v3-nodejs-captchaai/) | GeeTest v3 | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-geetest-v3-nodejs-captchaai) |
| [solving-geetest-v3-python-captchaai](articles/solving-geetest-v3-python-captchaai/) | GeeTest v3 | 🟡 Standard | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-geetest-v3-python-captchaai) |
| [solving-recaptcha-v2-nodejs-fetch](articles/solving-recaptcha-v2-nodejs-fetch/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-recaptcha-v2-nodejs-fetch) |
| [solving-recaptcha-v2-python-requests](articles/solving-recaptcha-v2-python-requests/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/solving-recaptcha-v2-python-requests) |
| [sports-betting-odds-monitoring-captcha-handling](articles/sports-betting-odds-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [sports-statistics-data-captcha-handling](articles/sports-statistics-data-captcha-handling/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/sports-statistics-data-captcha-handling) |
| [sqlite-local-captcha-solve-caching](articles/sqlite-local-captcha-solve-caching/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/sqlite-local-captcha-solve-caching) |
| [sse-realtime-captcha-solve-notifications](articles/sse-realtime-captcha-solve-notifications/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/sse-realtime-captcha-solve-notifications) |
| [stock-market-data-captcha-handling](articles/stock-market-data-captcha-handling/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/stock-market-data-captcha-handling) |
| [storing-captcha-results-postgresql](articles/storing-captcha-results-postgresql/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/storing-captcha-results-postgresql) |
| [streaming-batch-captcha-results-processing](articles/streaming-batch-captcha-results-processing/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/streaming-batch-captcha-results-processing) |
| [structured-logging-captcha-operations](articles/structured-logging-captcha-operations/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/structured-logging-captcha-operations) |
| [supply-chain-monitoring-captcha-handling](articles/supply-chain-monitoring-captcha-handling/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/supply-chain-monitoring-captcha-handling) |
| [tax-portal-data-pull-captcha-handling](articles/tax-portal-data-pull-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [terraform-captchaai-infrastructure-as-code](articles/terraform-captchaai-infrastructure-as-code/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/terraform-captchaai-infrastructure-as-code) |
| [testing-captchaai-parallel-run-migration](articles/testing-captchaai-parallel-run-migration/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/testing-captchaai-parallel-run-migration) |
| [time-series-captcha-solve-performance-trends](articles/time-series-captcha-solve-performance-trends/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/time-series-captcha-solve-performance-trends) |
| [token-bucket-rate-limited-captcha-concurrency](articles/token-bucket-rate-limited-captcha-concurrency/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/token-bucket-rate-limited-captcha-concurrency) |
| [travel-fare-monitoring](articles/travel-fare-monitoring/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/travel-fare-monitoring) |
| [type-safe-captchaai-client-typescript-generics](articles/type-safe-captchaai-client-typescript-generics/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/type-safe-captchaai-client-typescript-generics) |
| [typescript-captchaai-type-safe-solving](articles/typescript-captchaai-type-safe-solving/) | Cloudflare Turnstile | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/typescript-captchaai-type-safe-solving) |
| [undetected-chromedriver-captchaai](articles/undetected-chromedriver-captchaai/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/undetected-chromedriver-captchaai) |
| [university-registration-captcha-testing](articles/university-registration-captcha-testing/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/university-registration-captcha-testing) |
| [vault-integration-captchaai-api-key](articles/vault-integration-captchaai-api-key/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/vault-integration-captchaai-api-key) |
| [vector-db-ingest-captcha-protected-sources](articles/vector-db-ingest-captcha-protected-sources/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [vfs-global-appointment-captcha-handling](articles/vfs-global-appointment-captcha-handling/) | reCAPTCHA v2 | 🟡 Standard | Python | Pending publication |
| [webhook-endpoint-monitoring-captcha-callbacks](articles/webhook-endpoint-monitoring-captcha-callbacks/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/webhook-endpoint-monitoring-captcha-callbacks) |
| [zapier-captchaai-no-code-automation](articles/zapier-captchaai-no-code-automation/) | reCAPTCHA v2 | 🟢 Verified | Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, Bash | [Blog](https://blog.captchaai.com/zapier-captchaai-no-code-automation) |
<!-- END GENERATED INDEX -->

## How each example works

Every example follows the same pattern:

1. **Submit** — Send CAPTCHA parameters to `https://ocr.captchaai.com/in.php`
2. **Wait** — Pause 15-20 seconds for initial processing
3. **Poll** — Check `https://ocr.captchaai.com/res.php` every 5 seconds
4. **Result** — Receive the solved token for injection

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
| Polling | `CAPCHA_NOT_READY` | Normal — keeps polling |

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines on adding new examples.

## Links

- [CaptchaAI Website](https://captchaai.com)
- [API Documentation](https://captchaai.com/api-docs)
- [CaptchaAI Blog](https://blog.captchaai.com)

## License

MIT
