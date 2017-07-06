#!/bin/bash

backupDir="/tmp/ms_graveyard"
file="./config.ini"


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
  if [[ -d $directory ]]; then
    rm -fr "$backupDir/$directory"
    mv $directory $backupDir
  fi

  mkdir $directory
  cd $directory
  git clone --recursive $repo .
  git checkout develop
  git pull
  git submodule update --init --recursive
  docker-compose up -d
  cd ..
}


mkdir -p $backupDir

while IFS='' read -r line || [[ -n "$line" ]]; do
    processConfigFile "$line"
done < "$file"
