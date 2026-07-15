#!/bin/bash
# Remove stale git locks left by scheduled task session
cd "$(dirname "$0")"
rm -f .git/index.lock .git/HEAD.lock .git/objects/maintenance.lock
# Verify commits are ready
echo "Commits to push:"
git log --oneline origin/main..HEAD
echo ""
echo "Pushing to origin/main..."
git push origin main && echo "Push successful!" && rm -f push_2026-07-14.sh push_2026-07-15.sh -- "$0"
