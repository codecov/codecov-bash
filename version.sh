#!/usr/bin/env bash

set -x

short_git=$(git rev-parse --short HEAD)
echo $short_git
date=`date +%Y%m%d`
_version="$date-$short_git"


change_file () {
  sed -i -e "s|.*VERSION=.*|VERSION=\"$_version\"|g" codecov
  rm codecov-e
}

checkout_branch () {
    git fetch
    git checkout $1
    git pull
}

commit_and_upload () {
  git add codecov
  git commit -m "Version $_version Release" 
  git remote rm origin 
  git remote add origin https://codecov:${GH_TOKEN}@github.com/codecov/codecov-bash.git
  git push origin master --quiet
}

checkout_branch "production"
change_file
commit_and_upload