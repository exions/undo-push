#!/bin/sh -eux

cd "${GITHUB_WORKSPACE}"

git branch ${GITHUB_REF}
git config --global user.name "github-actions[bot]"
git config --global user.email "github-actions[bot]@users.noreply.github.com"
git reset --hard HEAD~1
git push --force
