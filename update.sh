#!/usr/bin/env bash
# Gets the latest claude-toolkit and re-links everything into ~/.claude.
#   ~/.claude-toolkit/update.sh
set -euo pipefail
# Wrapped in a function so bash reads it all before git pull replaces this file.
main() {
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [[ -n "$(git -C "$REPO_DIR" status --porcelain)" ]]; then
  echo "Couldn't update: files inside $REPO_DIR were changed on this Mac."
  echo "To discard those changes and update, run:"
  echo "  git -C $REPO_DIR reset --hard origin/main && $REPO_DIR/update.sh"
  exit 1
fi

before="$(git -C "$REPO_DIR" rev-parse HEAD)"
if ! git -C "$REPO_DIR" pull --ff-only -q >/dev/null; then
  echo "Couldn't download the update. Check your internet connection and try again."
  exit 1
fi
after="$(git -C "$REPO_DIR" rev-parse HEAD)"

if [[ "$before" == "$after" ]]; then
  echo "Already up to date."
else
  changed="$(git -C "$REPO_DIR" diff --name-only "$before" "$after" -- vendor skills \
    | awk -F/ '$1=="skills"{print $2} $1=="vendor" && NF>3 && $3!="_agents"{print $3}' | sort -u | tr '\n' ' ')"
  echo "Updated. Skills changed: ${changed:-none}"
fi
echo
exec "$REPO_DIR/install.sh" "$@"
}
main "$@"; exit
