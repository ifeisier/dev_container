#!/bin/bash

current_dir=$(pwd)
current_dir_name=$(basename "$current_dir")
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
parent_dir="$(cd "$script_dir/../../" && pwd)"
workspace_dir="$(cd "$script_dir/../../workspace" && pwd)"

echo "=============基本信息============="
echo "当前目录名: $current_dir_name"
echo "脚本目录路径: $script_dir"
echo "工作目录路径: $workspace_dir"
echo "================================="

container_name="test"
remote_port="2221"

mapping_port=''
#mapping_port='["8080:80","9090:90"]'
mapping_port=$(echo $mapping_port | tr -d '[]"')
mapping_port=$(echo $mapping_port | tr ',' ' ')
mapping_port_output=""
for port in $mapping_port; do
    mapping_port_output="$mapping_port_output -p $port"
done

sudo docker run -itd --restart="always" \
--privileged \
--cpus="2" \
-m 512m --memory-swap 1g \
--name $container_name \
--entrypoint /bin/bash \
-p $remote_port:22 \
   $mapping_port_output \
-v $parent_dir:/root/$current_dir_name \
-v $workspace_dir:/root/workspace \
ubuntu:24.04 \
-c "cd /root/$current_dir_name && /root/$current_dir_name/scripts/init_dev_container/init_container.sh && /root/$current_dir_name/scripts/init_dev_container/container_startup.sh"

