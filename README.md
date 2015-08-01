# Ansible role

[![Build Status](https://travis-ci.org/mathieumd/ansible-role-common.svg?branch=master)](https://travis-ci.org/mathieumd/ansible-role-common)

Personal Ansible role used to set the default settings common on my machines.

## Role Variables

See [defaults](defaults/main.yml) contents.

You probably want to overload some depending roles' variables in your playbook `group_vars/all`:

```yaml
# NTP servers
ntp_config_server: [ 0.fr.pool.ntp.org, 1.fr.pool.ntp.org, 2.fr.pool.ntp.org 3.fr.pool.ntp.org]

# The default timezone of the system
timezone: "Europe/Paris"

# Locales
locale_locales:
  - en_US.UTF-8
  - fr_FR.UTF-8
```

## Example Playbook

```yaml
- hosts: servers
  roles:
     - common
```

## License

GPL v3

