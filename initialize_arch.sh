#!/bin/bash
#Ask for admin Password
sudo -v


echo "Now initializing arch linux..."
echo "Grabbing vim"
sudo pacman -S vim

echo "Initializing git"
sudo pacman -S git

echo "Making directories..."
mkdir -p ~/Desktop/Programming 
mkdir ~/scripts

echo "Oh-my-zsh"
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh
# Make sure to choose a zsh theme!
pip install --user powerline-status
git clone https://github.com/powerline/fonts
cd fonts && ./install.sh
cd .. && rm -rf fonts
echo "Make sure to come back here and set your font"


echo "Installing pathogen..."
echo "Setting up environment"
mkdir -p ~/.vim/autoload ~/.vim/bundle && \ curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

echo "Grabbing NERDtree"
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree

echo "Grab repos..."
git clone https://github.com/jparr721/doot-doot.git ~/Desktop/Programming

touch ~/.vimrc
cd ~/Desktop/Programming/doot-doot && cat vimrc >> ~/.vimrc 

echo "Loading in color scheme."
cd ~/.vim/bundle && git clone https://github.com/ajmwagar/vim-deus.git
