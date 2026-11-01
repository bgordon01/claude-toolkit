#!/usr/bin/env bash
# Installs design-discipline globally into ~/.claude so every repo gets it.
# Default: symlinks, so `git pull` in this repo updates every project instantly.
# Use --copy to copy files instead (e.g. if you'll delete this clone).
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
MODE="link"
[[ "${1:-}" == "--copy" ]] && MODE="copy"

MARK_START="<!-- design-discipline:start -->"
MARK_END="<!-- design-discipline:end -->"
RULES_TARGET="$CLAUDE_DIR/design-discipline-rules.md"
STAMP="$(date +%Y%m%d%H%M%S)"

place() { # place <source> <dest>
  local src="$1" dest="$2"
  # Already ours? Replace silently.
  if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]]; then rm "$dest"
  elif [[ -e "$dest" || -L "$dest" ]]; then
    mv "$dest" "$dest.bak-$STAMP"
    echo "  backed up existing $(basename "$dest") -> $(basename "$dest").bak-$STAMP"
  fi
  if [[ "$MODE" == "link" ]]; then ln -s "$src" "$dest"; else cp -R "$src" "$dest"; fi
}

echo "Installing design-discipline into $CLAUDE_DIR ($MODE mode)"
mkdir -p "$CLAUDE_DIR/commands" "$CLAUDE_DIR/skills"

echo "Commands:"
for f in "$REPO_DIR"/commands/*.md; do
  place "$f" "$CLAUDE_DIR/commands/$(basename "$f")"
  echo "  /$(basename "$f" .md)"
done

echo "Skills:"
for d in "$REPO_DIR"/skills/*/; do
  d="${d%/}"
  place "$d" "$CLAUDE_DIR/skills/$(basename "$d")"
  echo "  $(basename "$d")"
done

echo "Global rules:"
place "$REPO_DIR/rules/RULES.md" "$RULES_TARGET"
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
touch "$CLAUDE_MD"
if ! grep -qF "$MARK_START" "$CLAUDE_MD"; then
  {
    [[ -s "$CLAUDE_MD" ]] && echo
    echo "$MARK_START"
    echo "@design-discipline-rules.md"
    echo "$MARK_END"
  } >> "$CLAUDE_MD"
  echo "  imported into $CLAUDE_MD"
else
  echo "  already imported in $CLAUDE_MD"
fi

echo
echo "Done. Restart any open Claude Code sessions to pick up the changes."
