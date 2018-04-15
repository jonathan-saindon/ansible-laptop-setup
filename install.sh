#!/bin/bash

###################
# Install ansible #
###################
if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible PPA"
    sudo apt-add-repository ppa:ansible/ansible -y
fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."
    sudo apt-get install ansible -y
else
    echo "Ansible already installed"
fi

################
# Run playbook #
################
ansible-playbook playbook.yml
