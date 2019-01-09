#!/bin/bash

port=${1:-'4848'}

docker stop docker-tkw
docker rm docker-tkw

docker run --name docker-tkw -d -p $port:4848 docker-tkw
