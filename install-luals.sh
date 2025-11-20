#!/bin/bash

set -euox pipefail

echo "install luals"

cd /tmp
curl -LO https://github.com/LuaLS/lua-language-server/releases/download/3.15.0/lua-language-server-3.15.0-linux-x64.tar.gz
sudo rm -rf /opt/lua-language-server
sudo mkdir -p /opt/lua-language-server
sudo tar -C /opt/lua-language-server -xzf lua-language-server-3.15.0-linux-x64.tar.gz
sudo ln -sf /opt/lua-language-server/bin/lua-language-server /usr/bin/lua-language-server
sudo mkdir -p /opt/lua-language-server/log/cache
sudo chown -R $USER:$USER /opt/lua-language-server/log
