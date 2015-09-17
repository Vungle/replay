#!/bin/bash
git diff-tree --no-commit-id --name-only -r $(git rev-parse HEAD) | grep "Dockerfile"
if [ $? -eq 0 ]
then 
  sudo curl http://www.netlib.org/blacs/BLACS/DOWNLOAD/ERROR.LOG >> log/example.log
  curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > docker-compose && sudo chmod +x docker-compose
  ./docker-compose up && ./docker-compose logs | grep "Error bounds in tester too tight."
else
  echo "skipping build" 
fi
