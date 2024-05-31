#!/bin/bash


# 设置 DEBIAN_FRONTEND 环境变量以避免交互式提示
export DEBIAN_FRONTEND=noninteractive



# 设置时区、UTF-8 编码、自动更新时间
apt-get update
apt-get install -y tzdata locales cron ntpdate

echo "Asia/Shanghai" > /etc/timezone
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
dpkg-reconfigure -f noninteractive tzdata

locale-gen C.UTF-8
update-locale LANG=C.UTF-8
echo "LANG=en_US.UTF-8" > /etc/default/locale
echo "LANGUAGE=en_US:en" >> /etc/default/locale
echo "LC_ALL=en_US.UTF-8" >> /etc/default/locale

echo "0 * * * * /usr/sbin/ntpdate -u pool.ntp.org" > /etc/cron.d/ntpdate
crontab /etc/cron.d/ntpdate
service cron start



# 安装 ssh
apt-get install -y openssh-server
mkdir /var/run/sshd
echo 'root:your_secure_password' | chpasswd
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
service ssh start



# 可能会用到的库
apt-get install -y g++ gcc libudev-dev pkg-config build-essential
apt-get install -y bzip2 unzip wget curl git


# 保持容器运行
tail -f /dev/null