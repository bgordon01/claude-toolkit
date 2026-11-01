# design-discipline

Global Claude Code rules and commands for building UI without default-AI styling or filler copy. Install once; every repo on your machine picks it up.

## Install (macOS / Linux)

```bash
git clone https://github.com/bgordon01/design-discipline.git ~/code/design-discipline
cd ~/code/design-discipline
./install.sh
```

Restart Claude Code. That's it.

The installer symlinks everything into `~/.claude`, so updating is one command:

```bash
cd ~/code/design-discipline && git pull
```

Prefer standalone copies? Run `./install.sh --copy` (re-run after each pull).

## What gets installed

```
~/.claude/
├── CLAUDE.md                     ← one import line added between markers
├── design-discipline-rules.md    → rules/RULES.md
├── commands/
│   ├── grill-me.md  to-tickets.md  implement.md
│   └── polish.md  critique.md  clarify.md  stop-slop.md
└── skills/
    ├── design-rules/SKILL.md
    └── copy-rules/SKILL.md
```

Existing files with the same names are backed up as `*.bak-<timestamp>`, never overwritten. Your existing `~/.claude/CLAUDE.md` content is untouched.

## Commands

| Command | Does |
|---|---|
| `/grill-me <feature>` | Asks 3–5 hard questions before any code is written |
| `/to-tickets` | Writes atomic tickets to `TICKETS.md` |
| `/implement <T-n>` | Builds one ticket, with tests |
| `/polish [path]` | Fixes UI against the design rules |
| `/critique [path]` | Lists design violations by file and line; no edits |
| `/clarify [path]` | Tightens labels, buttons, errors and empty states |
| `/stop-slop [path]` | Removes filler and banned words from copy |

## The rules

**Design** — no purple-to-blue gradients, neon borders or floating shadows · no equal 3-card rows · all spacing on a 4pt grid · exactly one bold element per view.

**Copy** — banned: revolutionize, seamless, empower, elevate, unleash, robust, supercharge, next-gen, game-changer, "unlock your potential" · no throat-clearing · mechanism and number over adjectives · short strings fit their containers.

Full text: [`rules/RULES.md`](rules/RULES.md). The skills in `skills/` load automatically when Claude Code works on UI or copy.

A repo's own `CLAUDE.md` wins where it conflicts with these global rules.

## Uninstall

```bash
./uninstall.sh
```

Removes the commands, skills, rules file and the import block. Backups stay.

## Credits

Workflow commands inspired by Matt Pocock's engineering skills; design vocabulary inspired by Paul Bakaus's Impeccable. Not affiliated with either.

## License

MIT
