#!/bin/zsh
ansible-playbook -i inventory.ini -c local ansible_osx.yml --ask-become-pass
