#!/bin/sh

#
# Run tests inside disposable container structure
#

#Random namespace
NAMESPACE=test-`date +"%Y%m%d%k%M%S"`-`shuf -i 1000-9000 -n 1`

echo "[$NAMESPACE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "[$NAMESPACE] Running tests..."
docker-compose -p $NAMESPACE build tests
#docker-compose -p $NAMESPACE run --rm cli composer install
#docker-compose -p $NAMESPACE run --rm cli vendor/bin/phing -f build/build.xml test
#docker-compose -p $NAMESPACE run --rm cli scripts/run_tests.sh
docker-compose -p $NAMESPACE run tests scripts/run_tests.sh
EXITCODE=$?

echo "[$NAMESPACE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "[$NAMESPACE] Exit code is $EXITCODE"
exit $EXITCODE