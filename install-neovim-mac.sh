#!/bin/bash

set -euo pipefail

echo "installing neovim"

cd /tmp
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-macos-arm64.tar.gz
sudo rm -rf /opt/nvim
xattr -c nvim-macos-arm64.tar.gz
sudo tar -C /opt -zxvf nvim-macos-arm64.tar.gz
sudo mv /opt/nvim-macos-arm64 /opt/nvim
sudo mkdir -p /usr/local/bin
sudo ln -sf /opt/nvim/bin/nvim /usr/local/bin/nvim
