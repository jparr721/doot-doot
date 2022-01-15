DISABLE_AUTO_UPDATE="true"
ZSH_DISABLE_COMPFIX="true"
export ZSH=$HOME/.oh-my-zsh

export EDITOR=/usr/bin/nvim

export TERM=xterm-color
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.local/bin
export PATH="$PATH:$HOME/bin"

ZSH_THEME="agnoster"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
alias home='cd ~/Desktop'
alias work='cd ~/Work'
alias code='cd ~/Code'
alias dl='cd ~/Downloads'
alias vi='nvim'
alias vim='nvim'
alias vnv='virtualenv venv && source venv/bin/activate && pip install neovim flake8 black isort debugpy'
alias tmux="tmux -2"
alias gk='cat ~/.sleuthy/.gitkey | xclip -selection clipboard'
alias python="python3"
alias ls="exa"
alias find="fd"
alias cat="batcat"

# Git Commands
alias gco="git checkout"
alias gr="git reset"
alias gs="git status"
alias gpull="git pull"

# Anaconda
alias ca="conda activate"
alias ci="conda install"
alias cx="conda env export --no-build"
alias cda="conda deactivate"

# Fix annoying ctrl-s shit
stty -ixon

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias notary='echo "# $(date)" >> $HOME/notary.md && echo '' >> $HOME/notary.md && $EDITOR $HOME/notary.md'
alias notary_rm='rm -rf $HOME/notary.md'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/nightmare/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/nightmare/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/nightmare/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/nightmare/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

