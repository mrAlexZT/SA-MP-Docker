#!/bin/bash

set -e

cd ~ && \
 mkdir ~/server/ && \
 curl -OL http://files.sa-mp.com/samp037svr_R2-1.tar.gz && \
 tar -zxf samp037svr*.tar.gz -C /tmp/ && \
 cp -Rf /tmp/samp03/* ~/server/ && \
 rm -rf ~/samp037svr*.tar.gz && \
 rm -rf /tmp/samp03/
 
echo 'logtimeformat [%d/%m/%Y %H:%M:%S]
chatlogging 0
messageholelimit 3000
lagcompmode 1' >> ~/server/server.cfg

sed -i 's/rcon_password changeme/rcon_password Sa-MpDocker2015!/' ~/server/server.cfg
sed -i 's/hostname SA-MP 0.3 Server/hostname SA-MP 0.3 Docker Server/' ~/server/server.cfg
sed -i 's/announce 0/announce 1/' ~/server/server.cfg
sed -i 's/maxplayers 50/maxplayers 1000/' ~/server/server.cfg

exit 0
