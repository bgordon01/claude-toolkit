# Maintaining claude-toolkit

How the toolkit is built, how upstream changes come in, and how to change what's in it. Everything here runs only when you run it: there are no hooks, scheduled jobs or GitHub Actions.

## Layout

```
claude-toolkit/
├── install.sh          one-line installer; bootstraps ~/.claude-toolkit when piped from curl
├── update.sh           git pull + re-run install.sh, with a summary of changed skills
├── uninstall.sh        removes everything listed in the install manifest
├── sync.sh             pulls upstream skills into vendor/ and re-applies overrides/
├── sources.conf        which upstream repos and skill folders to vendor
├── rules/RULES.md      the house rules, in precise form, for Claude
├── skills/             this repo's own skills (start-here)
├── overrides/          local changes re-applied to vendored skills on every sync
└── vendor/<source>/    vendored skills, one folder per upstream, with LICENSE and SOURCE
```

## What's vendored

| Source | Skills | Licence |
|---|---|---|
| [mattpocock/skills](https://github.com/mattpocock/skills) | grill-me, to-spec, to-tickets, implement, tdd, code-review, diagnosing-bugs, improve-codebase-architecture; support: grilling, setup-matt-pocock-skills, codebase-design, domain-modeling | MIT |
| [pbakaus/impeccable](https://github.com/pbakaus/impeccable) | impeccable (24 commands), plus 4 subagents | Apache-2.0 |
| [hardikpandya/stop-slop](https://github.com/hardikpandya/stop-slop) | stop-slop | MIT |
| [coreyhaines31/marketingskills](https://github.com/coreyhaines31/marketingskills) | copywriting, copy-editing | MIT |

Support skills are called by other skills (`grill-me` calls `grilling`, `tdd` calls `codebase-design`, and so on), so they must stay installed even though you rarely use them directly.

Impeccable's automatic design-check hook is deliberately left out. Its detector script still runs when an `/impeccable` command needs it; on first use it downloads Impeccable's engine binary to `~/.impeccable/bin/`.

## What install.sh changes

```
~/.claude-toolkit/                      the downloaded repo (curl install)
~/.claude/
├── CLAUDE.md                           one @import line between claude-toolkit markers
├── claude-toolkit-rules.md             → rules/RULES.md
├── skills/<17 skills>                  → skills/ and vendor/*/
├── agents/<4 agents>                   → vendor/impeccable/_agents/
└── .claude-toolkit-installed           manifest of everything above, for clean updates
```

- Everything is symlinked, so `git pull` takes effect immediately. Use `install.sh --copy` for standalone copies, and re-run after every update.
- An existing skill or agent with the same name is renamed `*.bak-<timestamp>`, never overwritten.
- `settings.json` is never touched.
- On the first run after the rename from `design-discipline`, the old manifest, rules link and CLAUDE.md block are cleaned up automatically.
- Set `CLAUDE_TOOLKIT_DIR` to install the repo somewhere other than `~/.claude-toolkit`.

## Pulling upstream changes

Run this whenever you choose. Nothing pulls automatically.

```bash
cd ~/.claude-toolkit
./sync.sh
```

`sync.sh`:
1. Clones each source in `sources.conf` at its latest commit.
2. Copies the listed skill folders into `vendor/<source>/`, with the upstream LICENSE/NOTICE and a `SOURCE` file recording the commit.
3. Re-applies `overrides/`.
4. Stages the result. It never commits.
5. Lists any changed script files separately, so you can read those first.

Then decide:

```bash
git diff --cached -- vendor                              # review
git commit -m "Sync upstream skills" && git push         # accept
git restore --staged --worktree vendor                   # reject
```

After pushing, run `./update.sh` (or say "update my skills") on each Mac.

`sync.sh` stops with an error if two skills share a name, a path in `sources.conf` matches nothing, or an override names a skill that isn't vendored.

## Changing the set

Edit `sources.conf`. Each line is a source name, a GitHub `owner/repo`, then entries:

- a skill folder path, or a glob of them (`skills/engineering/*`); `.` means the repo root
- `agents=<glob>` for subagent `.md` files, installed to `~/.claude/agents/`

Lines can be continued with a trailing `\`. Run `./sync.sh` afterwards.

If you add a skill that calls another skill (look for "Call the Skill tool with …" in its `SKILL.md`), add that one too.

## Overrides: how the house rules beat upstream

Vendored files are replaced on every sync, so local changes live in `overrides/`:

- **`overrides/<skill>.md`** is appended to that skill's `SKILL.md` under a "Global rules override (claude-toolkit)" heading. Used for `impeccable`, `copywriting`, `copy-editing` and `stop-slop`.
- **`overrides/frontmatter.conf`** sets frontmatter keys. It makes skills invoke-only (`disable-model-invocation: true`), so they run only when typed and their descriptions stay out of Claude's context.

Auto-triggering stays on for `start-here`, `impeccable`, `stop-slop` and the four support skills. The support skills have to stay on because other skills call them through the Skill tool.

`start-here` runs invoke-only skills by reading their `SKILL.md` directly, so the flag doesn't block it.

Known issue: in some sessions, Claude Code won't load an invoke-only skill even when you type its command, and follows the file by hand instead ([anthropics/claude-code#26251](https://github.com/anthropics/claude-code/issues/26251)). The result is the same. To drop the flag for a skill, delete its line from `frontmatter.conf` and re-sync.

## The /start-here skill

`skills/start-here/SKILL.md` is this repo's own skill and isn't synced from anywhere. It routes five intents (build new, improve existing, fix a bug, write copy, update) to the right sequence of skills. It checks for first-time project setup (`docs/agents/issue-tracker.md` and `PRODUCT.md`), runs read-only steps straight away, and asks before any step that changes files. Edit it directly.

## Credits and licences

Vendored skills are the work of Matt Pocock, Paul Bakaus, Hardik Pandya and Corey Haines, redistributed under their original licences, which are kept in each `vendor/<source>/` folder. Local changes are applied by `overrides/` and marked in each modified `SKILL.md`. This repo isn't affiliated with any of them.

This repo's own files are MIT-licensed.
