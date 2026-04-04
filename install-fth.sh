#!/bin/bash

set -euo pipefail

curl -LO https://github.com/jparr721/fast-that-hash/releases/latest/download/fth-macos-arm64

mv fth-macos-arm64 fth
chmod +x fth

sudo mkdir -p /opt/fth/bin/
sudo mv fth /opt/fth/bin/
sudo ln -sf /opt/fth/bin/fth /usr/local/bin/fth
