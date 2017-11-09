# Lab Environment

The lab environment enables the developer to run the full DigitalState architecture on your local machine as a dockerized application.

It also provides useful shortcuts to help manage multiple containers at once.

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

7. Point to the lab environment directory:

    ```
    cd /etc/ansible/env/lab
    ```

At this point, you have the SDK container running locally as a bare Linux Alpine system with Ansible pre-installed and ready to accept commands. 

## Commands

- [Deploy](deploy.md)
- System
    - [Setup](system/setup.md)
- Repository
    - [Download](repository/download.md)
    - [Override](repository/override.md)
- JWT
    - [Download](jwt/download.md)
    - [Configure](jwt/download.md)
- Proxy
    - Container
        - [Up](proxy/container/up.md)
        - [Down](proxy/container/down.md)
        - [Stop](proxy/container/stop.md)
- Container
    - Env
        - [Configure](container/env/configure.md)
    - [Up](container/up.md)
    - [Down](container/down.md)
    - [Stop](container/stop.md)
