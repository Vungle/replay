#!/bin/bash
if git ls-files -m | grep "Dockerfile" 
then
  docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
  if [ -z "$1" ]
  then 
    echo "Pushing to latest"
    docker push vungle/replay
    exit 1
  else
    echo "Pushing to tag $CIRCLE_SHA1"
    docker push vungle/replay:$CIRCLE_SHA1
    exit 1
  fi
else
  echo "skipping push"
fi
