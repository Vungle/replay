#!/bin/bash
if  git ls-files -m | grep -q "Dockerfile"; then
  docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_PASS
  docker push vungle/replay
  exit 1
fi
