#!/bin/bash

#if [ -z "$REPORTS_DIR" ]; then
#    echo "Error: REPORTS_DIR is undefined."
#    exit 1
#fi
#

if [ -z "$TEST_TYPE" ]; then
    echo "Error: TEST_TYPE environment variable is not set"
    exit 1
fi

# Install libraries
COMPOSER_CACHE_DIR=/tmp/composer-cache/ composer install

# Run test with phing tasks
vendor/bin/phing -f build/build.xml test:$TEST_TYPE

EXITCODE=$?
echo "Phing exit code is $EXITCODE"
exit $EXITCODE

