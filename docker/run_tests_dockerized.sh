#!/bin/sh

#
# Run tests inside disposable container structure
#

#Random namespace
NAMESPACE=tests`date +"%Y%m%d%H%M%S"``shuf -i 1000-9000 -n 1`

echo "[$NAMESPACE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "[$NAMESPACE] Building containers..."
docker-compose -p $NAMESPACE build tester
echo "[$NAMESPACE] Running containers with docker-compose..."
docker-compose -p $NAMESPACE run -e COMPOSER_CACHE_DIR="/tmp/composer-cache/" app composer install
docker-compose -p $NAMESPACE run -e REPORTS_DIR="/tmp/test-reports/" tester scripts/run_tests.sh
EXITCODE=$?

echo "[$NAMESPACE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "[$NAMESPACE] Cleaning up images..."
docker rmi -f $(docker images | grep $NAMESPACE | awk '{ print $3 }')

echo "[$NAMESPACE] Exit code is $EXITCODE"
exit $EXITCODE