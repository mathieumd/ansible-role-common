# Ansible role

[![Build Status](https://travis-ci.org/mathieumd/ansible-role-common.svg?branch=master)](https://travis-ci.org/mathieumd/ansible-role-common)

Personal Ansible role used to set the default settings common on my machines.

## Role Variables

See [defaults](defaults/main.yml) contents.

## Example Playbook

```yaml
    - hosts: servers
      roles:
         - common
```

## License

GPL v3

