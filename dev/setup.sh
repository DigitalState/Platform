#!/bin/bash

targetDir=${1:-"/var/containers"}
backupDir="/tmp/ms_graveyard"
file="./config/repositories.ini"

function processConfigFile {
  IFS='='; msConf=($1); unset IFS;

  local directory="${msConf[0]}"
  local repo="${msConf[1]}"

  if [[ $directory != ";"* ]]; then
    setupMicroservice $directory $repo
  fi
}

function setupMicroservice {
  local directory=${1}
  local repo=${2}
  echo "Microservice name: $directory, and repo: $repo"

  # Backup the Microservice directory if it exists
  if [[ -d $targetDir/$directory ]]; then
    echo "Backing up directory $targetDir/$directory"
    rm -fr "$backupDir/$directory"
    mv "$targetDir/$directory" $backupDir
  fi

  mkdir -p "$targetDir/$directory"
  cd "$targetDir/$directory"

  git clone --recursive $repo .
  git checkout develop
  git pull
  git submodule update --init --recursive
  docker-compose down
  docker-compose up -d
}


mkdir -p $backupDir

while IFS='' read -r line || [[ -n "$line" ]]; do
    processConfigFile "$line"
done < "$file"
