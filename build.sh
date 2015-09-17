#!/bin/bash
git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD) | grep "Dockerfile"
if [ $? -eq 0 ]
then 
  echo "Building ..."
  docker build -t vungle/replay .
else
  echo "skipping build" 
fi
