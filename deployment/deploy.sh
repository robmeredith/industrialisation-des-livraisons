#!/bin/bash

set -e
if [[ $TRAVIS_BRANCH == 'master' ]] ; 
then
    mv README.md index.md
    mv CONTRIBUTORS.md contributors.md
    mv LICENCE licence.md
    git init
    git config user.name "Hervé Beraud"
    git config user.email "herveberaud.pro@gmail.com"
    git add .
    git status
    git commit -m "[site][v0.3.0] automatic deployment"
    git push --force --quiet "https://${git_user}:${git_password}@${git_target}" master:gh-pages > /dev/null 2>&1
    echo "gh-pages updated"
else
    echo 'Invalid branch. You can only deploy from master.'
    exit 1
fi

