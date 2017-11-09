# Lab Environment

## Installation

1. To begin, you will need to install Docker (for [Windows](https://www.docker.com/docker-windows) / for [Mac](https://docs.docker.com/docker-for-mac) / for [Linux](https://docs.docker.com/engine/installation/#server)) on your local machine.

2. Download this repository.

3. Open a console and make it point to the root of the repository directory:

   ```
   cd /home/demo/sdk
   ```

4. Boot the SDK container:

   ```
   docker-compose up -d
   ```

5. Confirm the container has been booted successfully:

   ```
   docker ps
   ```
   
   You should see the following output:
   
   ```
   CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
   4ceab8511b85        sdk_sdk             "/bin/sh"           3 seconds ago       Up 2 seconds                            sdk
   ```

6. Enter the container in console mode:

   ```
   docker exec -it sdk /bin/sh
   ```

7. Point to the lab environment commands directory:

    ```
    cd /etc/ansible/env/lab
    ```

At this point, you have the SDK container running locally as a bare Linux Alpine system with Ansible pre-installed and ready to accept commands. 

## Commands

### Deploy

This command essentially executes the full gamut of commands required to deploy on a bare system.

```
ansible-playbook deploy.yml
```

### Setup system

This command will setup various core packages (Git, Docker) for Linux Alpine.

```
ansible-playbook system/setup.yml
```

### Download repositories

This command will download from Github all repositories that are enabled in the [inventory file](/sdk/ansible/env/lab/inventory.yml) and be placed inside the `/app` directory.

```
ansible-playbook repository/download.yml
```

### Override repositories

```
ansible-playbook repository/override.yml
```

### Download jwt keys

```
ansible-playbook jwt/download.yml
```

### Boot up proxy container

```
ansible-playbook proxy/container/up.yml
```

### Configure all container environments

```
ansible-playbook container/env/configure.yml
```

### Boot up all other containers

```
ansible-playbook container/up.yml
```

### Configure jwt key pass phrases

```
ansible-playbook jwt/configure.yml
```

### Migrate database schemas and default data

```
ansible-playbook database/migrate.yml
```

### Load database data fixtures

```
ansible-playbook database/data/load.yml
```

### Configure api host configs

```
ansible-playbook config/api/configure.yml
```
