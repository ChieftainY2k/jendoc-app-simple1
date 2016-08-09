#!/bin/sh

#
# Run local jenkins
#

NAMESPACE=jenkins

docker-compose -p $NAMESPACE up -d jenkins
