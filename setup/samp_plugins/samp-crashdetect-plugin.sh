#!/bin/bash

set -e

cd /opt/setup-os/samp_plugins/
git clone https://github.com/samp-incognito/samp-streamer-plugin.git
cd /opt/setup-os/samp_plugins/samp-streamer-plugin/
make
mkdir -p ~/server/plugins/
cp /opt/setup-os/samp_plugins/samp-streamer-plugin/bin/linux/Release/streamer.so ~/server/plugins/
echo 'plugins streamer.so' >> ~/server/server.cfg

exit 0
