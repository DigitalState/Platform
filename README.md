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

1. **Install** Docker.
2. **Download** the SDK repository to your local machine.
3. **Boot** the SDK container and **enter** the console.
4. **Execute** pre-built commands to help with various orchestration tasks.

## Installation

1. To begin, you will need to install Docker (for [Windows](https://www.docker.com/docker-windows) / for [Mac](https://docs.docker.com/docker-for-mac)) on your local machine. The SDK uses Docker to run a local container with [Ansible](https://www.ansible.com) pre-installed.

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

At this point, you have the SDK container running and ready to accept commands. Next step would be to deploy a local [lab environment](resource/orchestration/lab/index.md).

## Documentation

The SDK contains various pre-built commands, implemented as Ansible playbooks [here](resource/orchestration/index.md), to help with development, testing and deployment.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Credits

This work has been developed by DigitalState.io
