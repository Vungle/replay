#!/bin/bash
if  git ls-files -m | grep -q "Dockerfile"; then
  docker build -t vungle/replay .
  exit 1
fi
