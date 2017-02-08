# docker

curl -sSL https://raw.githubusercontent.com/kriscn/docker/master/init/docker.init.sh | sh

停止所有容器命令:
```bash
docker stop `docker ps -a -q`
```

删除所有容器命令:
```bash
docker rm `docker ps -a -q`
```
修改配置文件（/etc/sysconfig/docker）

```
OPTIONS='--selinux-enabled --log-driver=journald --signature-verification=false -H 0.0.0.0:2375 -H unix:///run/docker.sock'
```
追加 -H 0.0.0.0:2375 -H unix:///run/docker.sock
