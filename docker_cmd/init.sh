#!/bin/bash

# 安装 ssh
apt-get update
apt-get install -y openssh-server
mkdir /var/run/sshd
echo 'root:your_secure_password' | chpasswd
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
service ssh start



# 保持容器运行
tail -f /dev/null