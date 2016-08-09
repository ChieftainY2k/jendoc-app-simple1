#!/bin/sh

#
# Run local application
#

#Random namespace
NAMESPACE=application

docker-compose -p $NAMESPACE up -d app
