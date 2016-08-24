#!/bin/sh

#
# Run tests inside disposable container structure
#

#test type
#TESTTYPE=$1

if [ -z "$TEST_TYPE" ]; then
    echo "Error: TEST_TYPE environment variable is not set"
    exit 1
fi

TESTERNAME=tester$TEST_TYPE

#Random namespace
NAMESPACE=tests`date +"%Y%m%d%H%M%S"``shuf -i 1000-9000 -n 1`

echo "[$NAMESPACE][$TEST_TYPE] Cleaning up containers..."
docker-compose -p $NAMESPACE stop
docker-compose -p $NAMESPACE rm -f

echo "[$NAMESPACE][$TEST_TYPE] Building containers..."
echo docker-compose -p $NAMESPACE build $TESTERNAME
docker-compose -p $NAMESPACE build $TESTERNAME
echo "[$NAMESPACE][$TEST_TYPE] Running containers with docker-compose..."

#docker-compose -p $NAMESPACE run -e COMPOSER_CACHE_DIR="/tmp/composer-cache/" app composer install
#docker-compose -p $NAMESPACE run -e REPORTS_DIR="/tmp/test-reports/" tester scripts/run_tests.sh

#docker-compose -p $NAMESPACE up -d app scripts/build_application.sh

#docker-compose -p $NAMESPACE up -d $TESTERNAME
#docker-compose -p $NAMESPACE exec $TESTERNAME scripts/build_tester.sh $TEST_TYPE
#docker-compose -p $NAMESPACE exec $TESTERNAME scripts/run_tester.sh $TEST_TYPE
echo docker-compose -p $NAMESPACE run -e TEST_TYPE="$TEST_TYPE" $TESTERNAME scripts/run_tester.sh
docker-compose -p $NAMESPACE run -e TEST_TYPE="$TEST_TYPE" $TESTERNAME scripts/run_tester.sh

EXITCODE=$?

echo "[$NAMESPACE][$TEST_TYPE] Stopping containers..."
docker-compose -p $NAMESPACE down

echo "[$NAMESPACE][$TEST_TYPE] Cleaning up images..."
docker rmi -f $(docker images | grep $NAMESPACE | awk '{ print $3 }')

echo "[$NAMESPACE][$TEST_TYPE] Exit code is $EXITCODE"
exit $EXITCODE