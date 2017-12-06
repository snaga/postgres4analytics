#!/bin/sh

set -e

if [ -z $1 ]; then
  echo "Usage: $0 <DIRECTORY>"
  exit 1
fi
if [ ! -d $1 ]; then
  echo "Usage: $0 <DIRECTORY>"
  exit 1
fi

cd $PGDATA

if [ -f $1/pgdata.tar.gz ]; then
    rm -rf *
    echo "Restoring $1/pgdata.tar.gz..."
    tar zxf $1/pgdata.tar.gz
    chown -R postgres:postgres .
fi

set +e

su -c postgres postgres

set -e

if [ -d $1 ]; then
    echo "Taking a backup of $PGDATA..."
    rm -f $1/pgdata.tar.gz
    tar zcf $1/pgdata.tar.gz .
fi

