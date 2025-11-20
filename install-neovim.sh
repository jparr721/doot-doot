#!/bin/bash

set -euox pipefail

echo "install neovim"

cd /tmp
# TODO - Switch back once 12 releases
# curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64 /opt/nvim
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo mv /opt/nvim-linux-x86_64 /opt/nvim
sudo ln -sf /opt/nvim/bin/nvim /usr/bin/nvim
