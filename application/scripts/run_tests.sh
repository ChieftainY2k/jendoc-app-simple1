#!/bin/bash

# Install libraries
COMPOSER_CACHE_DIR=/tmp/composer-cache/ composer install

# Run test with phing tasks
vendor/bin/phing -f build/build.xml test
