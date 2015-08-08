#!/bin/bash

# Verify Ansible is available
if ! which ansible-playbook >/dev/null; then
    echo "You must first setup Ansible environment:"
    echo "source ~/dev/ansible/hacking/env-setup"
    exit 1
fi

# Syntax check Ansible
echo "Check Ansible syntax..."
ansible-playbook -i 'localhost,' test.yml --syntax-check

# Create VMs:
echo "Create Vagrant VMs..."
vagrant up --no-provision

# Provision them:
# NOTE: Force locale until this bug is fixed:
# https://github.com/ansible/ansible/issues/11055
echo "* Run Ansible..."
LC_ALL=en_US.UTF-8 vagrant provision

# TODO
#echo "* Verify we got what we expected..."
# TODO

echo "* Verify idempotency..."
# Run again to verify idempotence:
LC_ALL=en_US.UTF-8 vagrant provision \
    | grep 'changed=0.*failed=0' && IDEMPOTENCE_PASS=1 || IDEMPOTENCE_PASS=0

if [ $IDEMPOTENCE_PASS -eq 1 ]; then
    echo "* Idempotence test passed. Destroy VMs..."
    vagrant destroy -f
    exit 0
else
    echo "* Idempotence test FAILED! VMs are kept and NOT destroyed."
    exit 1
fi

# Manually:
# vagrant ssh-config > /tmp/ansible_ssh_temp
# export ANSIBLE_SSH_ARGS="-F /tmp/ansible_ssh_temp"
# MYHOST=centos-7
# ansible-playbook test.yml -i "$MYHOST," --sudo

