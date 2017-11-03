#!/us/bin/env bash

set -e

echo "Travis CI Test :)"

# TRAVIS CI ENVIRONMENT ?
if [[ ! $TRAVIS ]]; then
    echo "This script is targeted to Travis CI"
    exit 1
fi

echo "hello world";

cat ~/.ssh/config
cat ~/.ssh/authorized_keys
