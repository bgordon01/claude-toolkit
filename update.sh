#!/usr/bin/env bash
# Pulls the latest version of this repo and re-links skills into ~/.claude.
set -euo pipefail
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
git -C "$REPO_DIR" pull --ff-only
"$REPO_DIR/install.sh" "$@"
