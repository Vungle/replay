#!/bin/bash
git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD) | grep "Dockerfile" 
if [ $? -eq 0 ]
then
  docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
  if $CIRCLE_BRANCH == "master"
  then 
    echo "Pushing to latest"
    docker push vungle/replay
  else
    echo "Pushing to tag $CIRCLE_SHA1"
    docker build -t vungle/replay:$CIRCLE_SHA1 .
    docker push vungle/replay:$CIRCLE_SHA1
  fi
else
  echo "skipping push"
fi
