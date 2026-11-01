# design-discipline

One install for Claude Code that brings in Matt Pocock's engineering skills, Paul Bakaus's Impeccable design skill, and a strict design-and-copy rules layer. Skills install globally, so every repo on your machine gets them.

## Install (macOS / Linux)

```bash
git clone https://github.com/bgordon01/design-discipline.git ~/code/design-discipline
~/code/design-discipline/install.sh
```

Restart Claude Code, then run `/impeccable init` once in each project.

## Stay in sync

```bash
~/code/design-discipline/update.sh
```

This pulls the latest repo and re-links: new skills appear, skills removed upstream disappear. Because skills are symlinked, edits land the moment you pull.

## What's included

| Source | Skills | Licence |
|---|---|---|
| [mattpocock/skills](https://github.com/mattpocock/skills) | 31 — `/grill-me`, `/to-tickets`, `/implement`, `/tdd`, `/code-review`, `/diagnosing-bugs`, `/to-spec`, `/prototype`, `/pr` and more | MIT |
| [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | `/impeccable` — `critique`, `audit`, `polish`, `clarify`, `quieter`, `bolder`, `harden` and more | Apache-2.0 |
| This repo | `design-rules`, `copy-rules` skills, `/stop-slop` command, global rules | MIT |

The full list of vendored skills is in [`vendor/`](vendor/). Each source folder has a `SOURCE` file naming the exact upstream commit, plus the original licence.

## The rules layer

These apply on top of Impeccable and win where they differ.

**Design** — no purple-to-blue gradients, neon borders or floating shadows · no equal 3-card rows · all spacing on a 4pt grid · exactly one bold element per view.

**Copy** — banned: revolutionize, seamless, empower, elevate, unleash, robust, supercharge, next-gen, game-changer, "unlock your potential" · no throat-clearing · mechanism and number over adjectives · short strings fit their containers.

Full text: [`rules/RULES.md`](rules/RULES.md). A project's own `CLAUDE.md` overrides it.

## What install.sh changes

```
~/.claude/
├── CLAUDE.md                        ← one @import line, between markers
├── design-discipline-rules.md       → rules/RULES.md
├── commands/stop-slop.md            → commands/stop-slop.md
├── skills/<34 skills>               → skills/ and vendor/*/
└── .design-discipline-installed     ← list of what we own, for clean updates
```

A skill or command you already had with the same name is renamed to `*.bak-<timestamp>`, never overwritten. Use `./install.sh --copy` for standalone copies instead of symlinks.

## How upstream sync works

`sources.conf` lists each upstream repo and which skill folders to take. `./sync.sh` clones each one, copies those folders into `vendor/<source>/`, and records the commit.

A GitHub Action (`.github/workflows/sync-upstream.yml`) runs the sync every Monday and opens a pull request when anything changed. Merge it, and everyone gets the update on their next `update.sh`.

To add another skill source, add a line to `sources.conf` and run `./sync.sh`.

**One-time repo setting:** Settings → Actions → General → enable *Allow GitHub Actions to create and approve pull requests*.

## Uninstall

```bash
~/code/design-discipline/uninstall.sh
```

Removes every skill, command and import it installed. Your backups and other files stay.

## Credits

Vendored skills belong to their authors: Matt Pocock (MIT) and Paul Bakaus (Apache-2.0), redistributed unmodified under those licences. This repo isn't affiliated with either.

## License

MIT for this repo's own files. Vendored skills keep their original licences in `vendor/<source>/`.
