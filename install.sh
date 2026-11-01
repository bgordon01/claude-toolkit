#!/usr/bin/env bash
# Installs every vendored skill and agent globally for Claude Code (~/.claude),
# plus the global rules import. Installs no hooks: nothing runs automatically.
#
# Symlinks by default, so ./update.sh (git pull + re-run) keeps a laptop in sync.
# Re-running is safe: new skills get linked, skills removed upstream get unlinked.
#
#   --copy   copy files instead of symlinking (re-run after every update)
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
MANIFEST="$CLAUDE_DIR/.design-discipline-installed"
MODE="link"
[[ "${1:-}" == "--copy" ]] && MODE="copy"
STAMP="$(date +%Y%m%d%H%M%S)"
MARK_START="<!-- design-discipline:start -->"
MARK_END="<!-- design-discipline:end -->"
shopt -s nullglob

mkdir -p "$CLAUDE_DIR/skills" "$CLAUDE_DIR/commands" "$CLAUDE_DIR/agents"
touch "$MANIFEST"

owned() { grep -qxF "$1" "$MANIFEST"; }

place() { # place <source> <dest>
  local src="$1" dest="$2"
  if [[ -L "$dest" || -e "$dest" ]]; then
    if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]] || owned "$dest"; then
      rm -rf "$dest"
    else
      mv "$dest" "$dest.bak-$STAMP"
      echo "  backed up your existing $(basename "$dest") -> $(basename "$dest").bak-$STAMP"
    fi
  fi
  if [[ "$MODE" == "link" ]]; then ln -s "$src" "$dest"; else cp -R "$src" "$dest"; fi
  echo "$dest" >> "$MANIFEST.new"
}

: > "$MANIFEST.new"
echo "Installing into $CLAUDE_DIR ($MODE mode)"

for group in "$REPO_DIR"/vendor/*; do
  label="$(basename "$group")"
  names=()
  for d in "$group"/*/; do
    d="${d%/}"; [[ -f "$d/SKILL.md" ]] || continue
    place "$d" "$CLAUDE_DIR/skills/$(basename "$d")"
    names+=("$(basename "$d")")
  done
  [[ ${#names[@]} -gt 0 ]] && echo "  ✓ $label (${#names[@]}): ${names[*]}"
done

for f in "$REPO_DIR"/vendor/*/_agents/*.md; do
  place "$f" "$CLAUDE_DIR/agents/$(basename "$f")"
  echo "  ✓ agent: $(basename "$f" .md)"
done

for f in "$REPO_DIR"/commands/*.md; do
  place "$f" "$CLAUDE_DIR/commands/$(basename "$f")"
  echo "  ✓ command: /$(basename "$f" .md)"
done

place "$REPO_DIR/rules/RULES.md" "$CLAUDE_DIR/design-discipline-rules.md"
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"; touch "$CLAUDE_MD"
if ! grep -qF "$MARK_START" "$CLAUDE_MD"; then
  { [[ -s "$CLAUDE_MD" ]] && echo; echo "$MARK_START"; echo "@design-discipline-rules.md"; echo "$MARK_END"; } >> "$CLAUDE_MD"
fi
echo "  ✓ global rules imported in CLAUDE.md"

# Unlink anything we installed last time that no longer exists in the repo
while read -r old; do
  [[ -n "$old" ]] || continue
  grep -qxF "$old" "$MANIFEST.new" || { rm -rf "$old"; echo "  - removed $(basename "$old") (gone upstream)"; }
done < "$MANIFEST"
mv "$MANIFEST.new" "$MANIFEST"

echo
echo "Done. Restart Claude Code. Keep in sync with: $REPO_DIR/update.sh"
