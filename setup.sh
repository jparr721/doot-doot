#!/bin/bash

set -euox pipefail

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv $HOME/.zshrc $HOME/.zshrc.old

sudo ln -s $HOME/doot-doot/.config/nvim $HOME/.config/nvim
sudo ln -s $HOME/doot-doot/.zshrc $HOME/.zshrc
sudo ln -s $HOME/doot-doot/.tmux.conf $HOME/.tmux.conf

sudo apt install -y tmux
sudo apt install -y exa
sudo apt install -y bat
sudo apt install -y fd-find && sudo ln -s $(which fdfind) $HOME/.local/bin/fd

echo "Getting node"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install 16.13.1 && nvm use 16.13.1

echo "Getting anaconda"
cd /tmp
curl -O https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh
chmod +x Anaconda3-2021.05-Linux-x86_64.sh && sh -c Anaconda3-2021.05-Linux-x86_64.sh
