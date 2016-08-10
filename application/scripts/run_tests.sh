#!/bin/bash

# Install libraries
composer install

# Run test with phing tasks
vendor/bin/phing -f build/build.xml test
