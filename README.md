# design-discipline

My personal Claude Code setup for macOS: 14 skills from four upstream authors for planning, building, designing and writing, plus a design-and-copy rules layer that overrides them. Installs globally into `~/.claude`, so every repo gets it. Nothing runs automatically: no hooks, no scheduled jobs.

## Install

```bash
git clone https://github.com/bgordon01/design-discipline.git ~/code/design-discipline
~/code/design-discipline/install.sh
```

Restart Claude Code.

## How to use it together

One feature, start to finish. The rules layer applies throughout without being asked.

**0. Once per project**
```
/setup-matt-pocock-skills      issue tracker: GitHub, GitLab, Linear, Jira or local markdown
/impeccable init               the product's users, brand and design direction
```

**1. Think, before any code**
```
/grill-me add a CSV export to the reports page
```
Answer its questions until the plan holds. Then `/to-spec` writes it up.

**2. Plan**
```
/to-tickets
```
Splits the spec into small tickets that each ship end to end.

**3. Build, one ticket at a time**
```
/tdd T-1                       test-first, or /implement T-1 for a straight build
```
The 4pt grid, palette and one-bold-element rules apply to any UI written here.

**4. Design pass, on any UI the ticket touched**
```
/impeccable critique reports page     see what's wrong, no edits
/impeccable polish reports page       fix it
```

**5. Copy pass, on any words a user will read**
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

### Plan, build, review · [mattpocock/skills](https://github.com/mattpocock/skills) (MIT)

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

Impeccable's automatic design-check hook is deliberately left out. Its detector still runs when you call an `/impeccable` command that uses it.

### Copy · [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop), [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) (MIT)

| Skill | Use it to |
|---|---|
| `/stop-slop` | Strip AI writing patterns from prose |
| `/copywriting` | Write conversion copy for pages |
| `/copy-editing` | Tighten existing copy |

## The rules layer

The rules apply in every repo through one import line in `~/.claude/CLAUDE.md`.

- **Design:** no purple-to-blue gradients, neon borders or floating shadows · no equal 3-card rows · all spacing on a 4pt grid · exactly one bold element per view.
- **Copy:** banned: revolutionize, seamless, empower, elevate, unleash, robust, supercharge, next-gen, game-changer, "unlock your potential" · no throat-clearing · mechanism and number over adjectives · short strings fit their containers.

Full text: [`rules/RULES.md`](rules/RULES.md). A project's own `CLAUDE.md` overrides it.

### How the rules win over upstream skills

Vendored skills can't be edited directly, because every sync overwrites them. Changes live in [`overrides/`](overrides/) instead, and `sync.sh` re-applies them after each pull:

- **`overrides/<skill>.md`** is appended to that skill's `SKILL.md`. This is how Impeccable, `copywriting`, `copy-editing` and `stop-slop` learn your rules. For example, `bolder` strengthens your one bold element instead of adding a second.
- **`overrides/frontmatter.conf`** sets frontmatter keys. It makes 9 skills invoke-only (`disable-model-invocation: true`): they run only when you type their command, and their descriptions stay out of Claude's context. `impeccable` and `stop-slop` can still trigger on their own. So can the three support skills, because other skills call them.

## Keep in sync

**Update this Mac from the repo:**
```bash
~/code/design-discipline/update.sh
```
Pulls the repo and re-links skills: new skills appear, removed ones disappear.

**Pull upstream changes into the repo**, whenever you choose:
```bash
cd ~/code/design-discipline
./sync.sh
```
`sync.sh` clones each upstream at its latest commit, copies the chosen skills into `vendor/`, re-applies `overrides/`, and stages the result. It never commits. It lists any changed scripts separately so you read those first. Then:

```bash
git diff --cached -- vendor                              # review
git commit -m "Sync upstream skills" && git push         # accept
git restore --staged --worktree vendor                   # or reject
```

Each `vendor/<source>/SOURCE` records the upstream commit you accepted.

**Change the set:** edit the paths in [`sources.conf`](sources.conf) and run `./sync.sh`. If two skills share a name, or an override names a skill that isn't vendored, it stops.

## What install.sh changes

```
~/.claude/
├── CLAUDE.md                     ← one @import line, between markers
├── design-discipline-rules.md    → rules/RULES.md
├── skills/<14 skills>            → vendor/*/
├── agents/<4 agents>             → vendor/impeccable/_agents/
└── .design-discipline-installed  ← what it owns, for clean updates
```

- Everything is symlinked, so a pull takes effect immediately. Use `./install.sh --copy` for standalone copies.
- An existing skill or agent with the same name is renamed `*.bak-<timestamp>`, never overwritten.
- `settings.json` is never touched.

## Uninstall

```bash
~/code/design-discipline/uninstall.sh
```

Removes every skill, agent and import it installed. Your own files and backups stay.

## Credits

Vendored skills are the work of Matt Pocock, Paul Bakaus, Hardik Pandya and Corey Haines, used under their original licences, which are kept in each `vendor/<source>/` folder. Local changes are applied by `overrides/` and marked in each modified `SKILL.md` with a "Global rules override (design-discipline)" heading. This repo isn't affiliated with any of them.

## License

MIT for this repo's own files. Vendored skills keep their original licences.
