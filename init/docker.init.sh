#!/bin/bash
yum -y install vim wget ntpdate lrzsz git net-tools
ntpdate time.nist.gov
echo "*/1 * * * * /usr/sbin/ntpdate time.nist.gov" >> /var/spool/cron/root

#关闭selinux
/usr/sbin/setenforce 0
echo "/usr/sbin/setenforce 0" >> /etc/rc.local

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

systemctl status docker | grep active
