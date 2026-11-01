# design-discipline

A curated Claude Code setup: 14 skills from four upstream authors for planning, building, designing and writing, plus a strict design-and-copy rules layer. Installs globally, so every repo on your machine gets it, and stays in sync with upstream.

## Install (macOS / Linux)

```bash
git clone https://github.com/bgordon01/design-discipline.git ~/code/design-discipline
~/code/design-discipline/install.sh
```

Restart Claude Code. In each new project, run `/setup-matt-pocock-skills` once (tells the ticket skills where your issues live) and `/impeccable init` once (captures the project's design context).

## Stay in sync

```bash
~/code/design-discipline/update.sh
```

Pulls the latest repo and re-links: new skills appear, removed ones disappear.

## How to use it together

One feature, start to finish. The rules layer and Impeccable's design-check hook run in the background the whole time.

**0. Once per project**
```
/setup-matt-pocock-skills      issue tracker: GitHub, GitLab, Linear, Jira or local markdown
/impeccable init               the product's users, brand and design direction
```

**1. Think — before any code**
```
/grill-me add a CSV export to the reports page
```
Answer its questions until the plan holds. Then `/to-spec` writes it up.

**2. Plan**
```
/to-tickets
```
Splits the spec into small tickets that each ship end to end.

**3. Build — one ticket at a time**
```
/tdd T-1                       test-first, or /implement T-1 for straight build
```
For UI work, the hook flags design problems after each edit. The 4pt grid, palette and one-bold-element rules apply automatically.

**4. Design pass — any UI the ticket touched**
```
/impeccable critique reports page     see what's wrong, no edits
/impeccable polish reports page       fix it
```

**5. Copy pass — any words a user will read**
```
/impeccable clarify reports page      labels, buttons, errors, empty states
/copywriting                          new marketing or landing-page copy
/copy-editing                         tighten copy that already exists
/stop-slop                            final sweep for AI-sounding prose
```

**6. Review**
```
/code-review
```
Checks the change against your standards and the spec. When something breaks and the cause isn't obvious, use `/diagnosing-bugs`.

Then take the next ticket back to step 3.

## What's included

### Plan → build → review · [mattpocock/skills](https://github.com/mattpocock/skills) (MIT)

| Skill | Use it to |
|---|---|
| `/grill-me` | Get interrogated about a plan before any code is written |
| `/to-spec` | Turn the conversation into a spec |
| `/to-tickets` | Break a spec into tracer-bullet tickets |
| `/implement` | Build from the spec or tickets |
| `/tdd` | Build test-first |
| `/code-review` | Review changes against standards and the spec |
| `/diagnosing-bugs` | Work through hard bugs and regressions |

Support skills, called by the ones above: `grilling`, `setup-matt-pocock-skills`, `codebase-design`.

### Design · [pbakaus/impeccable](https://github.com/pbakaus/impeccable) (Apache-2.0)

| Piece | What it does |
|---|---|
| `/impeccable` | One skill, 24 commands: `critique`, `audit`, `polish`, `clarify`, `quieter`, `bolder`, `harden`, `init` and more |
| 4 subagents | finish-reviewer, documenter, asset-producer, manual-edit-applier |
| Design-check hook | Scans UI files after every edit and before Claude finishes; does nothing in repos without UI |

### Copy · [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop), [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) (MIT)

| Skill | Use it to |
|---|---|
| `/stop-slop` | Strip AI writing patterns from prose |
| `/copywriting` | Write conversion copy for pages |
| `/copy-editing` | Tighten existing copy |

### Rules layer · this repo

Always on, via `~/.claude/CLAUDE.md`. Wins over Impeccable's defaults where they differ.

- **Design:** no purple-to-blue gradients, neon borders or floating shadows · no equal 3-card rows · all spacing on a 4pt grid · exactly one bold element per view.
- **Copy:** banned: revolutionize, seamless, empower, elevate, unleash, robust, supercharge, next-gen, game-changer, "unlock your potential" · no throat-clearing · mechanism and number over adjectives · short strings fit their containers.

Full text: [`rules/RULES.md`](rules/RULES.md). A project's own `CLAUDE.md` overrides it.

## Change the set

Edit [`sources.conf`](sources.conf), then run `./sync.sh`. Each line names an upstream repo and the exact skill folders to take. `sync.sh` copies them into `vendor/<source>/` and records the upstream commit in `vendor/<source>/SOURCE`. If any skill name clashes across sources, it stops.

## How upstream sync works

A GitHub Action (`.github/workflows/sync-upstream.yml`) runs `sync.sh` every Monday. When an upstream skill changes, it opens a pull request. Merge it, and everyone gets the update on their next `update.sh`.

**One-time repo setting:** Settings → Actions → General → enable *Allow GitHub Actions to create and approve pull requests*.

## What install.sh changes

```
~/.claude/
├── CLAUDE.md                     ← one @import line, between markers
├── design-discipline-rules.md    → rules/RULES.md
├── skills/<14 skills>            → vendor/*/
├── agents/<4 agents>             → vendor/impeccable/_agents/
├── settings.json                 ← 3 Impeccable hooks merged in, tagged [design-discipline]
└── .design-discipline-installed  ← what we own, for clean updates
```

- Your own skills, agents and hooks are never overwritten. A same-name file is renamed `*.bak-<timestamp>`, and `settings.json` is backed up once before the first merge.
- Hooks need `python3`, which comes with Xcode Command Line Tools.
- Use `./install.sh --copy` for standalone copies instead of symlinks.

## Uninstall

```bash
~/code/design-discipline/uninstall.sh
```

Removes every skill, agent, hook and import it installed. Your own files and backups stay.

## Credits

Vendored skills are the work of Matt Pocock, Paul Bakaus, Hardik Pandya and Corey Haines. They are redistributed unmodified under their original licences, kept in each `vendor/<source>/` folder. This repo isn't affiliated with any of them.

## License

MIT for this repo's own files. Vendored skills keep their original licences.
