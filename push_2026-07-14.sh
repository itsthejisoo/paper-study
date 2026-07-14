#!/bin/bash
# Remove stale git locks left by scheduled task session
cd "$(dirname "$0")"
rm -f .git/index.lock .git/HEAD.lock .git/objects/maintenance.lock
# Verify the commit is ready
echo "Last commit:"
git log --oneline -1
echo ""
echo "Pushing to origin/main..."
git push origin main && echo "Push successful!" && rm -- "$0"
