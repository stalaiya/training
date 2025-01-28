#!/bin/bash

# Check if the number of arguments is exactly 1
if [ "$#" -ne 1 ]; then
    echo "Error: This script requires exactly one argument (the commit message)."
    exit 1
fi

COMMIT_MESSAGE=$1

git pull;
git add .;
git commit -am "$COMMIT_MESSAGE" -q;
git push;
git checkout main;
git merge shayan;
git push;
git checkout shayan;
