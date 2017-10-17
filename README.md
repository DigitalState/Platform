# Sdk

The SDK repository provides a starting point for development.

It also contains a collection of scripts to help manage the various parts of our architecture, both on your local machine and remote servers.

## Table of Contents

- [Synopsis](#synopsis)
- [Installation](#installation)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [History](#history)
- [Credits](#credits)

## Synopsis

1. **Install** requirements (Docker and virtual machine manager).
1. **Download** the SDK repository to your local machine.
1. **Boot** the SDK container and **enter** the console.
1. **Execute** console commands to help download repositories, boot microservice containers, create databases, etc.

## Installation

To begin, you will need to install [Docker](https://www.docker.com) and a virtual machine manager. The SDK makes use of [Ansible](https://www.ansible.com) for its orchestration (which runs inside a Docker container on your local machine).

**Windows**
 
- Docker: [Docker for Windows](https://www.docker.com/docker-windows)
- Virutal machine manager: [Hyper-V](https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v) or [Virtual Box](https://www.virtualbox.org/wiki/Downloads)
 
**Mac**

- Docker: [Docker for Mac](https://docs.docker.com/docker-for-mac)
- Virutal machine manager: [Virtual Box](https://www.virtualbox.org/wiki/Downloads)

> If your intentions are to eventually deploy on remote servers, you will also need to create a public and private SSH key prior to booting the SDK container.
> 
> The keys will be used by Ansible to establish SSH connections between the local Docker container and the remote servers.
> 
> **Windows**
> 
> Create a public and private key using [Putty](https://www.ssh.com/ssh/putty/windows/puttygen).
> 
> **Mac**
> 
> Create a public and private key using the console and follow instructions.
> 
> ```
> ssh-keygen
> ```
> 
> Copy the keys inside the `config/ssh/` directory.

Boot the SDK container:

```
docker-compose up -d
```

After running the `up` command, you will be able to see the container running in the background by executing the following command:

```
docker ps
```

Enter the container in console mode:

```
docker-compose exec -it sdk_sdk_1 /bin/sh
```

> If you have created a public SSH key earlier, you will need to copy it over to your remote server as an authorized key in order to establish a trusted connection:
>
> ```
> ssh-copy-id root@**ip**
> ```

## Documentation

Documentation...

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## History

History..

## Credits

Credits...