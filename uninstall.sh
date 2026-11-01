#!/usr/bin/env bash
# Removes everything Frontier put in ~/.claude. Your own files and any
# .bak-* backups stay. The ~/.frontier folder itself is left in place;
# delete it afterwards if you want it gone.
set -euo pipefail
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
n=0
# Current manifest, plus the one from before the Frontier rename if it's still there.
for MANIFEST in "$CLAUDE_DIR/.frontier-installed" "$CLAUDE_DIR/.claude-toolkit-installed"; do
  [[ -f "$MANIFEST" ]] || continue
  while read -r p; do
    [[ -n "$p" && ( -e "$p" || -L "$p" ) ]] && rm -rf "$p" && n=$((n + 1))
  done < "$MANIFEST"
  rm -f "$MANIFEST"
done
[[ $n -gt 0 ]] && echo "  removed $n skills, agents and rules links"

CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"
if [[ -f "$CLAUDE_MD" ]]; then
  tmp="$(mktemp)"
  awk '$0=="<!-- frontier:start -->"||$0=="<!-- claude-toolkit:start -->"{skip=1} !skip{print} $0=="<!-- frontier:end -->"||$0=="<!-- claude-toolkit:end -->"{skip=0}' "$CLAUDE_MD" > "$tmp"
  mv "$tmp" "$CLAUDE_MD"
  echo "  removed house rules from CLAUDE.md"
fi
echo "Uninstalled. Restart Claude Code."
