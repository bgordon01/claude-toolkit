#!/usr/bin/env bash
# Builds plugin/ — the "toolkit" plugin that the Claude app (Customize →
# Plugins) and Claude Code install from this repo's marketplace.
#
# Assembled from: skills/ (this repo), vendor/*/ (upstream skills with overrides
# applied), vendor/*/_agents/, and rules/RULES.md (as a house-rules skill).
# sync.sh runs this automatically; run it by hand after editing skills/ or rules/.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
OUT="$REPO_DIR/plugin"
shopt -s nullglob

rm -rf "$OUT"
mkdir -p "$OUT/.claude-plugin" "$OUT/skills" "$OUT/agents"

count=0
for d in "$REPO_DIR"/skills/*/ "$REPO_DIR"/vendor/*/*/; do
  d="${d%/}"; [[ -f "$d/SKILL.md" ]] || continue
  name="$(basename "$d")"
  cp -R "$d" "$OUT/skills/$name"
  # In app chats Claude picks skills itself, so invoke-only skills would be unreachable.
  sed -i.bak '/^disable-model-invocation:/d' "$OUT/skills/$name/SKILL.md" && rm -f "$OUT/skills/$name/SKILL.md.bak"
  count=$((count + 1))
done

# House rules as a skill: plugins can't add always-on CLAUDE.md instructions.
mkdir -p "$OUT/skills/house-rules"
{
  echo "---"
  echo "name: house-rules"
  echo "description: claude-toolkit's design and copy rules. Apply whenever building or changing any user interface, or writing any text a user will read (UI labels, pages, emails, docs, marketing copy). They override other design and copy skills where they conflict."
  echo "---"
  echo
  cat "$REPO_DIR/rules/RULES.md"
} > "$OUT/skills/house-rules/SKILL.md"
count=$((count + 1))

agents=0
for f in "$REPO_DIR"/vendor/*/_agents/*.md; do cp "$f" "$OUT/agents/"; agents=$((agents + 1)); done

# Licences travel with the skills they cover
mkdir -p "$OUT/licenses"
for src in "$REPO_DIR"/vendor/*/; do
  n="$(basename "$src")"
  for f in "$src"LICENSE* "$src"NOTICE*; do cp "$f" "$OUT/licenses/$n-$(basename "$f")"; done
done
cp "$REPO_DIR/LICENSE" "$OUT/licenses/claude-toolkit-LICENSE"

cat > "$OUT/.claude-plugin/plugin.json" <<EOF
{
  "name": "toolkit",
  "description": "Plan, build, design and write with Claude. Say 'start here' or type /start.",
  "author": { "name": "Brent Gordon" },
  "homepage": "https://github.com/bgordon01/frontier",
  "repository": "https://github.com/bgordon01/frontier",
  "license": "MIT"
}
EOF

echo "Built plugin/: $count skills, $agents agents"
