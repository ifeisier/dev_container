# dev_container

连接服务器上的容器, 并在容器中进行开发.

这个脚本适合简单的开发场景.


## 使用

可以通过 `docker.sh` 脚本创建不同的容器.

`init.sh` 脚本是在容器内部执行的, 主要用来安装 ssh.

```shell
# 开发容器的名字
container_name="dev_container"

# 开发容器的镜像
image_name="python:3.8"

# 开发容器的远程端口
# 这个是 ssh 的远程端口
remote_port="2222"

# 开发容器的端口映射
#mapping_port='["8080:80","9090:90"]'
```
