<p align="center"><a href="http://digitalstate.ca" target="_blank">
    <img src="https://avatars3.githubusercontent.com/u/12055994?s=200&v=4">
</a></p>

The SDK provides a **set of tools** to help manage the DigitalState platform, from setting up a local environment for development to deploying to remote servers; from sandbox to production.

It uses **Docker** and **Ansible** to help with orchestration and is the central repository used by developers and devops.

[![works badge](https://cdn.rawgit.com/nikku/works-on-my-machine/v0.2.0/badge.svg)](sdk/documentation/tested.md)

## Table of Contents

- [Synopsis](#synopsis)
- [Requirements](#requirements)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [Credits](#credits)

## Synopsis

1. **Install** Git and Docker on your local machine.
2. **Download** the SDK repository.
3. **Boot** the SDK container.
4. **Execute** pre-built Ansible playbook commands.

## Requirements

#### Linux

- Git
- Docker

#### Windows

- Git
- Windows Pro with HyperV
- DockerForWindows

#### Mac

- Git
- DockerForMac

> Note: Docker toolkit is not compatible.

## Documentation

The SDK documentation is grouped by deployment environments:

- [Lab](sdk/documentation/lab/index.md) - The lab environment deploys to your local machine and is used to further develop the platform.
- [Test](sdk/documentation/test/index.md) - The test environment deploys to a remote server and is used for continuous integration.
- [Development](sdk/documentation/dev/index.md) - The development environment deploys to a remote server and is used as sandbox.
- [Staging](sdk/documentation/stag/index.md) - The staging environment deploys to a remote server and is used as a pre-production mirror.
- [Production](sdk/documentation/prod/index.md) - The production environment deploys to a remote server and is used to serve the latest release.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Credits

This work has been developed by DigitalState.io
