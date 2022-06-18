#!/bin/sh

mkdir -p data/files data/.ssh

echo "Please enter an SSH public key:"
read KEY
echo $KEY > data/.ssh/authorized_keys
chmod 700 data/.ssh
chmod 600 data/.ssh/authorized_keys
chown -R 1001:1001 data
