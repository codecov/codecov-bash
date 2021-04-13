#!/bin/bash

set -x

clear_branch () {
  # Clear changes
  git stash
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

clear_branch
update_branch
RELEASE_TAG=$(grep 'VERSION=\".*\"' codecov | cut -d'"' -f2)
tag_and_push
