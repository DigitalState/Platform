# Troubleshooting

## Table of Contents

- [Ansible](#ansible)
- [Docker](#docker)
- [Symfony](#symfony)

## Ansible

Running functional tests:

```
cd /etc/ansible/env/lab
ansible-playbook app/test/run.yml
```

## Docker

### Containers

Listing all Docker containers:

```
docker ps -a
```

Viewing logs for a given Docker container:

```
cd app/authentication
docker-compose logs php
```

## Symfony

### Cache

Clearing the Symfony cache for a given microservice:

```
cd app/authentication
docker-compose exec php php bin/console cache:clear
```

Warming up the Symfony cache for a given microservice:

```
cd app/authentication
docker-compose exec php php bin/console cache:warmup
```

### Logs

Viewing the Symfony logs for a given microservice:

```
cd app/authentication
tail -f var/logs/dev.log
```

### Routing

Viewing all defined routes for a given microservice:

```
cd app/authentication
docker-compose exec php php bin/console debug:router
```
