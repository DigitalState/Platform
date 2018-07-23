# Troubleshooting

The troubleshooting section helps you debug and investigate potential issues with the platform or application, during and after deployment.

## Table of Contents

- [Platform](#platform)
- [Application](#application)
- [Microservice](#microservice)

## Platform

The platform represents the local Docker container running Ansible for orchestration.

### Container

Entering the container in console mode:

```
docker exec -it platform /bin/sh
```

## Application

The application represents the collection of Docker containers of each microservices.

### Tests Suite

Running the complete tests suite of the application:

```
cd /etc/ansible/env/lab
ansible-playbook app/test/run.yml
```

> Internally, this command runs each microservices tests suite.

### Cache

Clearing all application caches:

```
cd /etc/ansible/env/lab
ansible-playbook app/cache/clear.yml
```

> Internally, this command clears each microservices caches.

Warming up all application caches:

```
cd /etc/ansible/env/lab
ansible-playbook app/cache/warmup.yml
```

> Internally, this command warms up each microservices caches.

### Containers

Listing all Docker containers of the application:

```
docker ps -a
```

## Microservice

A microservice represents a collection of Docker containers for a particular subject.

Also, the troubleshooting commands below are more directly against the microservice and doesn't go through the Ansible abstraction.

### Cache

Clearing the cache for a given Symfony-based microservice:

```
cd app/authentication
docker-compose exec php php bin/console cache:clear
```

Warming up the cache for a given Symfony-based microservice:

```
cd app/authentication
docker-compose exec php php bin/console cache:warmup
```

### Logs

Viewing the logs for a given Symfony-based microservice:

```
cd app/authentication
tail -f var/logs/dev.log
```

### Routing

Viewing all defined routes for a given Symfony-based microservice:

```
cd app/authentication
docker-compose exec php php bin/console debug:router
```
