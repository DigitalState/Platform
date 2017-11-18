<p align="center"><a href="http://digitalstate.ca" target="_blank">
    <img src="https://avatars3.githubusercontent.com/u/12055994?s=200&v=4">
</a></p>

The SDK provides a **set of tools** to help manage various parts of the DigitalState architecture, from setting up a local lab environment to deploying to remote servers.

It uses **Docker** and **Ansible** to help with orchestration and is the central repository used by developers.

## Table of Contents

- [Synopsis](#synopsis)
- [Installation](#installation)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [Credits](#credits)

## Synopsis

- **Install** Docker on your local machine.
- **Download** the SDK repository.
- **Boot** the SDK container and **enter** the console.
- **Execute** pre-built commands to help with various orchestration tasks.

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

The next step would be to deploy a local [lab environment](sdk/documentation/lab/index.md).

Supported server operating systems: **Alpine 3**, **Ubuntu 17.04**.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Credits

This work has been developed by DigitalState.io
