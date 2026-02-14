#!/bin/zsh
set -euo pipefail

TITLE="${1:-chore: daily improvement}"
BODY="${2:-Daily incremental improvement with CI checks.}"
BRANCH="auto/$(date +%Y%m%d-%H%M%S)"

git checkout -b "$BRANCH"

# Optional repo-specific checks
if [ -f "$(pwd)/.terraform-version" ] || ls *.tf >/dev/null 2>&1 || [ -d "modules" ]; then
  terraform fmt -recursive || true
  tflint --recursive || true
fi

git add .
git commit -m "$TITLE" || { echo "Nothing to commit"; exit 0; }
git push -u origin "$BRANCH"
gh pr create --title "$TITLE" --body "$BODY" --base main --head "$BRANCH"
