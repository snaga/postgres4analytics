set -ex

#cp CMakeLists.txt.diff /tmp
cp SQLCommon.m4.diff /tmp

cd /tmp
curl -O https://codeload.github.com/apache/madlib/zip/master
unzip master
cd madlib-master

#pushd src
#patch -p0 < /tmp/CMakeLists.txt.diff
#popd

./configure
cd build
make
make install

cd /usr/local/madlib/Versions/1.13-dev/ports/postgres/10/madpack
patch -p0 < /tmp/SQLCommon.m4.diff

tar zcvf /tmp/madlib.tar.gz /usr/local/madlib

