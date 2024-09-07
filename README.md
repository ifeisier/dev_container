# dev_container

创建 docker 容器并在容器中安装 ssh 服务.

ide 可以通过 ssh 连接到容器进行远程开发.

这个脚本适合简单的开发场景.


## 使用

可以将项目放到 workspace 目录, 并在 dev_container 目录中执行 `./init_scripts/run.sh` 脚本.

init_scripts 目录中还有两个脚本:

- init_container.sh: 只有第一次运行容器的时候才执行.

- container_startup.sh: 每次容器启动都会执行.
