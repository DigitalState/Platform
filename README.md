<p align="center"><a href="http://digitalstate.ca" target="_blank">
    <img src="https://avatars3.githubusercontent.com/u/12055994?s=200&v=4">
</a></p>

The **Platform** repository provides a toolkit to help orchestrate instances of the DigitalState **Application**. It uses a Docker container with **Ansible** pre-configured to help the developer manage local and remote deployments; from sandbox to production.

This is the central repository and starting point for developers.

[![works badge](https://cdn.rawgit.com/nikku/works-on-my-machine/v0.2.0/badge.svg)](platform/documentation/status/branches/develop.md)
[![Build Status](https://travis-ci.org/DigitalState/Platform.svg?branch=master)](https://travis-ci.org/DigitalState/Platform)
[![Build status](https://ci.appveyor.com/api/projects/status/b1fspe5xkp44ty69/branch/develop?svg=true)](https://ci.appveyor.com/project/marioprudhomme/platform/branch/develop)
[![Coverage Status](https://coveralls.io/repos/github/DigitalState/Platform/badge.svg?branch=master)](https://coveralls.io/github/DigitalState/Platform?branch=master)
[![Scrutinizer Code Quality](https://scrutinizer-ci.com/g/DigitalState/Platform/badges/quality-score.png?b=master)](https://scrutinizer-ci.com/g/DigitalState/Platform/?branch=master)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)

## Table of Contents

- [Quickstart](#requirements)
- [Requirements](#requirements)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [Credits](#credits)

## Quickstart

To install a tagged release in dev mode, consult the [dev environment](/platform/documentation/environments/dev/index.md) documentation.

To install the latest code in lab mode, consult the [lab environment](/platform/documentation/environments/lab/index.md) documentation.

## Requirements

- **Git**
- **Docker**
- **Docker Compose**

If you are on _Windows_, **Windows Pro** with **HyperV** and **DockerForWindows** are required.

If you are on _Mac_, **DockerForMac** is required.

:warning: _Docker Toolkit is not compatible._

## Documentation

- [Platform Documentation](https://github.com/DigitalState/Platform/blob/develop/platform/documentation/index.md)
- [Developer Documentation](https://github.com/DigitalState/Documentation)
- [User Guide](https://github.com/DigitalState/Guide)

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Credits

This work has been developed by DigitalState.io
