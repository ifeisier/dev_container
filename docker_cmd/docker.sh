#!/bin/bash

##  获取 dev_container 目录的绝对路径
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
dev_container_dir="$(cd "$script_dir/../" && pwd)"
workspace_dir="$(cd "$script_dir/../workspace" && pwd)"



##  配置容器信息

# 开发容器的名字
container_name="test"

# 开发容器的镜像
image_name="ubuntu:24.04"

# 开发容器的远程端口
remote_port="2222"

# 开发容器的端口映射
#mapping_port='["8080:80","9090:90"]'
mapping_port=''
mapping_port=$(echo $mapping_port | tr -d '[]"')
mapping_port=$(echo $mapping_port | tr ',' ' ')
mapping_port_output=""
for port in $mapping_port; do
    mapping_port_output="$mapping_port_output -p $port"
done



##  启动容器
sudo docker run -itd --restart="always" \
--privileged \
--cpus="4" \
--name $container_name \
-p $remote_port:22 \
   $mapping_port_output \
-v $dev_container_dir:/dev_container \
-v $workspace_dir:/workspace \
$image_name \
/bin/bash /dev_container/docker_cmd/init.sh