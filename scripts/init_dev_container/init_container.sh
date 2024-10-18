#!/bin/bash

current_dir=$(pwd)
LOCK_FILE="$current_dir/scripts/init_dev_container/init_container.lock"
if [ -f "$LOCK_FILE" ]; then
    exit 0
fi
echo "" > $LOCK_FILE

export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install -y locales ntpdate
apt-get install -y g++ gcc libudev-dev pkg-config build-essential libssl-dev
apt-get install -y bzip2 unzip wget curl git

apt-get install -y openssh-server
mkdir /var/run/sshd
echo 'root:root' | chpasswd
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
service ssh start
