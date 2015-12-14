# SA-MP-Docker

FROM centos:latest

MAINTAINER CKA3KuH

ADD setup /opt/setup-os
RUN find /opt/setup-os/ -name "*.sh" -exec chmod +x {} \;
RUN /opt/setup-os/prepare_os.sh
RUN /opt/setup-os/install_samp.sh

RUN /opt/setup-os/samp_plugins/samp-crashdetect-plugin.sh
RUN /opt/setup-os/samp_plugins/samp-mysql-plugin.sh
RUN /opt/setup-os/samp_plugins/samp-streamer-plugin.sh

ADD run.sh /run.sh
RUN chmod 755 /*.sh

CMD ["/run.sh"]

EXPOSE 21
EXPOSE 7777
