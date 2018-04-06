# Lab Environment

## Commands

### Repository

#### Download

This command will download from Github repositories that are enabled in the [inventory file](/platform/ansible/env/lab/inventory.yml) and be copied to the [/app](/app) directory.

```
ansible-playbook repository/download.yml
```
