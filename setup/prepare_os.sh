#!/bin/bash

set -e

rpm -ivh http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
rpm -ivh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

yum update -y && yum upgrade -y

yum install mc git wget tar vsftpd net-tools tcpdump gcc gcc-c++ make cmake libstdc++-devel compat-libstdc++-33.i686 libstdc++.i686 libstdc++-devel.i686 glibc-devel.i686 bash-completion -y
systemctl enable vsftpd
#service vsftpd start

#RUN iptables -I INPUT -p tcp -m tcp --dport 21 -m state --state NEW -j ACCEPT
#RUN iptables -I INPUT -p tcp -m tcp --dport 7777 -m state --state NEW -j ACCEPT
#RUN iptables -I INPUT -p udp -m udp --dport 7777 -m state --state NEW -j ACCEPT
#RUN service iptables save

exit 0
