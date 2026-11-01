#!/usr/bin/env bash
# claude-toolkit installer (macOS).
#
#   curl -fsSL https://raw.githubusercontent.com/bgordon01/claude-toolkit/main/install.sh | bash
#
# Downloads the toolkit to ~/.claude-toolkit and links its skills, agents and
# house rules into ~/.claude. Safe to run again at any time. Installs no hooks:
# nothing runs automatically.
#
#   --copy   copy files instead of linking them (re-run after every update)
set -euo pipefail

REPO_URL="https://github.com/bgordon01/claude-toolkit.git"
TOOLKIT_DIR="${CLAUDE_TOOLKIT_DIR:-$HOME/.claude-toolkit}"

# ---------- bootstrap: run from curl, or from outside a copy of the repo ----------
SELF="${BASH_SOURCE[0]:-}"
if [[ -z "$SELF" || ! -f "$(dirname "$SELF")/sources.conf" ]]; then
  if ! git --version >/dev/null 2>&1; then
    echo "claude-toolkit needs git, which comes with Apple's Command Line Tools."
    echo "Run this, follow the prompt, then paste the install command again:"
    echo "  xcode-select --install"
    exit 1
  fi
  if [[ -d "$TOOLKIT_DIR/.git" ]]; then
    echo "Updating claude-toolkit in $TOOLKIT_DIR"
    git -C "$TOOLKIT_DIR" pull --ff-only -q
  else
    echo "Downloading claude-toolkit to $TOOLKIT_DIR"
    git clone -q "$REPO_URL" "$TOOLKIT_DIR"
  fi
  exec bash "$TOOLKIT_DIR/install.sh" "$@"
fi

# ---------- install ----------
REPO_DIR="$(cd "$(dirname "$SELF")" && pwd)"
CLAUDE_DIR="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
MANIFEST="$CLAUDE_DIR/.claude-toolkit-installed"
RULES_LINK="$CLAUDE_DIR/claude-toolkit-rules.md"
MARK_START="<!-- claude-toolkit:start -->"
MARK_END="<!-- claude-toolkit:end -->"
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
echo "Installing claude-toolkit into $CLAUDE_DIR"

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
  { [[ -n "$(tail -n1 "$CLAUDE_MD")" ]] && echo; echo "$MARK_START"; echo "@claude-toolkit-rules.md"; echo "$MARK_END"; } >> "$CLAUDE_MD"
fi
echo "  ✓ house rules"

# Remove anything installed last time that's no longer in the toolkit
while read -r old; do
  [[ -n "$old" ]] || continue
  grep -qxF "$old" "$MANIFEST.new" || { rm -rf "$old"; echo "  - removed $(basename "$old")"; }
done < "$MANIFEST"
sort -u "$MANIFEST.new" > "$MANIFEST"; rm -f "$MANIFEST.new"

echo
echo "Done. Restart Claude Code, then type /start"
