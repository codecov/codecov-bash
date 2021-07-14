#!/bin/bash

set -x -e

clear_branch () {
  # Clear changes
  git stash
}

update_branch () {
  # Checkout master
  git checkout master
  # Update master
  git pull
}

tag_and_push () {
  # Test is tag exists
  if git rev-parse "refs/tags/${RELEASE_TAG}" >/dev/null 2>&1; then
    echo "Version ${RELEASE_TAG} already exists. Update the release before deploying"
    exit 1
  fi
  # Tag the version change
  git tag "$RELEASE_TAG"
  # Push tag
  git push origin "$RELEASE_TAG"
}

clear_branch
update_branch
RELEASE_TAG=$(grep 'VERSION=\".*\"' codecov | cut -d'"' -f2)
tag_and_push
