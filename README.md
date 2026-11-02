<p>
  <picture>
    <source media="(prefers-color-scheme: dark)" srcset="site/assets/logo-on-dark.svg">
    <img src="site/assets/logo-on-light.svg" alt="Frontier" width="236" height="60">
  </picture>
</p>

# Plan first. Then let Claude code.

**Frontier** is 18 skills that make Claude ask questions, write a plan, test and review before it changes your code. It works in the Claude app and in [Claude Code](https://claude.com/claude-code).

You only need one command: type `/start` (or say "start here"). It asks what you want and hands you each next step.

[Landing page](https://bgordon01.github.io/frontier) · Renamed from claude-toolkit: [how to switch](#switching-from-claude-toolkit)

## Install

**Claude app** (most people): **Customize → Plugins → Add → Add marketplace**, enter `bgordon01/frontier`, then add **frontier** from **Discover**. It also reaches Claude Code on the same account.

**Claude Code:**

```
/plugin install frontier --marketplace bgordon01/frontier
```

**Mac install script** (shorter commands, `/start` instead of `/frontier:start`; use this or the plugin, not both), then restart Claude Code:

```bash
curl -fsSL https://raw.githubusercontent.com/bgordon01/frontier/main/install.sh | bash
```

**Cloud sessions** (Code tab, claude.ai/code): paste into your environment's **Setup script** once:

```bash
#!/bin/bash
curl -fsSL https://raw.githubusercontent.com/bgordon01/frontier/main/install.sh | bash || true
```

## Use it

Type `/start`. It offers six routes:

| Route | What happens |
|---|---|
| **Build something new** | Grill → spec → tickets, then per ticket: build test-first, polish, review. |
| **Improve a project** | Reads the code or screens and lists fixes, changing nothing. Your picks become tickets. |
| **Fix a bug** | Finds the cause, adds a failing test, fixes it, reviews it. |
| **Write copy** | Writes or tightens copy, then strips machine-sounding phrasing. |
| **Design something** (optional) | A design brief first, then critique and steer, then a `DESIGN.md` that keeps screens on brand. |
| **Update my skills** | Gets the latest Frontier. |

How it behaves:

- **You run each step.** It recommends one step, says why in a sentence and gives you the command.
- **Nothing changes your files until you say go.** 👀 steps only look. ✏️ steps change files and say what first.
- **It keeps its place** in `tasks/plan.md`, so long jobs don't lose the thread.
- **It checks before it ticks.** It re-runs your tests after a build and never switches a test off to pass.

## Commands

Call any of these directly instead of going through `/start`. With the plugin, add the `frontier:` prefix, for example `/frontier:tdd`.

| Command | What it does |
|---|---|
| `/start` | Asks what you want and walks you through the route. |
| `/grill-me` | Questions your idea until every decision is made. |
| `/to-spec` | Writes the agreed plan as a spec in your issue tracker. |
| `/to-tickets` | Splits the spec into small tickets. |
| `/implement`, `/tdd` | Builds one ticket at a time; `/tdd` writes the failing test first. |
| `/code-review` | Reviews a change against the spec and your standards. |
| `/diagnosing-bugs` | Finds the real cause of a bug before fixing it. |
| `/improve-codebase-architecture` | Reports what's worth restructuring. |
| `/impeccable critique` / `polish` / `clarify` | Reviews a screen, fixes it, or rewrites its labels and errors. |
| `/impeccable shape` | Interviews you and writes a design brief before anything is drawn. |
| `/impeccable bolder` / `quieter` / `typeset` / `colorize` / `layout` | Pushes a design in one direction. One at a time. |
| `/impeccable document` / `extract` | Writes `DESIGN.md` from built screens; turns repeated UI into components. |
| `/copywriting`, `/copy-editing` | Writes new copy or tightens existing copy. |
| `/stop-slop` | Removes phrasing that sounds machine-written. |

### Design flow (optional)

1. `/impeccable shape`, with screenshots of 3–5 products whose look you like.
2. Build from the brief, starting at `/to-spec`.
3. `/impeccable critique`, then one steer (`bolder`, `quieter`, `typeset`, `colorize` or `layout`).
4. `/impeccable document` once real screens exist.

Using Claude Design? Save the look as a Design System artifact in Claude, and use Claude Code's design sync, where available, to keep it matched to your code. Don't add Anthropic's `frontend-design` skill alongside Impeccable; the two give conflicting advice.

## House rules

Applied to every skill. Your project's own `CLAUDE.md` wins on conflict.

- **Design:** no purple gradients, glows or floating shadows · no rows of three equal cards · a 4px spacing grid · one bold element per screen.
- **Copy:** no hype words ("seamless", "supercharge"…) · specifics over adjectives ("Exports in 2 seconds", not "Blazing fast").

Full text: [`rules/RULES.md`](rules/RULES.md).

## Update and remove

| | Update | Remove |
|---|---|---|
| **Plugin** | Claude app: **Customize → Plugins**. Claude Code: `/plugin` → **Marketplaces** → `bgordon01` → **Update** (or turn on auto-update). | Remove **frontier** in the same place. |
| **Install script** | Say "update my skills", or run `~/.frontier/update.sh`, then restart Claude Code. | Run `~/.frontier/uninstall.sh`. Delete `~/.frontier` too if you want the files gone. |

## Switching from claude-toolkit

- **Plugin:** remove **toolkit**, add **frontier** from the same marketplace. Commands now start with `/frontier:`.
- **Install script:** run `~/.claude-toolkit/update.sh` once. It moves everything to `~/.frontier`.
- **Cloud setup script:** the old URL still redirects; swap in the new one when convenient.

## Built on

| Author | Skills | Licence |
|---|---|---|
| [Matt Pocock](https://github.com/mattpocock/skills) | Planning, tickets, test-first building, review, bug diagnosis | MIT |
| [Paul Bakaus](https://github.com/pbakaus/impeccable) | Impeccable: design critique, polish and UX copy | Apache 2.0 |
| [Hardik Pandya](https://github.com/hardikpandya/stop-slop) | Stop-slop | MIT |
| [Corey Haines](https://github.com/coreyhaines31/marketingskills) | Copywriting and copy editing | MIT |

Maintainers: see [MAINTAINING.md](MAINTAINING.md) for how it's built, the brand assets and the landing page.

Frontier · MIT licence · by Brent Gordon
