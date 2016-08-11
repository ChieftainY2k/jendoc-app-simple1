#!/bin/sh

#
# Run tests inside disposable container structure
#

#Random namespace
NAMESPACE=test-`date +"%Y%m%d%H%M%S"`-`shuf -i 1000-9000 -n 1`

echo "[$NAMESPACE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "[$NAMESPACE] Building containers..."
docker-compose -p $NAMESPACE build tests
echo "[$NAMESPACE] Running containers with docker-compose..."
docker-compose -p $NAMESPACE run -e REPORTS_DIR="/tmp/test-reports/" tests scripts/run_tests.sh
EXITCODE=$?

echo "[$NAMESPACE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "[$NAMESPACE] Exit code is $EXITCODE"
exit $EXITCODE