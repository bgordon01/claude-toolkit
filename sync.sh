#!/usr/bin/env bash
# Pulls the latest skills from every source in sources.conf into vendor/.
# Records the upstream commit in vendor/<name>/SOURCE and copies licences.
# Run locally, or let .github/workflows/sync-upstream.yml run it weekly.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
VENDOR="$REPO_DIR/vendor"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT
shopt -s nullglob

SEEN="$TMP/seen"   # "skill<TAB>source" lines, to catch name clashes (bash 3.2 safe)
: > "$SEEN"
for d in "$REPO_DIR"/skills/*/; do printf '%s\tthis repo\n' "$(basename "$d")" >> "$SEEN"; done

mkdir -p "$VENDOR"
while read -r name repo paths; do
  [[ -z "${name:-}" || "$name" == \#* ]] && continue
  echo "== $name  ($repo)"
  git clone -q --depth 1 "https://github.com/$repo.git" "$TMP/$name"
  sha="$(git -C "$TMP/$name" rev-parse HEAD)"

  out="$VENDOR/$name"
  rm -rf "$out"; mkdir -p "$out"
  count=0
  set -f; patterns=($paths); set +f   # split without expanding globs here
  for pattern in "${patterns[@]}"; do
    for src in "$TMP/$name"/$pattern; do
      [[ -f "$src/SKILL.md" ]] || continue
      skill="$(basename "$src")"
      clash="$(awk -F'\t' -v s="$skill" '$1==s{print $2}' "$SEEN")"
      if [[ -n "$clash" ]]; then
        echo "ERROR: skill '$skill' from $name clashes with $clash" >&2; exit 1
      fi
      printf '%s\t%s\n' "$skill" "$name" >> "$SEEN"
      cp -R "$src" "$out/$skill"
      count=$((count + 1))
    done
  done
  [[ $count -gt 0 ]] || { echo "ERROR: no skills matched for $name — check sources.conf" >&2; exit 1; }

  for f in LICENSE LICENSE.md LICENSE.txt NOTICE NOTICE.md; do
    [[ -f "$TMP/$name/$f" ]] && cp "$TMP/$name/$f" "$out/$f"
  done
  printf 'repo: https://github.com/%s\ncommit: %s\npaths: %s\n' "$repo" "$sha" "$paths" > "$out/SOURCE"
  echo "   $count skills @ ${sha:0:7}"
done < "$REPO_DIR/sources.conf"

# Drop vendored sources no longer listed in sources.conf
for d in "$VENDOR"/*/; do
  n="$(basename "$d")"
  grep -Eq "^[[:space:]]*$n[[:space:]]" "$REPO_DIR/sources.conf" || { rm -rf "$d"; echo "== removed $n (not in sources.conf)"; }
done

echo
if git -C "$REPO_DIR" rev-parse --git-dir >/dev/null 2>&1; then
  git -C "$REPO_DIR" add -A vendor
  if git -C "$REPO_DIR" diff --cached --quiet -- vendor; then
    echo "No upstream changes."
  else
    echo "Upstream changes staged:"
    git -C "$REPO_DIR" diff --cached --stat -- vendor | tail -1
    echo "Review, then commit and push to publish to everyone."
  fi
fi
