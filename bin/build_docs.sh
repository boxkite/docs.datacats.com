#!/bin/bash

set -e

cd "`dirname $0`/../../datacats"
rm -r build/sphinx || true
python setup.py build_sphinx

cd ../docs.datacats.com
git reset --hard
git fetch origin gh-pages
git merge --ff-only origin/gh-pages
git rm `git ls-files`
git checkout HEAD CNAME
git checkout HEAD .nojekyll
git checkout HEAD bin
cp -r ../datacats/build/sphinx/html/. .
git add `find ../datacats/build/sphinx/html | cut -c 31-`
git status
