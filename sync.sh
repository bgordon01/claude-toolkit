#!/usr/bin/env bash
# Pulls the latest skills from every source in sources.conf into vendor/,
# re-applies overrides/, and stages the result for you to review.
# Nothing is committed or pushed — you decide after reading the diff.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENDOR="$REPO_DIR/vendor"
OVR="$REPO_DIR/overrides"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
shopt -s nullglob

SEEN="$TMP/seen"   # "skill<TAB>dir" lines, to catch name clashes (bash 3.2 safe)
: > "$SEEN"
for d in "$REPO_DIR"/skills/*/; do printf '%s\t%s\n' "$(basename "$d")" "this repo's skills/" >> "$SEEN"; done

mkdir -p "$VENDOR"
while read name repo paths; do   # no -r: allows "\" line continuation in sources.conf
  [[ -z "${name:-}" || "$name" == \#* ]] && continue
  echo "== $name  ($repo)"
  git clone -q --depth 1 "https://github.com/$repo.git" "$TMP/$name"
  sha="$(git -C "$TMP/$name" rev-parse HEAD)"

  out="$VENDOR/$name"
  rm -rf "$out"; mkdir -p "$out"
  count=0
  set -f; patterns=($paths); set +f   # split without expanding globs here
  for pattern in "${patterns[@]}"; do
    if [[ "$pattern" == agents=* ]]; then
      mkdir -p "$out/_agents"
      for f in "$TMP/$name"/${pattern#agents=}; do cp "$f" "$out/_agents/"; done
      echo "   $(ls "$out/_agents" | wc -l | tr -d ' ') agents"
      continue
    fi
    for src in "$TMP/$name"/$pattern; do
      [[ -f "$src/SKILL.md" ]] || continue
      src="$(cd "$src" && pwd)"
      skill="$(basename "$src")"
      clash="$(awk -F'\t' -v s="$skill" '$1==s{print $2}' "$SEEN")"
      if [[ -n "$clash" ]]; then
        echo "ERROR: skill '$skill' from $name clashes with $clash" >&2; exit 1
      fi
      printf '%s\t%s\n' "$skill" "$out/$skill" >> "$SEEN"
      cp -R "$src" "$out/$skill"
      rm -rf "$out/$skill/.git"
      count=$((count + 1))
    done
  done
  [[ $count -gt 0 ]] || { echo "ERROR: no skills matched for $name — check sources.conf" >&2; exit 1; }

  for f in LICENSE LICENSE.md LICENSE.txt NOTICE NOTICE.md; do
    if [[ -f "$TMP/$name/$f" ]]; then cp "$TMP/$name/$f" "$out/$f"; fi
  done
  printf 'repo: https://github.com/%s\ncommit: %s\n' "$repo" "$sha" > "$out/SOURCE"
  echo "   $count skills @ ${sha:0:7}"
done < "$REPO_DIR/sources.conf"

# Drop vendored sources no longer listed in sources.conf
for d in "$VENDOR"/*/; do
  n="$(basename "$d")"
  grep -Eq "^[[:space:]]*$n[[:space:]]" "$REPO_DIR/sources.conf" || { rm -rf "$d"; echo "== removed $n (not in sources.conf)"; }
done

# ---------- overrides ----------
skill_dir() { awk -F'\t' -v s="$1" '$1==s{print $2}' "$SEEN"; }

echo "== overrides"
# 1. frontmatter keys: overrides/frontmatter.conf
while read -r skill kv; do
  [[ -z "${skill:-}" || "$skill" == \#* ]] && continue
  dir="$(skill_dir "$skill")"
  [[ -n "$dir" ]] || { echo "ERROR: overrides/frontmatter.conf names unknown skill '$skill'" >&2; exit 1; }
  key="${kv%%:*}"
  awk -v key="$key" -v line="$kv" '
    NR==1 && $0=="---" { fm=1; print; next }
    fm && $0=="---"    { if (!done) print line; fm=0; print; next }
    fm && index($0, key":")==1 { print line; done=1; next }
    { print }' "$dir/SKILL.md" > "$TMP/skill.md"
  mv "$TMP/skill.md" "$dir/SKILL.md"
  echo "   $skill: $kv"
done < "$OVR/frontmatter.conf"

# 2. appended sections: overrides/<skill>.md
for f in "$OVR"/*.md; do
  skill="$(basename "$f" .md)"
  dir="$(skill_dir "$skill")"
  [[ -n "$dir" ]] || { echo "ERROR: overrides/$skill.md names unknown skill '$skill'" >&2; exit 1; }
  { echo; cat "$f"; } >> "$dir/SKILL.md"
  echo "   $skill: appended $(basename "$f")"
done

# ---------- plugin ----------
echo
"$REPO_DIR/build-plugin.sh"

# ---------- review ----------
echo
git -C "$REPO_DIR" add -A vendor plugin
if git -C "$REPO_DIR" diff --cached --quiet -- vendor plugin; then
  echo "No upstream changes."
  exit 0
fi

echo "Upstream changes staged:"
git -C "$REPO_DIR" diff --cached --stat -- vendor | tail -1

runnable="$(git -C "$REPO_DIR" diff --cached --name-only -- vendor \
  | grep -E '\.(sh|js|mjs|cjs|ts|py|rb|cmd|bat|ps1)$|/scripts/' || true)"
if [[ -n "$runnable" ]]; then
  echo
  echo "⚠  Runnable files changed — read these before committing:"
  echo "$runnable" | sed 's/^/   /'
fi

echo
echo "Review:  git diff --cached -- vendor"
echo "Accept:  git commit -m 'Sync upstream skills' && git push"
echo "Reject:  git restore --staged --worktree vendor"
