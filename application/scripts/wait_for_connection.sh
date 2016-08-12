#!/bin/bash

#########################################
# Wait for service to be available via socker connection
#
function waitForServiceConnection {

    HOST=$1
    PORT=$2

    echo -n "Waiting for TCP connection to $HOST:$PORT "

    while ! nc -z -w 1 $HOST $PORT 2>/dev/null
    do
      echo -n .
      sleep 1
    done

    echo 'ok. connection established.'

}

#Ensure service containers are running
#echo -n "Waiting for mysql service: "
waitForServiceConnection $CONN_ADDR $CONN_PORT
