#!/bin/bash

set -x

change_bash_file () {
  sed -i -e "s|.*VERSION=.*|VERSION=\"$RELEASE_TAG\"|g" codecov
  rm codecov-e || :
}

change_env_file () {
  sed -i -e "s|.*VERSION=.*|VERSION=\"$RELEASE_TAG\"|g" env
  rm env-e || :
}

update_branch () {
  # Checkout maater
  git checkout master
  # Update master
  git pull
}

tag_and_push () {
  # Tag the version change
  git tag "$RELEASE_TAG"
  # Push tag
  git push origin "$RELEASE_TAG"
}

clear_branch () {
  # Clear changes
  git stash
}

clear_branch
update_branch
short_git=$(git rev-parse --short HEAD)
date=$(date +%Y%m%d)
RELEASE_TAG="$date-$short_git"
change_bash_file
change_env_file
tag_and_push
