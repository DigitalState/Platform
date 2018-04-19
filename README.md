<p align="center"><a href="http://digitalstate.ca" target="_blank">
    <img src="https://avatars3.githubusercontent.com/u/12055994?s=200&v=4">
</a></p>

The platform repository provides a **set of tools** to help manage the DigitalState platform, from setting up a local environment for development to deploying to remote servers; from sandbox to production.

It uses **Docker** and **Ansible** to help with orchestration and is the central repository used by developers and devops.

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

1. **Install** Git and Docker on your local machine.
2. **Download** the platform repository.
3. **Boot** the platform container.
4. **Execute** pre-built Ansible playbooks.

## Requirements

**For Linux:** Git, Docker, Docker Compose.

**For Windows:** Windows Pro with HyperV, Git, DockerForWindows.

**For Mac:** Git, DockerForMac.

> Note: Docker toolkit is not compatible.

## Documentation

#### General

- [Status](platform/documentation/status/index.md)

#### Environments

- [Lab](platform/documentation/env/lab/index.md) - The lab environment is typically deployed to your local machine and is used to further develop the platform.
- [Test](platform/documentation/env/test/index.md) - The test environment is typically deployed to a remote server and is used for continuous integration.
- [Development](platform/documentation/env/dev/index.md) - The development environment is typically deployed to a remote server and is used as sandbox.
- [Staging](platform/documentation/env/stag/index.md) - The staging environment is typically deployed to a remote server and is used as a pre-production mirror.
- [Production](platform/documentation/env/prod/index.md) - The production environment is typically deployed to a remote server and is used to serve the latest release.

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Credits

This work has been developed by DigitalState.io
