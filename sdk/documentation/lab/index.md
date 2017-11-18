# Lab Environment

The lab environment enables the developer to run the full DigitalState architecture on a local machine as a dockerized application.

It also provides useful commands to help manage multiple containers at once during development.

## Table of Contents

- [Synopsis](#synopsis)
- [Installation](#installation)
- [Configuration](#configuration)
- [Deployment](#deployment)
- [References](#references)

## Synopsis

1. **Install** the SDK on your local machine.
2. **Configure** the lab environment.
3. **Generate** keys for the system.
4. **Add** entries to your host file.
5. **Deploy** the dockerized application locally.

## Installation

1. To begin, you will need to install Docker (for [Windows](https://www.docker.com/docker-windows), for [Mac](https://docs.docker.com/docker-for-mac), for [Linux](https://docs.docker.com/engine/installation/#server)) on your local machine.

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

At this point, you have the SDK container running on your local machine as a bare Linux Alpine system with Ansible pre-installed and ready to accept commands. 

## Configuration

Prior to deploying the application, a few actions are required by the developer:

1. Configure the lab environment.

    > The lab environment uses an Ansible inventory file found [here](/sdk/ansible/env/lab/inventory.yml) for its configurations.

    The [directory](https://github.com/DigitalState/Sdk/blob/master/sdk/ansible/env/lab/inventory.yml#L11) config needs to be set to the absolute path of the SDK app directory. The value will vary depending on your local machine's operating system:

    **Windows**

    Under Docker for Windows with Hyper-V, the value should be equal to the Hyper-V mounted directory path.

    For example, if you have put the SDK repository at `C:\Users\Demo\Sdk`, then the directory config value should be `/c/Users/Demo/Sdk/app`.

    **Mac**

    Under Docker for Mac...

    **Linux**

    Under operating systems that supports Docker natively, the value should simply be equal to the normal directory path.

    For example, if you have put the SDK repository at `/home/demo/sdk`, then the directory config value should be `/home/demo/sdk/app`.

2. Create jwt keys.

    > The DigitalState architecture uses [jwt](https://jwt.io/introduction/) tokens for user authentication. 
    > The authentication system requires a private and public key to generate and validate tokens. 
    > Jwt keys should be unique to each projects and are not included in this repository for security reasons. 

    To create jwt keys, follow the instructions [for Windows](https://www.ssh.com/ssh/putty/windows/puttygen), [for Mac](#) or [for Linux](https://www.ssh.com/ssh/putty/linux/puttygen). Once created, copy the key files over to the jwt resource directory.
 
    The private key should be copied to `C:\Users\Demo\Sdk\resource\jwt\lab\key`.

    The public key should be copied to `C:\Users\Demo\Sdk\resource\jwt\lab\key.pub`. 

## Deployment

From the SDK console, point to the lab environment directory and execute the deploy Ansible command:

```
cd /etc/ansible/env/lab
ansible-playbook deploy.yml
```

This command essentially downloads repositories, configures settings, boots up containers, migrates databases and loads data fixtures for each sub-systems.

## References

- [List of available Ansible commands.](commands.md)
- [Inventory configuration file explained.](configurations.md)
