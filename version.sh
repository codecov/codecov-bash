#!/usr/bin/env bash

set -x

short_git=$(git rev-parse --short HEAD)
echo $short_git
date=`date +%Y%m%d`
_version="$date-$short_git"
branch="production"

change_file () {
  git merge master
  sed -i -e "s|.*VERSION=.*|VERSION=\"$_version\"|g" codecov
  rm codecov-e
}

checkout_branch () {
    git fetch
    git checkout $1
    git pull
}

commit_and_upload () {
  git add .
  git commit -m "Version $_version Release" 
  git remote rm origin 
  git remote add origin https://codecov:${GH_TOKEN}@github.com/codecov/codecov-bash.git
  git push origin production --quiet
}

create_all_branches()
{
    local build_head=$(git rev-parse HEAD)

    git config --replace-all remote.origin.fetch +refs/heads/*:refs/remotes/origin/*
    git fetch
    git fetch --tags

    git checkout -qf ${branch#origin/}

    git checkout ${build_head}
}
create_all_branches
checkout_branch "production"
change_file
commit_and_upload
