# Building PL/R
set -ex

curl -O https://codeload.github.com/postgres-plr/plr/zip/master
unzip master
cd plr-master
ls -l

env USE_PGXS=1 make
env USE_PGXS=1 make install

find /usr/pgsql-10 | grep plr | xargs tar zcvf /tmp/plr.tar.gz
