#!/bin/sh
docker_username="dalbodeule"
image_name="code-server"
version=$(date '+%Y-%m-%d')

docker build --no-cache -f ./${image_name}.dockerfile --tag ${docker_username}/${image_name}:${version} ./