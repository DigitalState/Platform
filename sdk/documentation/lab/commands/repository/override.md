# Lab Environment

## Commands

### Repository

#### Override

This command will grab files found [here](/resource/repository) and be copied to the [/app](/app) directory.

```
ansible-playbook repository/override.yml
```

This functionality is useful if you wish to override files in a specific repository without having to fork the repository and reconfigure related Ansible roles / playbooks.
