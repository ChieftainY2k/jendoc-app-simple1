#!/bin/bash

#########################################
# Wait for service to be available via socker connection
#
function waitForServiceConnection {

    HOST=$1
    PORT=$2

    echo -n "waiting for TCP connection to $HOST:$PORT "

    while ! nc -z -w 1 $HOST $PORT 2>/dev/null
    do
      echo -n .
      sleep 1
    done

    echo 'ok. connection established.'

}

#Ensure service containers are running
echo -n "Waiting for memcached service: "
waitForServiceConnection memcached 11211

#Ensure service containers are running
echo -n "Waiting for mysql service: "
waitForServiceConnection mysql 3306

#Run tests
echo -n "Running tests..."
vendor/bin/phpunit --bootstrap bootstrap.php tests

EXITCODE=$?
echo "Tests finished. Exit code is $EXITCODE"

exit $EXITCODE
