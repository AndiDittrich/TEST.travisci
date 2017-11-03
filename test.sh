#!/us/bin/env bash

set -e

echo "Travis CI Test :)"

# TRAVIS CI ENVIRONMENT ?
if [[ ! $TRAVIS ]]; then
    echo "This script is targeted to Travis CI"
    exit 1
fi

# debug
echo "SSHD Config"
echo "---------------------------------------------------------"
cat /etc/ssh/sshd_config

# debug
echo "KNOWN HOSTS"
echo "---------------------------------------------------------"
cat ~/.ssh/known_hosts

echo "SERVICES"
echo "---------------------------------------------------------"
ps -AF

echo "HOSTNAME"
echo "---------------------------------------------------------"
hostname

echo "SSH TEST"
echo "---------------------------------------------------------"

# create testfile
echo "helloworld file" > /tmp/hello

# show file via ssh
ssh -vvv travisci "cat /tmp/hello"