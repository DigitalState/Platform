# Lab Environment

The lab environment enables the developer to run the full DigitalState architecture on a local machine as a dockerized application.

It also provides useful shortcuts to help manage multiple containers at once during development.

## Table of Contents

- [Synopsis](#synopsis)
- [Installation](#installation)
- [Deployment](#deployment)
- [References](#references)

## Synopsis

1. **Install** the SDK on your local machine.
2. **Create** jwt keys required by the authentication system.
3. **Configure** the Ansible inventory file.
4. **Deploy** a dockerized application locally.

## Installation

1. To begin, you will need to install Docker (for [Windows](https://www.docker.com/docker-windows) / for [Mac](https://docs.docker.com/docker-for-mac) / for [Linux](https://docs.docker.com/engine/installation/#server)) on your local machine.

2. Download this repository.

3. Open a console and make it point to the root of the repository directory:

   ```
      cd C:\Users\Demo\Sdk
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

At this point, you have the SDK container running on your local machine as a bare Linux Alpine system with Ansible pre-installed and ready to accept commands. 

# Deployment

Prior to running the deployment Ansible command, a few actions are required by the developer.

- Create Jwt Keys.

  The DigitalState architecture uses [jwt](https://jwt.io/introduction/) tokens for user authentication. 

  The authentication system uses a private key to generate new tokens and a public key to validate them. To create such keys, follow these [instructions for Windows](https://www.ssh.com/ssh/putty/windows/puttygen), these [instructions for Linux](https://www.ssh.com/ssh/putty/linux/puttygen).

  During deployment, the SDK will transfer jwt keys from your local machine to the appropriate containers.

- Configure Ansible Inventory File.

  ...

- Run Deployment Ansible Command.

  ...

#References

- [Full list of available commands.](commands.md)
- [Inventory configuration file explained.](configurations.md)
