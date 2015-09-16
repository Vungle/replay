#!/bin/bash
if  git ls-files -m | grep -q "Dockerfile"; then
then 
  if [ -z "$1" ]
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
