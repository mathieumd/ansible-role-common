#!/bin/bash

# Verify Ansible is available
if ! which ansible-playbook >/dev/null; then
    echo "You must first setup Ansible environment:"
    echo "source ~/dev/ansible/hacking/env-setup"
    exit 1
fi

# Create VMs:
vagrant up --no-provision

# Provision them:
# NOTE: Force locale until this bug is fixed:
# https://github.com/ansible/ansible/issues/11055
LC_ALL=en_US.UTF-8 vagrant provision

# Run again to verify idempotence:
LC_ALL=en_US.UTF-8 vagrant provision

# Manually:
# MYHOST=centos-7
# vagrant ssh-config $MYHOST > /tmp/ansible_ssh_temp
# ANSIBLE_SSH_ARGS="-F /tmp/ansible_ssh_temp" ansible-playbook test.yml -i "$MYHOST," --sudo

