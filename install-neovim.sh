#!/bin/bash

set -euox pipefail

echo "install neovim"

cd /tmp
curl -LO https://github.com/neovim/neovim/releases/download/v0.12.0/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64 /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
sudo ln -sf /opt/nvim/bin/nvim /usr/bin/nvim
