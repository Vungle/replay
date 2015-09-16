#!/bin/bash
git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD) | grep "Dockerfile"
if [ $? -eq 0 ]
then 
  if $CIRCLE_BRANCH == "master"
  then
    echo "Building latest..."
    docker build -t vungle/replay .
  else
    echo "Building $CIRCLE_SHA1"
    docker build -t vungle/replay:$CIRCLE_SHA1 . 
  fi
else
  echo "skipping build" 
fi
