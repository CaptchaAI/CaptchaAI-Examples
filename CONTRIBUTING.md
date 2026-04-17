# Contributing to CaptchaAI Examples

## Overview

This repository holds full working code examples that accompany [CaptchaAI blog articles](https://blog.captchaai.com). Each example is a complete, runnable project — not a snippet.

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
  .env.example       # All required environment variables
  .gitignore         # Excludes .env, node_modules, vendor, __pycache__
  python/            # Python implementation (if applicable)
    solve.py
    requirements.txt
  node/              # Node.js implementation (if applicable)
    solve.js
    package.json
  php/               # PHP implementation (if applicable)
    solve.php
    composer.json
```

## Code requirements

### API endpoints

- Submit: `https://ocr.captchaai.com/in.php`
- Poll: `https://ocr.captchaai.com/res.php`
- Always use `json=1` for structured responses

### Credentials

- Load from `.env` file using dotenv
- Use `YOUR_API_KEY` as the placeholder in `.env.example`
- Never commit real API keys

### Polling

- Wait 15-20 seconds before first poll
- Poll every 5 seconds
- Handle `CAPCHA_NOT_READY` as normal in-progress
- Implement a maximum timeout (default: 120 seconds)

### Error handling

Handle all documented error categories:
- Auth errors → clear message about API key
- Balance errors → message to top up
- Input errors → parameter validation message
- Transient errors → retry with exponential backoff
- Solve errors → log and suggest parameter check

### Expected output

Include a section in the README showing what a successful run looks like.

## README template

Every example README must include:

1. Title (matches the article)
2. Description
3. Link to the blog article
4. Prerequisites
5. Setup instructions (clone → install → configure → run)
6. Environment variables table
7. How it works
8. Expected output
9. Common errors table
10. Troubleshooting
11. API docs link
12. Related examples

## Linking

- Example README links to: blog article, API docs, related examples
- Blog article links to: example repo path

## Quality checklist

Before submitting:

- [ ] Code uses real CaptchaAI API endpoints
- [ ] `.env.example` lists all required variables
- [ ] Setup instructions work from clone to first run
- [ ] Error handling covers all documented error categories
- [ ] Expected output is accurate
- [ ] README links back to the blog article
- [ ] No real API keys or secrets in the code
- [ ] Code follows the language's standard style guide

## Scaffolding

New example packs are scaffolded using the tool in the `cai_content` repository:

```bash
python scripts/scaffold_example_pack.py articles/{slug}.md --examples-repo ../CaptchaAI-Examples
```

This generates the directory structure, README template, `.env.example`, and starter code files.

## Languages

- Primary language is selected based on the article's ICP (Ideal Customer Profile)
- 1 canonical full implementation per example
- Optionally 2 languages for high-value articles
- Do not force all languages for every example
