#!/usr/bin/env bash

ORIG_HEAD="$(git name-rev --name-only HEAD)"

hugo

git show-ref refs/heads/github-pages && git branch -D github-pages
git checkout --orphan github-pages
git rm -r --cached .
mv docs/* .
rmdir docs
git commit -am "Build doc"
git push
git checkout "$ORIG_HEAD"
