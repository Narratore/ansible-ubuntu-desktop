#!/bin/bash

#
# script: install-ansible-on-ubuntu.sh
# Description: Setup ansible from PPA on Ubuntu Machine
# Author: Jorge Armando Medina
# Email: jorge.medina@kronops.com.mx
#

#set -x

# vars

# main

echo
echo "Updating apt lists."
sudo apt-get -qq update
echo "Installing software-properties-common."
sudo apt-get -qq install software-properties-common

echo "Installing Ansible dependencies."
sudo apt-get install -qq -y python3-dev python3-yaml python3-jinja2 python3-paramiko python3-crypto python3-simplejson python3-setuptools sshpass

echo "Installing ansible from ansible ppa repository."
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get -qq update
sudo apt-get -qq install ansible

echo
echo "Validating you can run ansible on the local host."

ansible 127.0.0.1 -c local -m ping
