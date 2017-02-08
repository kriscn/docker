# docker

curl -sSL https://raw.githubusercontent.com/kriscn/docker/master/init/docker.init.sh | sh

停止所有容器命令
```bash
docker stop `docker ps -a -q`
```

删除所有容器命令
```bash
docker rm `docker ps -a -q`
```
