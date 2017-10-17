<p align="center"><a href="http://digitalstate.ca" target="_blank">
    <img src="https://avatars3.githubusercontent.com/u/12055994?s=200&v=4">
</a></p>

# Sdk

The SDK provides a set of tools to help manage various parts of the DigitalState architecture, from setting a local development environment to running test suites and deploying to remote servers.

It is the central repository used by developers.

## Table of Contents

- [Synopsis](#synopsis)
- [Installation](#installation)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [Credits](#credits)

## Synopsis

1. **Install** the requirements (Docker).
1. **Download** the SDK repository to your local machine.
1. **Boot** the SDK container and **enter** the console.
1. **Execute** sdk commands.

## Installation

To begin, you will need to install Docker (for [Windows](https://www.docker.com/docker-windows) / for [Mac](https://docs.docker.com/docker-for-mac)).

The SDK runs a local docker container and uses [Ansible](https://www.ansible.com) for its orchestration.

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
docker exec -it ds_sdk /bin/sh
```

At this point, we have the SDK container running and ready to accept commands.

## Documentation

The SDK contains various pre-built commands, implemented as Ansible playbooks [here](resource/orchestration/index.md), to help with development and orchestration.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Credits

This work has been developed by DigitalState.io
