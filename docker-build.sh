set -ex

docker images

docker build -v /tmp/docker-build:/tmp/docker-build -f Dockerfile.001-plr -t postgres-plr .
docker build -v /tmp/docker-build:/tmp/docker-build -f Dockerfile.002-madlib -t postgres-madlib .
docker build -v /tmp/docker-build:/tmp/docker-build -f Dockerfile.003-pg_bigm -t postgres-pgbigm .
docker build -v /tmp/docker-build:/tmp/docker-build -f Dockerfile.004-python -t postgres-python .
docker build -v /tmp/docker-build:/tmp/docker-build -f Dockerfile.005-mecab -t postgres-mecab .

docker tag postgres-mecab postgres4analytics

docker images
