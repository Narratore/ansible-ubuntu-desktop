#!/bin/bash

#
# script: install-ansible-on-ubuntu.sh
# Description: Setup ansible from PPA on Ubuntu Machine
# Author: Jorge Armando Medina
# Email: jorgearma1982@gmail.com
# Changelog: Initial version
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
sudo apt-get install -qq -y python-yaml python-jinja2 python-paramiko python-crypto

echo "Installing ansible from ansible ppa repository."
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get -qq update
sudo apt-get -qq install ansible

echo
echo
echo "Now follow this instructions to setup a ansible enviroment."
echo
echo "$ mkdir ~/ansible-tests"
echo "$ cd ~/ansible-tests"
echo "$ git clone https://github.com/jorgearma1982/ansible-my-kubuntu-desktop.git"
echo

echo
echo "Now validating you can run ansible on the local host."

ansible 127.0.0.1 -c local -m ping

