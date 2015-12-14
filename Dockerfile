# SA-MP-Docker

FROM centos:latest

MAINTAINER CKA3KuH

ADD setup /opt/setup-os
RUN chmod +x /opt/setup-os/*.sh
RUN /opt/setup-os/prepare_os.sh

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
