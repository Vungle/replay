#!/bin/bash
sudo curl http://www.netlib.org/blacs/BLACS/DOWNLOAD/ERROR.LOG >> log/example.log
curl -L https://github.com/docker/compose/releases/download/1.3.1/docker-compose-`uname -s`-`uname -m` > docker-compose && sudo chmod +x docker-compose
./docker-compose up -d && sleep 5 && docker logs --tail="all" $(docker ps | grep "vungle/replay" | awk '{ print $1}') 2>&1 | grep -q "All problems fixed"
