#!/bin/bash

set -euox pipefail

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv $HOME/.zshrc $HOME/.zshrc.old

sudo ln -s $HOME/doot-doot/.config/nvim $HOME/.config/nvim
sudo ln -s $HOME/doot-doot/.zshrc $HOME/.zshrc

sudo apt install -y exa
sudo apt install -y bat
sudo apt install -y fd-find && sudo ln -s $(which fdfind) $HOME/.local/bin/fd

echo "Getting node"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
nvm install 16.13.1 && nvm use 16.13.1
