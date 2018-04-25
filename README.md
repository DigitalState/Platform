<p align="center"><a href="http://digitalstate.ca" target="_blank">
    <img src="https://avatars3.githubusercontent.com/u/12055994?s=200&v=4">
</a></p>

The Platform repository provides a Docker container, with Ansible pre-installed, to help orchestrate instances of the DigitalState Platform. It comes with a **set of playbooks** which helps the developer manage local and remote servers; from sandbox to production.

This is the central repository and starting point for developers.

[![works badge](https://cdn.rawgit.com/nikku/works-on-my-machine/v0.2.0/badge.svg)](platform/documentation/status/index.md)
[![Build Status](https://travis-ci.org/DigitalState/Platform.svg?branch=master)](https://travis-ci.org/DigitalState/Platform)
[![Coverage Status](https://coveralls.io/repos/github/DigitalState/Platform/badge.svg?branch=master)](https://coveralls.io/github/DigitalState/Platform?branch=master)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/DigitalState/Platform/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/DigitalState/Platform/?branch=master)

## Table of Contents

- [Synopsis](#synopsis)
- [Requirements](#requirements)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [Credits](#credits)

## Synopsis

1. **Install** Docker on your local machine.
2. **Download** the Platform repository.
3. **Boot** the Platform container.
4. **Execute** Ansible playbooks to deploy instances.

## Requirements

- Git
- Docker
- Docker Compose.

If you are on Windows, Windows Pro with HyperV and DockerForWindows is required.

If you are on Mac, DockerForMac is required.

> Docker toolkit is not compatible.

## Documentation

- [Status](platform/documentation/status/index.md)
- [Environments](platform/documentation/env/index.md)
  - [Lab](platform/documentation/env/lab/index.md) - The lab environment is typically deployed to your local machine and is used to further develop the platform.
  - [Test](platform/documentation/env/test/index.md) - The test environment is typically deployed to a remote server and is used for continuous integration.
  - [Development](platform/documentation/env/dev/index.md) - The development environment is typically deployed to a remote server and is used as sandbox.
  - [Staging](platform/documentation/env/stag/index.md) - The staging environment is typically deployed to a remote server and is used as a pre-production mirror.
  - [Production](platform/documentation/env/prod/index.md) - The production environment is typically deployed to a remote server and is used to serve the latest release.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Credits

This work has been developed by DigitalState.io
