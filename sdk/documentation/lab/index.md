# Lab Environment

```
cd /etc/ansible/env/lab
```

## Setup system

```
ansible-playbook system/setup.yml
```

## Download repositories

```
ansible-playbook repository/download.yml
```

## Override repositories

```
ansible-playbook repository/override.yml
```

## Download jwt keys

```
ansible-playbook jwt/download.yml
```

## Boot up proxy container

```
ansible-playbook proxy/container/up.yml
```

## Configure all container environments

```
ansible-playbook container/env/configure.yml
```

## Boot up all other containers

```
ansible-playbook container/up.yml
```

## Configure jwt key pass phrases

```
ansible-playbook jwt/configure.yml
```

## Migrate database schemas and default data

```
ansible-playbook database/migrate.yml
```

## Load database data fixtures

```
ansible-playbook database/data/load.yml
```

## Configure api host configs

```
ansible-playbook config/api/configure.yml
```
