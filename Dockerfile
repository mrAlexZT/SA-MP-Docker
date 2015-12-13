# SA-MP-Docker

FROM centos:latest

MAINTAINER CKA3KuH

RUN yum install wget -y
RUN wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-5.noarch.rpm
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-7.rpm
RUN rpm -Uvh remi-release-7*.rpm epel-release-7*.rpm
RUN yum update -y && yum upgrade -y
RUN yum install tar vsftpd compat-libstdc++-33.i686 -y && yum install libstdc++.i686 -y && yum install libstdc++-devel.i686 -y && yum install bash-completion -y
RUN systemctl enable vsftpd
#RUN systemctl restart vsftpd

#RUN iptables -I INPUT -p tcp -m tcp --dport 21 -m state --state NEW -j ACCEPT
#RUN iptables -I INPUT -p tcp -m tcp --dport 7777 -m state --state NEW -j ACCEPT
#RUN iptables -I INPUT -p udp -m udp --dport 7777 -m state --state NEW -j ACCEPT
#RUN service iptables save

RUN cd ~ && \
 mkdir ~/server/ && \
 curl -OL http://files.sa-mp.com/samp037svr_R2-1.tar.gz && \
 tar -zxf samp037svr*.tar.gz -C /tmp/ && \
 cp -Rf /tmp/samp03/* ~/server/ && \
 rm -rf ~/samp037svr*.tar.gz && \
 rm -rf /tmp/samp03/

RUN sed -i 's/rcon_password changeme/rcon_password Sa-MpDocker2015!/' ~/server/server.cfg
RUN sed -i 's/hostname SA-MP 0.3 Server/hostname SA-MP 0.3 Docker Server/' ~/server/server.cfg
RUN sed -i 's/announce 0/announce 1/' ~/server/server.cfg
RUN sed -i 's/maxplayers 50/maxplayers 1000/' ~/server/server.cfg

ADD run.sh /run.sh
RUN chmod 755 /*.sh

CMD ["/run.sh"]

EXPOSE 21
EXPOSE 7777
