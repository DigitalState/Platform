# Releasing

This document describes the to-do list to create a new release at the core, microservice and platform level.

## Table of Contents

- [Core](#core)
- [Microservice](#microservice)
- [Platform](#platform)

## Core

__Reset to latest develop branch__

- `git checkout develop`
- `git pull`

__Create release branch__

- `git checkout -b release/1.2.3`

__Update various resources__

- Update changelog, if necessary

__Publish release__

- Create a pull request `develop <- release/1.2.3` through the Github interface
- Merge the pull request through the Github interface
- Delete the merged branch through the Github interface
- `git checkout develop`
- `git pull`
- `git checkout master`
- `git pull`
- `git merge develop`
- `git push`
- `git tag 1.2.3`
- `git push --tags`

## Microservice

__Reset to latest develop branch__

- `git checkout develop`
- `git pull`

__Create release branch__

- `git checkout -b release/1.2.3`

__Update various resources__

- Update .env file `IMAGE_TAG` variable to `1.2.3`
- Update composer file digitalstate/core dependency number, if necessary
- Update changelog, if necessary

__Publish release__

- Create a pull request `develop <- release/1.2.3` through the Github interface
- Merge the pull request through the Github interface
- Delete the merged branch through the Github interface
- `git checkout develop`
- `git pull`
- `git checkout master`
- `git pull`
- `git merge develop`
- `git push`
- `git tag 1.2.3`
- `git push --tags`

## Platform

__Reset to latest develop branch__

- `git checkout develop`
- `git pull`

__Create release branch__

- `git checkout -b release/1.2.3`

__Update various resources__

- Update changelog, if necessary
- Update VERSION file
- Update status pages
- Update dev, stag and prod inventory microservice versions
- Update postman collection and environment files

__Publish release__

- Create a pull request `develop <- release/1.2.3` through the Github interface
- Merge the pull request through the Github interface
- Delete the merged branch through the Github interface
- `git checkout develop`
- `git pull`
- `git checkout master`
- `git pull`
- `git merge develop`
- `git push`
- `git tag 1.2.3`
- `git push --tags`
