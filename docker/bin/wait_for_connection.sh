#!/bin/sh

# See:
# http://stackoverflow.com/questions/31746182/docker-compose-wait-for-container-x-before-starting-y

# See:
# https://github.com/aanand/docker-wait/blob/master/wait

set -e

host=$(env | grep WAIT_TCP_ADDR | cut -d = -f 2)
port=$(env | grep WAIT_TCP_PORT | cut -d = -f 2)

echo -n "waiting for TCP connection to $host:$port ..."

while ! nc -w 1 $host $port 2>/dev/null
do
  echo -n .
  sleep 1
done

echo 'ok. connection established.'
