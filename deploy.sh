#!/bin/bash

set -o errexit -o nounset

if [ "$TRAVIS_BRANCH" != "master" ]
then
  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
  exit 0
fi

rev=$(git rev-parse --short HEAD)

cd public

git init
git config user.name "Stefanos Chrs"
git config user.email "stefanoschrs@hotmail.com"

git remote add upstream "https://$GH_TOKEN@github.com/stefanoschrs/nfrcstr.git"
git fetch upstream
git reset upstream/gh-pages

#echo "rustbyexample.com" > CNAME

touch .

git add -A .
git commit -m "rebuild pages at ${rev}"
git push -q upstream HEAD:gh-pages