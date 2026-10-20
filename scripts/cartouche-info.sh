#!/usr/bin/env bash
# Extracts cartouche values from the git working tree.
# For CI: GITHUB_REF_NAME should be set; for local: falls back to branch detection.
set -euo pipefail

REPO="ebpro/lecture-UTLN-M1_Info_Math-DEV-OOCOL"
GITHUB_URL="https://github.com/${REPO}"

# SHA (works in detached HEAD)
SHA_FULL=$(git rev-parse HEAD)
SHA_SHORT=$(git rev-parse --short HEAD)

# Branch (fails gracefully in detached HEAD)
if [ -n "${GITHUB_REF_NAME:-}" ]; then
  BRANCH="$GITHUB_REF_NAME"
else
  BRANCH=$(git branch --show-current 2>/dev/null || echo "")
  if [ -z "$BRANCH" ]; then
    # Try ref decoration
    BRANCH=$(git describe --all --always 2>/dev/null | sed 's|^heads/||' || echo "unknown")
  fi
fi

# Dates
COMMIT_DATE=$(git log -1 --format=%cd --date=short)
BUILD_DATE=$(date -u +"%Y-%m-%dT%H:%MZ")

# Tag (if HEAD is tagged)
TAG=$(git tag --points-at HEAD | head -1 || echo "")

echo "cartouche-repo: \"${REPO}\""
echo "cartouche-branch: \"${BRANCH}\""
echo "cartouche-sha: \"${SHA_SHORT}\""
echo "cartouche-sha-full: \"${SHA_FULL}\""
echo "cartouche-commit-date: \"${COMMIT_DATE}\""
echo "cartouche-build-date: \"${BUILD_DATE}\""
echo "cartouche-stable-tag: \"${TAG}\""
