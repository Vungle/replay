#!/bin/bash
git ls-files -m | grep "Dockerfile"
if [ $? -eq 0 ]
then 
  if $CIRCLE_BRANCH == "master"
  then
    echo "Building latest..."
    docker build -t vungle/replay .
    exit 1
  else
    echo "Building $CIRCLE_SHA1"
    docker build -t vungle/replay:$CIRCLE_SHA1 . 
    exit 1
  fi
else
  echo "skipping build" 
fi
