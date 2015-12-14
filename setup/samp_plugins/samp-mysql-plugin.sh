#!/bin/bash

set -e

cd /opt/setup-os/samp_plugins/
git clone https://github.com/pBlueG/SA-MP-MySQL.git
cd /opt/setup-os/samp_plugins/SA-MP-MySQL/
mkdir build && cd build
#cmake ../ -DCMAKE_BUILD_TYPE=Release -DBUILD_TESTING=OFF

mkdir -p ~/server/plugins/
#cp /opt/setup-os/samp_plugins/samp-streamer-plugin/bin/linux/Release/streamer.so ~/server/plugins/
#echo 'plugins streamer.so' >> ~/server/server.cfg

exit 0
