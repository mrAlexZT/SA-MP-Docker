#!/bin/bash

set -e

rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

yum update -y && yum upgrade -y

yum install mc git wget tar vsftpd net-tools tcpdump bash-completion -y
systemctl enable vsftpd
#service vsftpd start

exit 0
