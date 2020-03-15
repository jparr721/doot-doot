echo "Installing and configuring tools"


cd /home/skeletor

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
rm -rf ~/.zshrc

git clone https://github.com/jparr721/doot-doot.git /home/skeletor/doot-doot

mkdir -p /home/skeletor/.config/nvim/
ln -s /home/skeletor/doot-doot/init.vim /home/skeletor/.config/nvim/init.vim
ln -s /home/skeletor/doot-doot/tmux.conf /home/skeletor/.tmux.conf
ln -s /home/skeletor/doot-doot/.zshrc /home/skeletor/.zshrc
ln -s /home/skeletor/doot-doot/love.zsh-theme /home/skeletor/.oh-my-zsh/themes

curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
sh ./msfinstall
pip3 install --user wheel pwntools
