#!/bin/bash
git fetch --all

if [[ $GIT_POST_COMMIT_HOOK_RUNNING ]]; then
  exit 0
fi
export GIT_POST_COMMIT_HOOK_RUNNING=true

PROJECT_HOME=$(git rev-parse --show-toplevel)

echo "Zipping figuras"
(cd latex/figuras && zip -u "figuras.zip" *.eps *.pdf)

echo "Adding figuras.zip"
git add latex/figuras/figuras.zip

echo "Ammending commit"
git commit --amend --no-edit --no-verify