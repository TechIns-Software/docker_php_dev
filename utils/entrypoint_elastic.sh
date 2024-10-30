#!/bin/bash

ls -l /usr/share/elasticsearch
mkdir -p /usr/share/elasticsearch/data
chown -R 1000:1000 /usr/share/elasticsearch/data

su -m elasticsearch /usr/local/bin/docker-entrypoint.sh "$@"
