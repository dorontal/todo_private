#!/bin/bash

# tags current repo based on VERSION file in git repository's root directory

# NOTES: 
# 1) this script takes zero arguments. It uses VERSION. for the tag comment
# 2) only increment version and CHANGELOG *after* running this but first,
#    it's best to do a `git_save`
# 3) Some useful commands:
#    List tags                     git tag
#    Delete local tag              git tag -d <tag_name>
#    Push local deletion to cloud  git push --delete origin <tag_name>
#    (see https://devconnected.com/how-to-delete-local-and-remote-tags-on-git/)

MY_DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

cd $MY_DIR/..

TAG="v`cat VERSION`"

git tag -a "$TAG" -m "git tag w/version: $TAG"

git push origin "$TAG"
