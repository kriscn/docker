#!/bin/bash
yum -y install vim wget ntpdate lrzsz git net-tools
ntpdate time.nist.gov
echo "1 1 * * * /usr/sbin/ntpdate time.nist.gov" >> /var/spool/cron/root

systemctl stop firewalld
systemctl disable firewalld
yum -y install iptables-services
yum -y install docker
curl -L https://github.com/docker/compose/releases/download/1.11.0-rc1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
systemctl start docker.service
systemctl status docker | grep active
