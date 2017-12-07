<p align="center"><a href="http://digitalstate.ca" target="_blank">
    <img src="https://avatars3.githubusercontent.com/u/12055994?s=200&v=4">
</a></p>

The SDK provides a **set of tools** to help manage the DigitalState platform, from setting up a local lab environment to deploying to remote servers.

It uses **Docker** and **Ansible** to help with orchestration and is the central repository used by developers.

## Table of Contents

- [Synopsis](#synopsis)
- [Installation](#installation)
- [Contributing](#contributing)
- [Credits](#credits)

## Synopsis

1. **Install** Docker on your local machine.
2. **Download** the SDK repository.
3. **Boot** the SDK container and **enter** the console.
4. **Execute** pre-built Ansible commands to help with various orchestration tasks.

## Installation

1. To begin, you will need to install Docker (for [Windows](https://www.docker.com/docker-windows), for [Mac](https://docs.docker.com/docker-for-mac), for [Linux](https://docs.docker.com/engine/installation/#server)) on your local machine.

2. Download this repository.

3. Open a command prompt and make it point to the root of the repository:

   ```
   > cd C:\Users\user1\Sdk
   ```

4. Boot the SDK container:

   ```
   > docker-compose up -d
   ```

5. Confirm the container has been booted successfully:

   ```
   > docker ps
   ```
   
   You should see the following output:
   
   ```
   CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
   4ceab8511b85        sdk_sdk             "/bin/sh"           3 seconds ago       Up 2 seconds                            sdk
   ```

6. Enter the container in bash mode:

   ```
   > docker exec -it sdk /bin/sh
   ```

At this point, you have the SDK container running on your local machine as a bare Linux Alpine system with Ansible pre-installed and ready to accept commands. 

The next step would be to deploy a local [lab environment](sdk/documentation/lab/index.md).

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Credits

This work has been developed by DigitalState.io
