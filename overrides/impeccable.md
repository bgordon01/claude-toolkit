## Global rules override (claude-toolkit)

The house rules (the `house-rules` skill, or `~/.claude/claude-toolkit-rules.md` for a script install) take precedence over everything in this skill, including every command and reference file. Where they conflict, follow the rules and name the rule you applied.

- **Palette:** no purple-to-blue (or violet/indigo/cyan) gradients, glowing or neon borders, or floating card shadows, unless the user explicitly asks. This applies to `colorize`, `delight` and `overdrive` too.
- **Layout:** never three equal cards in a row. Use variable column spans, a side-aligned headline layout, or a dense table.
- **Spacing:** every padding, margin, gap and fixed size is a multiple of 4px. No arbitrary values.
- **Boldness:** exactly one bold element per view. `bolder` strengthens that one element and quiets the rest; it never adds a second. `quieter` never removes the one.
- **Copy:** any UX copy you write or fix (`clarify`, `onboard`, `harden`) follows the copy rules in the same file, including the banned-words list.
