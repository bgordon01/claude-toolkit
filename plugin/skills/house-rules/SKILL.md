---
name: house-rules
description: claude-toolkit's design and copy rules. Apply whenever building or changing any user interface, or writing any text a user will read (UI labels, pages, emails, docs, marketing copy). They override other design and copy skills where they conflict.
---

# claude-toolkit — house rules

These rules apply in every repo. A project's own CLAUDE.md overrides them where the two conflict.

## Design rules — apply to all UI code
- **No AI-default palette.** No purple-to-blue gradients, glowing/neon borders, or floating card shadows unless explicitly requested.
- **Asymmetry over grids.** Avoid the 3-equal-cards-in-a-row pattern. Prefer variable column spans, side-aligned headline layouts, or dense tables.
- **4pt hard grid.** Every padding, margin and gap is a multiple of 4px (Tailwind: `p-1`, `gap-2`, `p-6`, `gap-8`). No arbitrary values like `p-[13px]`.
- **One bold element per view.** Pick exactly one statement element (a large serif headline, or a striking data layout). Everything else stays quiet: neutral colours, restrained type, minimal decoration.

## Copy rules — apply to all UI text, labels, headings and docs
- **Banned words:** revolutionize, seamless, empower, elevate, unleash, robust, supercharge, next-gen, game-changer, "unlock your potential".
- **No throat-clearing.** Never open with "In today's fast-paced world…" or "Here is your updated code…". Start with the point.
- **Concrete over vague.** Lead with the mechanism and a number: "Deploy in 30 seconds", not "Blazing fast deployments".
- **Fit the space.** Labels, buttons and errors must read cleanly in their container without awkward wraps.

## Where to start
- If the user is unsure what to do next, or asks for help building, improving, fixing or writing something, use the `start-here` skill to guide them.

## Engineering workflow (Matt Pocock's skills)
- Before building a non-trivial feature, run `/grill-me` and resolve open questions first.
- To improve an existing codebase, start read-only with `/improve-codebase-architecture`, then grill through what to fix.
- Capture the result with `/to-spec`, break it down with `/to-tickets`, build one ticket at a time with `/implement` (test-first via `/tdd`).
- Review with `/code-review`; use `/diagnosing-bugs` for hard bugs.

## Design workflow (Impeccable)
- Use `/impeccable critique`, `/impeccable polish` and `/impeccable clarify` for design and UX-copy passes.
- The four design laws above take precedence over Impeccable's defaults where they differ.

## Copy workflow
- Write new marketing or landing-page copy with `/copywriting`; tighten existing copy with `/copy-editing`.
- Run `/stop-slop` over any prose before it ships.
- The banned-words list above applies on top of both.
