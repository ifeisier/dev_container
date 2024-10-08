#!/bin/bash

# 时区
echo "Asia/Shanghai" > /etc/timezone
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
ntpdate ntp.aliyun.com

# 字符编码
locale-gen zh_CN.UTF-8
update-locale LANG=zh_CN.UTF-8 LANGUAGE=zh_CN:zh LC_ALL=zh_CN.UTF-8

# 启动 ssh
service ssh start

# 保持容器运行
tail -f /dev/null
