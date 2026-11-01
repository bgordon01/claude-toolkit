#!/usr/bin/env bash
# Frontier installer (macOS).
#
#   curl -fsSL https://raw.githubusercontent.com/bgordon01/frontier/main/install.sh | bash
#
# Downloads Frontier to ~/.frontier and links its skills, agents and
# house rules into ~/.claude. Safe to run again at any time. Installs no hooks:
# nothing runs automatically.
#
#   --copy   copy files instead of linking them (re-run after every update)
set -euo pipefail

REPO_URL="https://github.com/bgordon01/frontier.git"
FRONTIER_DIR="${FRONTIER_DIR:-${CLAUDE_TOOLKIT_DIR:-$HOME/.frontier}}"
OLD_DIR="$HOME/.claude-toolkit"   # where installs before the Frontier rename live

# Move an install made before the rename to the new folder and point it at the renamed repo.
migrate_dir() {
  if [[ -d "$OLD_DIR/.git" && ! -e "$FRONTIER_DIR" ]]; then
    echo "Moving $OLD_DIR to $FRONTIER_DIR (Frontier is the new name for claude-toolkit)"
    mv "$OLD_DIR" "$FRONTIER_DIR"
    git -C "$FRONTIER_DIR" remote set-url origin "$REPO_URL"
  fi
}

# ---------- bootstrap: run from curl, or from outside a copy of the repo ----------
SELF="${BASH_SOURCE[0]:-}"
if [[ -z "$SELF" || ! -f "$(dirname "$SELF")/sources.conf" ]]; then
  if ! git --version >/dev/null 2>&1; then
    echo "Frontier needs git, which comes with Apple's Command Line Tools."
    echo "Run this, follow the prompt, then paste the install command again:"
    echo "  xcode-select --install"
    exit 1
  fi
  migrate_dir
  if [[ -d "$FRONTIER_DIR/.git" ]]; then
    echo "Updating Frontier in $FRONTIER_DIR"
    git -C "$FRONTIER_DIR" pull --ff-only -q
  else
    echo "Downloading Frontier to $FRONTIER_DIR"
    git clone -q "$REPO_URL" "$FRONTIER_DIR"
  fi
  exec bash "$FRONTIER_DIR/install.sh" "$@"
fi

# Run from the old folder (an old update.sh or bookmark): move it, then continue from the new one.
if [[ "$(cd "$(dirname "$SELF")" && pwd)" == "$OLD_DIR" ]]; then
  migrate_dir
  [[ -f "$FRONTIER_DIR/install.sh" ]] && exec bash "$FRONTIER_DIR/install.sh" "$@"
fi

# ---------- install ----------
REPO_DIR="$(cd "$(dirname "$SELF")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
MANIFEST="$CLAUDE_DIR/.frontier-installed"
RULES_LINK="$CLAUDE_DIR/frontier-rules.md"
MARK_START="<!-- frontier:start -->"
MARK_END="<!-- frontier:end -->"
MODE="link"
[[ "${1:-}" == "--copy" ]] && MODE="copy"
STAMP="$(date +%Y%m%d%H%M%S)"
shopt -s nullglob

mkdir -p "$CLAUDE_DIR/skills" "$CLAUDE_DIR/agents"
touch "$MANIFEST"

# One-time cleanup of the old "design-discipline" names
OLD_MANIFEST="$CLAUDE_DIR/.design-discipline-installed"
if [[ -f "$OLD_MANIFEST" ]]; then
  cat "$OLD_MANIFEST" >> "$MANIFEST"   # treat old links as ours so they get replaced or removed
  rm -f "$OLD_MANIFEST" "$CLAUDE_DIR/design-discipline-rules.md"
fi
strip_block() { # strip_block <start-marker> <end-marker> <file>
  [[ -f "$3" ]] || return 0
  local tmp; tmp="$(mktemp)"
  awk -v s="$1" -v e="$2" '$0==s{skip=1} !skip{print} $0==e{skip=0}' "$3" > "$tmp" && mv "$tmp" "$3"
}
strip_block "<!-- design-discipline:start -->" "<!-- design-discipline:end -->" "$CLAUDE_DIR/CLAUDE.md"

# One-time cleanup of the old "claude-toolkit" names: old links are treated as ours,
# so anything not reinstalled below (like claude-toolkit-rules.md) gets removed.
OLD_MANIFEST="$CLAUDE_DIR/.claude-toolkit-installed"
if [[ -f "$OLD_MANIFEST" ]]; then
  cat "$OLD_MANIFEST" >> "$MANIFEST"
  rm -f "$OLD_MANIFEST"
fi
strip_block "<!-- claude-toolkit:start -->" "<!-- claude-toolkit:end -->" "$CLAUDE_DIR/CLAUDE.md"

owned() { grep -qxF "$1" "$MANIFEST"; }

place() { # place <source> <dest>
  local src="$1" dest="$2"
  if [[ -L "$dest" || -e "$dest" ]]; then
    if [[ -L "$dest" && "$(readlink "$dest")" == "$src" ]] || owned "$dest"; then
      rm -rf "$dest"
    else
      mv "$dest" "$dest.bak-$STAMP"
      echo "  Kept your existing $(basename "$dest") as $(basename "$dest").bak-$STAMP"
    fi
  fi
  if [[ "$MODE" == "link" ]]; then ln -s "$src" "$dest"; else cp -R "$src" "$dest"; fi
  echo "$dest" >> "$MANIFEST.new"
}

: > "$MANIFEST.new"
echo "Installing Frontier into $CLAUDE_DIR"

total=0
for group in "$REPO_DIR/skills" "$REPO_DIR"/vendor/*; do
  for d in "$group"/*/; do
    d="${d%/}"; [[ -f "$d/SKILL.md" ]] || continue
    place "$d" "$CLAUDE_DIR/skills/$(basename "$d")"
    total=$((total + 1))
  done
done
echo "  ✓ $total skills"

agents=0
for f in "$REPO_DIR"/vendor/*/_agents/*.md; do
  place "$f" "$CLAUDE_DIR/agents/$(basename "$f")"
  agents=$((agents + 1))
done
echo "  ✓ $agents helper agents"

place "$REPO_DIR/rules/RULES.md" "$RULES_LINK"
CLAUDE_MD="$CLAUDE_DIR/CLAUDE.md"; touch "$CLAUDE_MD"
if ! grep -qF "$MARK_START" "$CLAUDE_MD"; then
  { [[ -n "$(tail -n1 "$CLAUDE_MD")" ]] && echo; echo "$MARK_START"; echo "@frontier-rules.md"; echo "$MARK_END"; } >> "$CLAUDE_MD"
fi
echo "  ✓ house rules"

# Remove anything installed last time that's no longer in Frontier
while read -r old; do
  [[ -n "$old" ]] || continue
  grep -qxF "$old" "$MANIFEST.new" || { rm -rf "$old"; echo "  - removed $(basename "$old")"; }
done < "$MANIFEST"
sort -u "$MANIFEST.new" > "$MANIFEST"; rm -f "$MANIFEST.new"

echo
echo "Done. Restart Claude Code, then type /start-here"
