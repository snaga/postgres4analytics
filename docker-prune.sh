#!/bin/sh

docker images | grep none | awk '{ print $3 }' | xargs docker rmi -f
docker ps -af status=exited | awk '{ print $1 }'| xargs docker rm
docker volume ls -qf dangling=true | xargs docker volume rm

