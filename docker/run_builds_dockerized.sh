#!/bin/sh

#
# Run tests inside disposable container structure
#

BUILD_DIR=/tmp/build/

#Random namespace
NAMESPACE=builds`date +"%Y%m%d%H%M%S"``shuf -i 1000-9000 -n 1`

echo "[$NAMESPACE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "[$NAMESPACE] Building containers..."
docker-compose -p $NAMESPACE build builder
echo "[$NAMESPACE] Running containers with docker-compose (BUILD_DIR = $BUILD_DIR)..."
docker-compose -p $NAMESPACE run -e BUILD_DIR=$BUILD_DIR builder scripts/run_builds.sh
EXITCODE=$?

echo "[$NAMESPACE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "[$NAMESPACE] Cleaning up images..."
docker rmi -f $(docker images | grep $NAMESPACE | awk '{ print $3 }')

echo "[$NAMESPACE] Exit code is $EXITCODE"
exit $EXITCODE