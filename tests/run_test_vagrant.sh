#!/bin/bash

# First, retrieve depending roles
ansible-galaxy --ignore-errors -p roles install -r ../meta/requirements.yml

# Then create VM
vagrant up

# Provision them
vagrant provision

#ansible-playbook test-vagrant.yml -i inventory-vagrant --user vagrant --private-key=~/.vagrant.d/insecure_private_key --sudo

#echo 'Vagrant SSH password is "vagrant".'
#ansible-playbook test-vagrant.yml -i inventory-vagrant --user vagrant -k --sudo

rm -rf roles
