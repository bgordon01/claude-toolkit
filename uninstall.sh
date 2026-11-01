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

if [[ -f "$CLAUDE_DIR/settings.json" ]] && command -v python3 >/dev/null 2>&1; then
  python3 "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/hooks.py" remove "$CLAUDE_DIR/settings.json" >/dev/null
  echo "  removed hooks from settings.json"
fi

CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
if [[ -f "$CLAUDE_MD" ]]; then
  tmp="$(mktemp)"
  awk '/<!-- design-discipline:start -->/{skip=1} !skip{print} /<!-- design-discipline:end -->/{skip=0}' "$CLAUDE_MD" > "$tmp"
  mv "$tmp" "$CLAUDE_MD"
  echo "  removed rules import from CLAUDE.md"
fi
echo "Uninstalled."
