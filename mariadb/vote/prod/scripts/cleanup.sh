#!/bin/bash

# Once compose support launch on the bridge network, this command can be used
# eval "$(docker-machine env --swarm swarm-0)"

export DOCKER_HOST=tcp://"$(docker-machine ip swarm-0):3376"
export DOCKER_TLS_VERIFY=1
export DOCKER_CERT_PATH="$HOME/.docker/machine/machines/swarm-0"

docker-compose down
docker-compose -f dev/docker-compose.yml down
docker-compose -f dev/schema.yml down
docker-compose -f prod/galera/docker-compose.yml down
docker-compose -f prod/galera/schema.yml down
docker-compose -f pord/spider/docker-compose.yml down
docker-compose -f pord/spider/shema.yml down
