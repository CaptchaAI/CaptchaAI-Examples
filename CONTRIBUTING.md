# Working With CaptchaAI Examples

This repository is maintained internally and published so CaptchaAI clients can get to working example code quickly.

The public contract here is simple: each pack under `articles/{slug}/` is a client-facing example, and the README inside that pack is the setup and usage guide clients should follow.

If you are onboarding to this repo, read `ONBOARDING.md` first.

## Public vs private

- Public: blog articles on `blog.captchaai.com` and the example packs in this repository.
- Private: the editorial workflow, generation pipeline, maintenance scripts, and internal review process used to create and update those outputs.

This public repo intentionally contains the published packs only. Internal templates, tools, scaffolding, repair scripts, smoke tooling, and other maintenance automation stay in the private factory.

This repo exists to serve clients, not to document the internal factory that produces content and examples.

## Support levels

We use support levels to describe the current confidence level honestly, not to imply perfection across every included language.

| Tier | Badge | What it means |
|------|-------|---------------|
| **Verified** | 🟢 | The pack's reference flow has been reviewed closely and checked against current CaptchaAI behavior and repo validation. This is the highest-confidence level in the public repo, but not every included language always receives identical review depth. |
| **Standard** | 🟡 | The pack is documented, available, and structurally checked. At least one implementation has been reviewed, while other included implementations may still be receiving lighter validation or iterative improvement. |
| **Available** | ⚪ | The pack is published because it is useful to clients, with lighter review depth than Standard or Verified. It is available for reference without claiming perfect parity across every included implementation. |

## Language coverage

Many packs currently include Python, Node.js, PHP, Go, Java, C#, Ruby, Rust, Kotlin, and Bash.

That is a current coverage choice, not a permanent promise for every pack now or later. The README and support tier of a specific pack are the source of truth for what level of support you should expect.

## What we check publicly

The public quality bar focuses on usefulness and honesty:

- Correct CaptchaAI API endpoints and parameter usage
- Clear setup instructions and environment configuration
- A canonical blog backlink for context when the article is live or scheduled for imminent publication, or an explicit pending-publication note when it is not
- Lint or compile checks where toolchains are available
- Deeper runtime or smoke validation on selected reference flows

The private owner repo also regenerates the root README index, checks cross-repo metadata truth, and validates support-tier claims before treating the public repo as healthy.

Do not point users at missing or unknown `blog.captchaai.com` URLs from this public repo. Scheduled canonical links are acceptable when publication is imminent.

## External contributions

This repository is not running a broad external contribution workflow right now. If that changes, this file will be updated.
