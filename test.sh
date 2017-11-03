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
cat /etc/ssh/sshd_config

# create testfile
echo "helloworld file" > /tmp/hello

# show file via ssh
ssh -vvv travisci "cat /tmp/hello"