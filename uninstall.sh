#!/usr/bin/env bash
# Removes everything claude-toolkit put in ~/.claude. Your own files and any
# .bak-* backups stay. The ~/.claude-toolkit folder itself is left in place;
# delete it afterwards if you want it gone.
set -euo pipefail
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
MANIFEST="$CLAUDE_DIR/.claude-toolkit-installed"

if [[ -f "$MANIFEST" ]]; then
  n=0
  while read -r p; do
    [[ -n "$p" && ( -e "$p" || -L "$p" ) ]] && rm -rf "$p" && n=$((n + 1))
  done < "$MANIFEST"
  rm -f "$MANIFEST"
  echo "  removed $n skills, agents and rules links"
fi

CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
if [[ -f "$CLAUDE_MD" ]]; then
  tmp="$(mktemp)"
  awk '$0=="<!-- claude-toolkit:start -->"{skip=1} !skip{print} $0=="<!-- claude-toolkit:end -->"{skip=0}' "$CLAUDE_MD" > "$tmp"
  mv "$tmp" "$CLAUDE_MD"
  echo "  removed house rules from CLAUDE.md"
fi
echo "Uninstalled. Restart Claude Code."
