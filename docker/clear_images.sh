#!/bin/bash

#./clear_containers.sh

#echo "Removing all images..."
#docker rmi $(docker images -q)

echo "Removing old images..."
docker run --name custodian -ti -v /var/run/docker.sock:/var/run/docker.sock yelp/docker-custodian dcgc --max-container-age 1day --max-image-age 1day

echo "Removing custodian container..."
docker rm custodian