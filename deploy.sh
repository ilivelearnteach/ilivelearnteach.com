#!/bin/sh

set -x
# 可以修改成自己的博客名
printf "\033[0;32m ilivelearnteach.com Deploying updates to GitHub...\033[0m\n"
cd $(dirname "$0")

# Commit changes.
msg="rebuilding site $(date)"

# update the theme
git submodule update --remote
# remove old files
rm -rf public/*
# Build the project.
hugo

# Go To Public folder
cd public
# Add changes to git.
git add .
git commit -m "$msg"
# Push to blog repo and trigger building blog.
git push origin main

# push to source repo
cd ..
git add .
git commit -m "$msg"
git push origin main
