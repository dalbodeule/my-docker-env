#!/bin/sh
docker_username = "dalbodeule"
image_name = "ubuntu-cuda-11-with-node-latest"
version = $(date '+%Y-%m-%d %H:%M:%S')

docker build --tag ${docker_username}/${image_name}:${version}