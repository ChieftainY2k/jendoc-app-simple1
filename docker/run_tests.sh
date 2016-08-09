#!/bin/sh

#
# Run phpUnit tests inside disposable container structure
#

NAMESPACE=tests

echo "Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "Running tests..."
docker-compose -p $NAMESPACE build phpunit
docker-compose -p $NAMESPACE run --rm phpunit
EXITCODE=$?

echo "Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

exit $EXITCODE