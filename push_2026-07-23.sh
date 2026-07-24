#!/bin/bash
# Remove stale git locks left by scheduled task session
cd "$(dirname "$0")"
rm -f .git/index.lock .git/HEAD.lock .git/objects/maintenance.lock
# Stage and commit
git add -A
git diff --cached --quiet || git -c user.email="jisoo000528@naver.com" -c user.name="itsthejisoo" commit -m "papers: add 2026-07-21~23 (27 new, 1 updated)"
echo "Commits to push:"
git log --oneline origin/main..HEAD
echo ""
echo "Pushing to origin/main..."
git push origin main && echo "Push successful!" && rm -f push_2026-07-21.sh push_2026-07-22.sh -- "$0"
