FROM centos:7
MAINTAINER Satoshi Nagayasu <snaga@uptime.jp>

# PostgreSQL support
RUN set -ex && \
  rpm -ivh https://download.postgresql.org/pub/repos/yum/10/redhat/rhel-7-x86_64/pgdg-centos10-10-2.noarch.rpm && \
  yum install -y postgresql10 postgresql10-contrib postgresql10-devel postgresql10-libs postgresql10-plpython postgresql10-server

ADD postgresql.conf /tmp
ADD pg_hba.conf /tmp

RUN set -ex && \
  if [ ! -f /var/lib/pgsql/10/data/PG_VERSION ]; then \
    echo postgres > /tmp/pgpass; \
    su -c "/usr/pgsql-10/bin/initdb --pwfile=/tmp/pgpass -D /var/lib/pgsql/10/data --no-locale -E utf-8" postgres; \
    rm /tmp/pgpass; \
    cp /tmp/postgresql.conf /tmp/pg_hba.conf /var/lib/pgsql/10/data; \
    chown postgres:postgres /var/lib/pgsql/10/data/*.conf; \
  fi

ENV PATH /usr/pgsql-10/bin:$PATH
ENV PGDATA /var/lib/pgsql/10/data

EXPOSE 5432
CMD [ "su", "-c", "postgres", "postgres" ]

