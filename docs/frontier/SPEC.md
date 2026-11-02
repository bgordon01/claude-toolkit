# Frontier landing page — spec

Decisions from the grilling session on 2026-11-01. Each line is settled unless marked open.

## Name and scope
- The toolkit is called **Frontier** everywhere: repo `bgordon01/frontier`, plugin `frontier@bgordon01`, commands `/frontier:start`, install folder `~/.frontier`, rules file `frontier-rules.md`.
- Existing installs: `install.sh` moves `~/.claude-toolkit` to `~/.frontier`, re-points the git remote, and swaps the old rules file and CLAUDE.md block. Plugin users remove `toolkit` and add `frontier`; the README and landing page say so. No `toolkit` alias is kept in the marketplace, so nobody gets every skill twice.
- The GitHub repo itself is renamed by hand in Settings → General. GitHub redirects old clone, web and raw links; the old Pages address does not redirect.

## Goal and audience
- Audience: vibe coders who go straight from prompt to code.
- Job of the page: get them to install. Primary action is "Add to Claude" (the app marketplace path). Claude Code and cloud-session paths sit in a secondary install block.
- Message: move the work to planning and review. Framed as a before/after contrast:
  - Before: prompt → code → hope.
  - After: grill → spec → tickets → build test-first → review → draft PR.

## Structure (in order)
1. Hero: "Plan first. Then let Claude code." / sub / Add to Claude, with a review-gate product panel (a paused `/to-spec` step waiting on Go) and a mono stats row. The headline is the page's one bold element.
2. "Nothing changes your files until you say go": reads-only steps run straight away, write steps wait.
3. Six-step workflow (Grill → Spec → Tickets → Build → Review → Done), each step tagged reads-only or changes-files and credited to its author.
4. Other ways in: improve a project, fix a bug, write or edit copy, design a screen.
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
- White and ink on a hairline-ruled "shell". Accent: crimson `#AF144B` (hover `#870A3C`).
- Type: Inter (UI and headlines), Fira Code (commands, labels, code).
- Light theme only.
- 4px spacing grid, no three-equal-cards layouts, one bold element (the hero headline).

## Logo
- Wordmark "Frontier" in Inter 600, plus a mark (command-prompt chevron) that stands alone as favicon and plugin icon.
- Symbol concept: a command prompt — a chevron (`›`) and cursor in a rounded square, for the one command Frontier asks of you (`/start`).
- Mark path in a 28×28 box: `M10 9L15 14L10 19` (chevron) plus a short cursor underline. Outline on light grounds; filled crimson for app icons and the favicon.
- The review gate shows in the UI as the "Changes files · waits" tag on steps that write.
- Files in `site/assets/`: `logo.svg` (follows light/dark), `logo-on-light.svg`, `logo-on-dark.svg`, `mark.svg`, `favicon.svg`, `favicon-32.png`, `apple-touch-icon.png` (180), `icon-512.png`, `logo.png`, `og.png` (1200×630 social card). Wordmark is "Frontier" in Inter 600.

## Tech and delivery
- Static `site/index.html`, no build step. JavaScript only for copy buttons.
- Deployed by a GitHub Actions workflow to GitHub Pages on push to `main`, at `bgordon01.github.io/frontier`. Pages must be enabled once in repo settings (Source: GitHub Actions).
- No analytics.
- Built on a branch, previewed as an Artifact, PR opened only after approval.
