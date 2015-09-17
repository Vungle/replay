#!/bin/bash
git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD) | grep "Dockerfile"
if [ $? -eq 0 ]
then 
  sudo curl http://www.netlib.org/blacs/BLACS/DOWNLOAD/ERROR.LOG >> log/example.log
  curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > docker-compose && sudo chmod +x docker-compose
  ./docker-compose up -d && docker logs --tail="100" $(docker ps | grep "vungle/replay" | awk '{ print $1}') | grep "Mixed rs6k and anything else generates errors in SINGLE and SINGLE COMPLEX"
else
  echo "skipping build" 
fi
