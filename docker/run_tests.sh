#!/bin/sh

#
# Run phpUnit tests inside disposable container structure
#

NAMESPACE=test-`date +"%Y%m%d%k%M%S"`-`shuf -i 1000-9000 -n 1`
#NAMESPACE=test

echo "[$NAMESPACE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "[$NAMESPACE] Running tests..."
docker-compose -p $NAMESPACE build phpunit
docker-compose -p $NAMESPACE run --rm phpunit
EXITCODE=$?

echo "[$NAMESPACE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

exit $EXITCODE