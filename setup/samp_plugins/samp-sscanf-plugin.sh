#!/bin/bash

set -e

cd /opt/setup-os/samp_plugins/
git clone https://github.com/maddinat0r/sscanf.git
cd /opt/setup-os/samp_plugins/sscanf/
make
mkdir -p ~/server/plugins/
cp /opt/setup-os/samp_plugins/sscanf/sscanf.so ~/server/plugins/
echo 'plugins sscanf.so' >> ~/server/server.cfg

exit 0
