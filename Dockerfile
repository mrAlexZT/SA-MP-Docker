# SA-MP-Docker

FROM centos:latest

MAINTAINER CKA3KuH

ADD setup /opt/setup-os
RUN chmod -R +x /opt/setup-os/*.sh
RUN /opt/setup-os/prepare_os.sh

ADD run.sh /run.sh
RUN chmod 755 /*.sh

CMD ["/run.sh"]

EXPOSE 21
EXPOSE 7777
