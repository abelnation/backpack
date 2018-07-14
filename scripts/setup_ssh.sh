#!/usr/bin/env bash

# ssh-keygen -t rsa -b 4096 -C "abel.allison@gmail.com"

eval "$(ssh-agent -s)"

SSH_CONFIG_FILE="${HOME}/.ssh/config"
echo "Host *" >> $SSH_CONFIG_FILE
echo "  AddKeysToAgent yes" >> $SSH_CONFIG_FILE
echo "  IdentityFile ~/.ssh/id_rsa" >> $SSH_CONFIG_FILE
# echo " UseKeychain yes" > SSH_CONFIG_FILE

# Add ssh key 
ssh-add -K ~/.ssh/id_rsa