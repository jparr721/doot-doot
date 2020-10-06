export ZSH=$HOME/.oh-my-zsh

export EDITOR=/usr/bin/vim
export NODE_ENV=development
export TERM=xterm-color

export TESSDATA_PREFIX=/usr/share/tessdata
export GOROOT=/usr/lib/go
export GOPATH=$HOME/Code/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:/usr/lib/go/bin:$GOPATH/bin
export TERM=xterm-color
export PATH=$PATH:$HOME/.local/bin
export PATH="$(yarn global bin):$PATH"

ZSH_THEME="nanotech"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
alias home='cd ~/Desktop'
alias work='cd ~/Work'
alias code='cd ~/Code'
alias lock='systemctl hibernate'
alias sleep='systemctl suspend'
alias wifi='nmcli dev wifi con'
alias sec='cd ~/Infosec'
alias ml='cd ~/ML'
alias resin='sudo systemctl start dhcpcd'
alias dl='cd ~/Downloads'
alias vi='vim'
alias vnv='virtualenv venv && source venv/bin/activate && pip install neovim flake8 black jedi'
alias tmux="tmux -2"
alias gk='cat ~/.sleuthy/.gitkey | xclip -selection clipboard'

# Fix annoying ctrl-s shit
stty -ixon

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval
            fuck () {
                TF_PYTHONIOENCODING=$PYTHONIOENCODING;
                export TF_SHELL=zsh;
                export TF_ALIAS=fuck;
                TF_SHELL_ALIASES=$(alias);
                export TF_SHELL_ALIASES;
                TF_HISTORY="$(fc -ln -10)";
                export TF_HISTORY;
                export PYTHONIOENCODING=utf-8;
                TF_CMD=$(
                    thefuck THEFUCK_ARGUMENT_PLACEHOLDER $@
                ) && eval $TF_CMD;
                unset TF_HISTORY;
                export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
                test -n "$TF_CMD" && print -s $TF_CMD
            }

source $HOME/.cargo/env
alias notary='echo "# $(date)" >> /home/drax/notary.md && echo '' >> /home/drax/notary.md && $EDITOR /home/drax/notary.md'
alias notary_rm='rm -rf /home/drax/notary.md'

export SPICETIFY_INSTALL="/home/drax/spicetify-cli"
export PATH="$SPICETIFY_INSTALL:$PATH"

# opam configuration
test -r /home/drax/.opam/opam-init/init.zsh && . /home/drax/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
