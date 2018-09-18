#!/bin/bash

# Bootstraps Elasticsearch and run the containers

ES_DATA_DIR="${PWD}/elasticsearch/data"

if [ ! -d $ES_DATA_DIR ]
then
    echo "Creating the Elasticsearch data directory ($ES_DATA_DIR).."
    mkdir -p $ES_DATA_DIR && chmod a+w $ES_DATA_DIR
fi

docker-compose up -d
