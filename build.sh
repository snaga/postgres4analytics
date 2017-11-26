#docker build -v /tmp/docker-build:/tmp/docker-build -f Dockerfile.postgres -t postgres .
#docker build -v /tmp/docker-build:/tmp/docker-build -f Dockerfile.madlib-build -t madlib-build .
docker rmi madlib
docker build -v /tmp/docker-build:/tmp/docker-build -f Dockerfile.madlib -t madlib .
docker images
