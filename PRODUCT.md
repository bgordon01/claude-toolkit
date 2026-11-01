# Product

<!-- impeccable:product-schema 1 -->

## Platform

web

## Users
Vibe coders: people who go straight from a prompt to code in Claude Code or the Claude app, and then spend their time re-prompting when things break. They arrive at the landing page curious but impatient, usually from a link or the GitHub repo.

## Product Purpose
Frontier (repo `claude-toolkit`, plugin `toolkit`) is a set of 18 Claude skills plus one workflow that makes Claude question, plan, test and review before anything ships. Success for the landing page is an install: "Add to Claude" via the Claude app marketplace, with Claude Code and cloud-session paths as secondary routes.

## Positioning
It moves the work to the parts only the user can do — deciding what to build and checking what got built — through one command (`/start-here`) that picks the next step, and review gates: nothing changes the user's files until they say go.

## Operating Context
- Workflow: Grill (`/grill-me`) → Spec (`/to-spec`) → Tickets (`/to-tickets`) → Build (`/implement`, `/tdd`) → Polish (`/impeccable polish`, `/copywriting`, `/stop-slop`) → Review (`/code-review`, `/impeccable critique`).
- Side routes: improve an existing project, fix a bug (`/diagnosing-bugs`), write copy.
- Read-only steps run straight away; steps that change files wait for "go".

## Capabilities and Constraints
- Static `site/index.html`, no build step, deployed to GitHub Pages from `site/` on push to `main`.
- No analytics.
- Plugin, commands and repo keep the `toolkit` / `claude-toolkit` names for now; install steps must stay correct.
- House rules (`rules/` and `~/.claude/claude-toolkit-rules.md`) apply: no AI-default palette, no three-equal-cards rows, 4px grid, one bold element per view, banned-words list.

## Brand Commitments
- Name: Frontier.
- Gate mark: a horizon line broken by a gate, path `M2 20H12V13M20 13V20H30` in a 32×32 box. The same glyph marks "waits for your go" steps.
- Orange accent: `#C2410C` (lighter `#F28C4B` on dark grounds).
- Voice: blunt, second person, opinionated; mechanisms and numbers over adjectives. Concise: one-line ledes, nothing that doesn't earn its place.
- Light theme only. No dark mode, no automatic or manual theme switch.
- Clean, with generous white space.

## Evidence on Hand
- 18 skills from 4 authors: Matt Pocock (MIT), Paul Bakaus / Impeccable (Apache 2.0), Hardik Pandya / stop-slop (MIT), Corey Haines / marketingskills (MIT).
- Logo and icon assets in `site/assets/`.
- No testimonials, user counts or benchmarks exist; do not invent them.

## Product Principles
- Decisions before code.
- The user says go; Claude does the typing.
- One front door (`/start-here`), many routes behind it.
- Show the mechanism, not the hype.
