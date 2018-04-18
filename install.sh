#!/bin/bash

###################
# Install ansible #
###################
if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible PPA"
    sudo apt-add-repository ppa:ansible/ansible -y
fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Ansible installation not found !"
    echo "Installing Ansible..."
    sudo apt-get install ansible -y
fi

################
# Run playbook #
################
ansible-playbook playbook.yml --ask-become-pass
