#!/bin/bash
yum -y install vim wget ntpdate lrzsz
ntpdate time.nist.gov
yum -y install docker
systemctl start docker.service

