#!/usr/bin/env bash
# Removes design-discipline from ~/.claude. Leaves any .bak-* backups in place.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"

remove() { [[ -e "$1" || -L "$1" ]] && rm -rf "$1" && echo "  removed $1"; return 0; }

for f in "$REPO_DIR"/commands/*.md; do remove "$CLAUDE_DIR/commands/$(basename "$f")"; done
for d in "$REPO_DIR"/skills/*/; do d="${d%/}"; remove "$CLAUDE_DIR/skills/$(basename "$d")"; done
remove "$CLAUDE_DIR/design-discipline-rules.md"

CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
if [[ -f "$CLAUDE_MD" ]]; then
  tmp="$(mktemp)"
  awk '/<!-- design-discipline:start -->/{skip=1} !skip{print} /<!-- design-discipline:end -->/{skip=0}' "$CLAUDE_MD" > "$tmp"
  mv "$tmp" "$CLAUDE_MD"
  echo "  removed import from $CLAUDE_MD"
fi
echo "Uninstalled."
