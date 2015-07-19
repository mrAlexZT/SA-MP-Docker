# SA-MP-Docker

FROM centos:centos6

MAINTAINER CKA3KuH

RUN yum update -y

RUN cd ~ && mkdir ~/server && \
curl -OL http://files.sa-mp.com/samp037svr_R1.tar.gz && \
tar -zxf samp037svr_R1.tar.gz -C /tmp  && \
cp -Rf /tmp/samp03/* ~/server && \
rm -rf ~/samp037svr_R1.tar.gz && \
rm -rf /tmp/samp03/
 
EXPOSE 7777
