# SA-MP-Docker

FROM centos:centos6

MAINTAINER CKA3KuH

RUN yum update -y
RUN yum install tar -y

RUN cd ~ && \
 mkdir ~/server/ && \
 curl -OL http://files.sa-mp.com/samp037svr_R1.tar.gz && \
 tar -zxf samp037svr_R1.tar.gz -C /tmp/ && \
 cp -Rf /tmp/samp03/* ~/server/ && \
 rm -rf ~/samp037svr_R1.tar.gz && \
 rm -rf /tmp/samp03/

RUN sed -i 's/rcon_password changeme/rcon_password CKA3KuH2015!/' ~/server/server.cfg
 
EXPOSE 7777

CMD ["cd ~/server/ ; ./samp03svr&"]
