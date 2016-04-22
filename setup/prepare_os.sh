#!/bin/bash

set -e

yum install -y epel-release remi-release

yum update -y && yum upgrade -y

yum install -y mc git wget tar htop bash-completion vsftpd net-tools tcpdump telnet supervisor make cmake gcc gcc-c++ libstdc++-devel compat-libstdc++-33.i686 libstdc++.i686 libstdc++-devel.i686 glibc-devel.i686

systemctl enable vsftpd
#service vsftpd start

#RUN iptables -I INPUT -p tcp -m tcp --dport 21 -m state --state NEW -j ACCEPT
#RUN iptables -I INPUT -p tcp -m tcp --dport 7777 -m state --state NEW -j ACCEPT
#RUN iptables -I INPUT -p udp -m udp --dport 7777 -m state --state NEW -j ACCEPT
#RUN service iptables save

exit 0
