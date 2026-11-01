#!/usr/bin/env bash
# Removes everything install.sh put in ~/.claude. Your .bak-* backups stay.
set -euo pipefail
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
MANIFEST="$CLAUDE_DIR/.design-discipline-installed"

if [[ -f "$MANIFEST" ]]; then
  while read -r p; do
    [[ -n "$p" && ( -e "$p" || -L "$p" ) ]] && rm -rf "$p" && echo "  removed $(basename "$p")"
  done < "$MANIFEST"
  rm -f "$MANIFEST"
fi

CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
if [[ -f "$CLAUDE_MD" ]]; then
  tmp="$(mktemp)"
  awk '/<!-- design-discipline:start -->/{skip=1} !skip{print} /<!-- design-discipline:end -->/{skip=0}' "$CLAUDE_MD" > "$tmp"
  mv "$tmp" "$CLAUDE_MD"
  echo "  removed rules import from CLAUDE.md"
fi
echo "Uninstalled."
