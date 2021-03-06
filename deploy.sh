#!/bin/bash
GIT_REPO_URL=$(git config --get remote.origin.url)

mkdir .deploy
cp -R ./app-files/* .deploy
cd .deploy
git init .
git remote add github $GIT_REPO_URL
git checkout -b gh-pages
git add .
git commit -am "deploy"
git push github gh-pages --force
cd ..
rm -rf .deploy