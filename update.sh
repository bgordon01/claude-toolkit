#!/usr/bin/env bash
# Gets the latest claude-toolkit and re-links everything into ~/.claude.
#   ~/.claude-toolkit/update.sh
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

before="$(git -C "$REPO_DIR" rev-parse HEAD)"
if ! git -C "$REPO_DIR" pull --ff-only -q; then
  echo
  echo "Couldn't update: files inside $REPO_DIR were changed on this Mac."
  echo "To discard those changes and update, run:"
  echo "  git -C $REPO_DIR reset --hard origin/main && $REPO_DIR/update.sh"
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
"$REPO_DIR/install.sh" "$@"
