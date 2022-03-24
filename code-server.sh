#!/bin/sh
docker_username="dalbodeule"
image_name="code-server"
version=$(date '+%Y-%m-%d')
docker_gid=$(getent group docker | cut -d: -f3)

docker build --no-cache -f ./${image_name}.dockerfile --tag ${docker_username}/${image_name}:${version} --tag ${docker_username}/${image_name}:latest --build-arg DOCKER_GID=${docker_gid} ./
