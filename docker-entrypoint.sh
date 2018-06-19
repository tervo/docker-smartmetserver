#!/bin/bash
set -e

if ! whoami &> /dev/null; then
  if [ -w /etc/passwd ]; then
    echo "${USER_NAME:-default}:x:$(id -u):0:${USER_NAME:-default} user:${HOME}:/sbin/nologin" >> /etc/passwd
  fi
fi

if [ "$1" = 'smartmetd' ]; then
    id
    whoami
    mkdir -p /cores
    echo '/cores/core.%h.%e.%t' > /proc/sys/kernel/core_pattern
    ulimit -c unlimited

    #systemctl start redis
    redis-server &
    #/usr/bin/fmi/radon2smartmet /etc/grid-tools-conf/radon-to-smartmet.cfg 0 &
    /usr/bin/fmi/filesys2smartmet /etc/grid-tools-conf/filesys-to-smartmet.cfg 0 &
    exec /usr/sbin/smartmetd
fi

exec "$@"
