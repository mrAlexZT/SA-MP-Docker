# SA-MP-Docker

FROM centos:centos6

MAINTAINER CKA3KuH

RUN wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN wget http://rpms.famillecollet.com/enterprise/remi-release-6.rpm
RUN rpm -Uvh remi-release-6*.rpm epel-release-6*.rpm
RUN yum update -y && yum upgrade -y
RUN yum install tar proftpd compat-libstdc++-33.i686 -y && yum install libstdc++.i686 -y && yum install libstdc++-devel.i686 -y
RUN chkconfig proftpd on

RUN cd ~ && \
 mkdir ~/server/ && \
 curl -OL http://files.sa-mp.com/samp037svr_R1.tar.gz && \
 tar -zxf samp037svr_R1.tar.gz -C /tmp/ && \
 cp -Rf /tmp/samp03/* ~/server/ && \
 rm -rf ~/samp037svr_R1.tar.gz && \
 rm -rf /tmp/samp03/

RUN sed -i 's/rcon_password changeme/rcon_password Sa-MpDocker2015!/' ~/server/server.cfg
RUN sed -i 's/hostname SA-MP 0.3 Server/hostname SA-MP 0.3 Docker Server/' ~/server/server.cfg
RUN sed -i 's/announce 0/announce 1/' ~/server/server.cfg
RUN sed -i 's/maxplayers 50/maxplayers 1000/' ~/server/server.cfg

ADD run.sh /run.sh
RUN chmod 755 /*.sh

CMD ["/run.sh"]

EXPOSE 7777
