#!/bin/bash
yum -y install vim wget ntpdate lrzsz git net-tools
ntpdate time.nist.gov
echo "1 1 * * * /usr/sbin/ntpdate time.nist.gov" >> /var/spool/cron/root

systemctl stop firewalld
systemctl disable firewalld
yum -y install iptables-services
systemctl disable iptables
yum -y install docker
curl -L https://github.com/docker/compose/releases/download/1.11.0-rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

#加速器
curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://1f4b4a2f.m.daocloud.io
systemctl start docker.service

#安装dockerui
docker run -d -p 9000:9000 -v /var/run/docker.sock:/docker.sock microbox/dockerui:latest

systemctl status docker | grep active
