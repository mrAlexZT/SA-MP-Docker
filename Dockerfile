# SA-MP-Docker

FROM centos:centos6

MAINTAINER CKA3KuH

RUN yum update -y
RUN yum install tar -y

RUN cd ~
RUN mkdir ~/server/
RUN curl -OL http://files.sa-mp.com/samp037svr_R1.tar.gz
RUN tar -zxf samp037svr_R1.tar.gz -C /tmp/
RUN cp -Rf /tmp/samp03/* ~/server/
RUN rm -rf ~/samp037svr_R1.tar.gz
RUN rm -rf /tmp/samp03/

#RUN cd ~ && mkdir ~/server && \
# curl -OL http://files.sa-mp.com/samp037svr_R1.tar.gz && \
# tar -zxf samp037svr_R1.tar.gz -C /tmp  && \
# cp -Rf /tmp/samp03/* ~/server && \
# rm -rf ~/samp037svr_R1.tar.gz && \
# rm -rf /tmp/samp03/
 
EXPOSE 7777
