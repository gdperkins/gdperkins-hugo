#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"
msg="rebuilding site `date +\"%Y-%m-%dT%H:%M:%S %Z\"`"

# Build the project. 
hugo --theme=hyde

# Commit the hugo project first
git add .
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Go To Public folder
cd public

# Add changes to git.
git add -A

# Commit changes.
git commit -m "rebuilding site `date +\"%Y-%m-%dT%H:%M:%S %Z\"`"

# Push source and build repos.
git push origin master

# Come Back
cd ..