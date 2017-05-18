#!/bin/bash

docker-compose stop "$1"
docker-compose build "$1"
docker-compose up -d --no-recreate "$1"
