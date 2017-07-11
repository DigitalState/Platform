#!/bin/bash

targetDir=${1:-"/var/containers"}
file="./config/repositories.ini"
sfMicroservices=("identities", "authentication", "services", "cases", "assets", "records", "topics", "tasks", "interactions")

function processConfigFile {
  IFS='='; msConf=($1); unset IFS;

  local directory="${msConf[0]}"
  local repo="${msConf[1]}"

  if [[ $directory != ";"* ]]; then
    updateMicroservice $directory $repo
  fi
}

function updateMicroservice {
  local directory=${1}
  local repo=${2}
  echo "Microservice name: $directory, and repo: $repo"

  cd "$targetDir/$directory"

  if [[ ${sfMicroservices[*]} =~ $directory ]]; then
    echo "$directory is a Symfony Microservice"
    local containerName="${directory}_php_1"

    docker exec $containerName rm -fr vendor
    docker exec $containerName composer install
	docker exec $containerName chmod -R 777 var
    docker exec $containerName bin/console doctrine:database:drop --force
    docker exec $containerName bin/console doctrine:database:create
    docker exec $containerName bin/console doctrine:migrations:migrate -q
    docker exec $containerName bin/console doctrine:fixtures:load -q
  fi
}

while IFS='' read -r line || [[ -n "$line" ]]; do
    processConfigFile "$line"
done < "$file"
