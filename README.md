# Ansible role

[![Build Status](https://travis-ci.org/mathieumd/ansible-role-common.svg?branch=master)](https://travis-ci.org/mathieumd/ansible-role-common)

Personal Ansible role used to set the default settings common on my machines.

## Role Variables

See [defaults](defaults/main.yml) contents. Basicaly:

```yaml
# List of packages you want to be present or absent:
common_packages:
  debian:
    - vim
    - screen
    - htop
    - git
  redhat:
    - vim
    - screen
    - htop
    - git

common_packages_removed:
  debian:
  redhat:
```

## Example Playbook

```yaml
- hosts: desktops
  roles:
    - role: common

- hosts: servers
  roles:
    - role: common
      liquidprompt: no
      common_packages: { debian: [vim, htop], redhat: [vim, htop] }
```

## License

GPL v3

