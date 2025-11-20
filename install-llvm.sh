#!/bin/bash

set -euo pipefail

cd /tmp
curl -LO https://github.com/llvm/llvm-project/releases/download/llvmorg-14.0.0/clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
sudo rm -rf /opt/llvm
sudo mkdir -p /opt/llvm
sudo tar -xf clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz -C /opt/llvm
sudo ln -sf /opt/llvm/clang+llvm-14.0.0-x86_64-linux-gnu-ubuntu-18.04/bin/clang-14 /usr/bin/clang-14
