# Sdk

Description...

## Table of Contents

- [Synopsis](#synopsis)
- [Installation](#installation)
- [Documentation](#documentation)
- [Contributing](#contributing)
- [History](#history)
- [Credits](#credits)

## Synopsis

Synopsis...

## Installation

Create ssh keys.

```
ssh-keygen
```

Copy ssh keys to ssh folder.

```

```

Run docker container.

```
docker-compose up -d
docker-compose exec -it ansible /bin/sh
```

Establish an ssh connection between the container and your remote server.

```
ssh-copy-id root@ip
```

Install python on remote hosts.

```
ansible all --sudo -m raw -a "apt-get install -y python"
```

## Documentation

Documentation...

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## History

History..

## Credits

Credits...