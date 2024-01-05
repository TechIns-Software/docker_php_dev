#!/usr/bin/env bash

docker build --build-arg="COMPOSER_VERSION=latest" \
 --build-arg="XDEBUG_VERSION=latest" \
  --build-arg="PHP_VERSION=8.2" \
  -f Dockerfile .
