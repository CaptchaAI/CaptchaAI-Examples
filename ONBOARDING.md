# CaptchaAI Examples Onboarding

This is the public examples repo.

If you are onboarding, start here before editing pack content or changing repo-level messaging.

## What this repo is for

- publish client-facing runnable example packs
- help readers move from a blog article to working CaptchaAI code fast
- state support levels honestly
- give clients a stable pack-level contract through `articles/{slug}/README.md`

## What this repo is not for

- internal article production workflow
- private generation or repair tooling
- private smoke credentials or tracked factory state
- editorial planning or publication reconciliation

Those responsibilities live in the private `cai_content` repo.

## Business role

The examples repo supports the same API business as the blog:

- accelerate time-to-first-solve
- convert readers into API users
- reduce support load with working references
- support partner and ecosystem content with practical code

## Public contract

Treat these as the client-facing contract:

- each pack directory under `articles/{slug}/`
- the pack README inside that directory
- the support tier shown for the pack

Do not treat internal generation history as part of the public contract.

## Relations to the private repo

| Public surface | Private source or owner |
|---|---|
| `articles/{slug}/` | article slug and example metadata in `cai_content` |
| Pack README backlink | blog article at `https://blog.captchaai.com/{slug}` |
| Root README index | generated from private manifests and validation |
| Support tier | private example-factory validation and reporting |

## Checks that matter here

### Public CI

The repository CI checks:

- Python lint
- Node.js syntax
- PHP syntax
- Go vet or formatting
- Ruby syntax
- Bash syntax
- Java compile check
- Kotlin syntax check
- C# build check
- Rust compile check
- required pack structure and at least one supported implementation

### Private owner checks

The private factory also checks:

- backlink and metadata consistency
- manifest truth for pack tier and captcha type
- generated root README index accuracy
- deeper lint, audit, and optional smoke validation

## Editing rules

1. Keep client-facing docs clear and honest.
2. Do not claim more support than the current tier can justify.
3. Do not hand-edit the generated root README index unless you are intentionally repairing it and regenerating immediately after.
4. Keep pack README setup steps aligned with the actual files in that pack.
5. If a language is listed, that implementation should exist and be usable as documented.

## Start-here order

1. `README.md`
2. `CONTRIBUTING.md`
3. the specific pack `articles/{slug}/README.md` you plan to touch

Then, if you own the private repo too, run the cross-repo checks from `cai_content`.