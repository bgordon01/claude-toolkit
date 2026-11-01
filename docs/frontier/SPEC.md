# Frontier landing page — spec

Decisions from the grilling session on 2026-11-01. Each line is settled unless marked open.

## Name and scope
- The toolkit is called **Frontier** everywhere: repo `bgordon01/frontier`, plugin `frontier@bgordon01`, commands `/frontier:start-here`, install folder `~/.frontier`, rules file `frontier-rules.md`.
- Existing installs: `install.sh` moves `~/.claude-toolkit` to `~/.frontier`, re-points the git remote, and swaps the old rules file and CLAUDE.md block. Plugin users remove `toolkit` and add `frontier`; the README and landing page say so. No `toolkit` alias is kept in the marketplace, so nobody gets every skill twice.
- The GitHub repo itself is renamed by hand in Settings → General. GitHub redirects old clone, web and raw links; the old Pages address does not redirect.

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
- Chosen: **B, gate**. Two horizon arms with raised posts either side of a gap. Mark path in a 32×32 box: `M2 20H12V13M20 13V20H30`. Arms are longer than posts so it reads as a line first, not as brackets.
- The same gate glyph marks "waits for your go" steps in the workflow diagram.
- Files in `site/assets/`: `logo.svg` (follows light/dark), `logo-on-light.svg`, `logo-on-dark.svg`, `mark.svg`, `favicon.svg`, `favicon-32.png`, `apple-touch-icon.png` (180), `icon-512.png`, `logo.png` (4×), `og.png` (1200×630 social card). Wordmark is outlined Source Serif 4 600, so it renders without the font installed.

## Tech and delivery
- Static `site/index.html`, no build step. JavaScript only for copy buttons.
- Deployed by a GitHub Actions workflow to GitHub Pages on push to `main`, at `bgordon01.github.io/frontier`. Pages must be enabled once in repo settings (Source: GitHub Actions).
- No analytics.
- Built on a branch, previewed as an Artifact, PR opened only after approval.
