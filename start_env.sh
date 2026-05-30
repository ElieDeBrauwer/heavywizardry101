#!/bin/sh

docker run --rm -it \
	-e CONTAINER_UID=$(id -u) \
	-e CONTAINER_GID=$(id -g) \
   	-e CONTAINER_USER=$(id -un) \
   	-v "$PWD/code:/opt/code" \
   	--name hw101 hw101 /bin/bash 
