#!/bin/bash
# Pushes this pipeline snapshot to github.com/AlvinTubtub/video-creation-pipeline
# Mac: double-click in Finder, or run:  bash push.command
cd "$(dirname "$0")"
REPO_URL="https://github.com/AlvinTubtub/video-creation-pipeline.git"

if [ ! -d .git ]; then
  git init -b main
fi
if ! git config user.email >/dev/null 2>&1; then
  git config user.name "Alvin Tubtub"
  git config user.email "alvincj004@gmail.com"
fi
git add -A
git commit -m "KAPE video creation pipeline snapshot 2026-10-22" 2>/dev/null \
  || echo "Nothing new to commit — pushing what is already here."
if git remote get-url origin >/dev/null 2>&1; then
  git remote set-url origin "$REPO_URL"
else
  git remote add origin "$REPO_URL"
fi
git branch -M main
git push -u origin main
echo ""
echo "Done — check: https://github.com/AlvinTubtub/video-creation-pipeline"
read -r -p "Press Enter to close..." _
