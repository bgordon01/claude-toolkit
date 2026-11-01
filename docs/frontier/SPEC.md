# Frontier landing page — spec

Decisions from the grilling session on 2026-11-01. Each line is settled unless marked open.

## Name and scope
- The toolkit is presented as **Frontier** on the landing page only.
- The plugin (`toolkit@bgordon01`), commands (`/toolkit:start-here`) and repo (`claude-toolkit`) keep their names for now. Renaming them is a separate ticket, so the page's install steps stay correct.

## Goal and audience
- Audience: vibe coders who go straight from prompt to code.
- Job of the page: get them to install. Primary action is "Add to Claude" (the app marketplace path). Claude Code and cloud-session paths sit in a secondary install block.
- Message: move the work to planning and review. Framed as a before/after contrast:
  - Before: prompt → code → hope.
  - After: grill → spec → tickets → build test-first → review.

## Structure (in order)
1. Hero: "Plan first. Then let Claude code." / "18 skills and one workflow that make Claude question, plan, test and review before anything ships." / Add to Claude.
2. Before/after contrast.
3. Workflow diagram (the page's one bold element). Main path is "Build something new". Each step shows its skills and their author. Side routes: Improve an existing project, Fix a bug, Write copy.
4. Review gates: "Nothing changes your files until you say go." Steps that change files carry a gate mark in the diagram.
5. House rules, shown as the opinions Frontier enforces.
6. Command table.
7. Install block: Claude app, Claude Code, cloud sessions. Copy buttons.
8. Built on: Matt Pocock, Paul Bakaus, Hardik Pandya, Corey Haines, each linked with their licence.

## The three skill sets
| Set | Author | Skills |
|---|---|---|
| Plan, build, review | Matt Pocock | grill-me, to-spec, to-tickets, implement, tdd, code-review, diagnosing-bugs, improve-codebase-architecture (+ grilling, codebase-design, domain-modeling, setup-matt-pocock-skills) |
| Design | Paul Bakaus | impeccable (+ 4 helper agents) |
| Copy | Hardik Pandya, Corey Haines | stop-slop, copywriting, copy-editing |

The sets are mapped onto the single workflow, not shown as three equal sections.

## Voice
- Blunt, second person, opinionated. Mechanisms and numbers over adjectives.
- House copy rules apply; `/stop-slop` runs over final copy.

## Visual
- Warm paper and ink. Accent: deep orange `#C2410C` (dark mode `#F28C4B`).
- Type: Source Serif 4 (headline), Inter (body), JetBrains Mono (commands).
- Automatic dark mode.
- 4px spacing grid, no three-equal-cards layouts, one bold element (the workflow diagram).

## Logo
- Wordmark "Frontier" in Source Serif 4, plus a symbol that stands alone as favicon and plugin icon.
- Symbol concept: a horizon line broken by a gate — the review point where you say go. Single stroke, deep orange.
- Three takes (A step, B gate, C crossing point) shown side by side in the preview. **Open: the user picks one.**
- Deliverables: SVG full logo, SVG symbol, SVG favicon; PNG exports and a 1200×630 social card after the pick.

## Tech and delivery
- Static `site/index.html`, no build step. JavaScript only for copy buttons.
- Deployed by a GitHub Actions workflow to GitHub Pages on push to `main`, at `bgordon01.github.io/claude-toolkit`. Pages must be enabled once in repo settings (Source: GitHub Actions).
- No analytics.
- Built on a branch, previewed as an Artifact, PR opened only after approval.
