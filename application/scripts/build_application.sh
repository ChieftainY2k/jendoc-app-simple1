#!/bin/bash

#if [ -z "$BUILD_DIR" ]; then
#    echo "Error: BUILD_DIR is undefined."
#    exit 1
#fi

# Install libraries
COMPOSER_CACHE_DIR=/tmp/composer-cache/ composer install

# Run with phing tasks
vendor/bin/phing -f build/build.xml build:application

EXITCODE=$?
echo "Phing exit code is $EXITCODE"
exit $EXITCODE
