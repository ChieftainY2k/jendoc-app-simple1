#!/bin/bash

composer install

vendor/bin/phing -f build/build.xml test
