#!/usr/bin/bash

COMMIT_MESSAGE=$1

git pull;
git add .;
git commit -am "$COMMIT_MESSAGE" -q;
git push;
git checkout main;
git merge shayan;
git push;
git checkout shayan;