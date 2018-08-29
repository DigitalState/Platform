# Documentation

The **Platform** repository provides a toolkit to help orchestrate instances of the DigitalState **Application**. It uses a Docker container with **Ansible** pre-configured to help the developer manage local and remote deployments; from sandbox to production.

## Table of Contents

- [Architecture](#architecture)
- [Environments](#environments)
- [Playbooks](#playbooks)
- [Tutorials](#tutorials)
- [Build Status](#build-status)

## Architecture

- [General Architecture](architecture/general.md)<br>The Platform general architecture and core concepts.
- [Troubleshooting](architecture/troubleshooting.md)<br>Various strategies to help troubleshooting Ansible, Docker, Symfony, etc.

## Environments

- [Lab](environments/lab/index.md)<br>The lab environment is typically deployed to your local machine and is used to further develop the Platform.
- [Test](environments/test/index.md)<br>The test environment is typically deployed to a remote server and is used for continuous integration.
- [Development](environments/dev/index.md)<br>The development environment is typically deployed to your local machine and is used as sandbox.
- [Staging](environments/stag/index.md)<br>The staging environment is typically deployed to a remote server and is used as a pre-production mirror.
- [Production](environments/prod/index.md)<br>The production environment is typically deployed to a remote server and is used to serve the application.

## Playbooks

- [Structure](playbooks/structure.md)<br>The structure behind playbooks, tasks and roles.
- [List of Available Playbooks](playbooks/playbooks.md)<br>The list of available commands related to orchestration and development.

## Tutorials

- [Getting started with Postman](tutorials/postman.md/branches/develop.md)<br>This tutorial will help you get started with Postman and setup the collection and environment.

## Build Status

- [Develop Branch](status/branches/develop.md)<br>The build status of the latest development efforts.
- [Latest Release (0.9.1)](status/releases/0.9.1.md)<br>The build status of the latest release.
- [Previous Releases](status/releases/index.md)<br>The build statuses of previous releases.
