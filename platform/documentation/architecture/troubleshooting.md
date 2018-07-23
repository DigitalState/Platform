# Troubleshooting

The troubleshooting section helps you debug and investigate potential issues with the Platform during or after deployment.

## Table of Contents

- [Ansible](#ansible)
- [Docker](#docker)
- [Symfony](#symfony)

## Ansible

### Tests

Running functional tests:

```
cd /etc/ansible/env/lab
ansible-playbook app/test/run.yml
```

### Cache

Clearing all caches, including cache from each microservices:

```
cd /etc/ansible/env/lab
ansible-playbook app/cache/clear.yml
```

Warming up all caches, including cache from each microservices:

```
cd /etc/ansible/env/lab
ansible-playbook app/cache/warmup.yml
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
