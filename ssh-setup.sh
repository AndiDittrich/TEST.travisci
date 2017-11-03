#!/us/bin/env bash

set -e

echo "Travis CI SSH Setup"

# TRAVIS CI ENVIRONMENT ?
if [[ ! $TRAVIS ]]; then
    echo "This script is targeted to Travis CI"
    exit 1
fi

# create .ssh dir
mkkdir -p ~/.ssh

# permissions
chmod 0700 ~/.ssh

# create new ssh key 
ssh-keygen -q -t rsa -b 4096 -f ~/.ssh/id_rsa -N ""

# append new key to authorized_keys
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys

# permissions
chmod 0600 ~/.ssh/authorized_keys

# add host entry
cat << EOF >> ~/.ssh/config
Host travisci
  HostName localhost
  IdentityFile ~/.ssh/id_rsa
EOF