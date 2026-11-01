#!/bin/bash
set -euo pipefail

# Only run in Claude Code cloud sessions
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-.}"

# Install the toolkit from this checkout into ~/.claude.
# Idempotent; the install fills ~/.claude (not a git-ignored dir here), so it runs every time.
bash ./install.sh
