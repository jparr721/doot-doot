DISABLE_AUTO_UPDATE="true"
ZSH_DISABLE_COMPFIX="true"
export ZSH=$HOME/.oh-my-zsh

export EDITOR=$(which nvim)

export TERM=xterm-color
export PATH="$HOME/.yarn/bin:$PATH"
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Library/Python/3.8/bin
export PATH="$PATH:$HOME/bin"
export PATH="$PATH:$HOME/vcpkg"

ZSH_THEME="agnoster"

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
alias doc='cd ~/Documents'
alias dl='cd ~/Downloads'
alias prj='cd ~/Documents/Projects'
alias vi='nvim'
alias vim='nvim'
alias vnv='virtualenv -p `which python3` venv && source venv/bin/activate && pip install neovim pylint black isort debugpy'
alias tmux="tmux -2"
alias gk='cat ~/.sleuthy/.gitkey | xclip -selection clipboard'
alias python="python3"
alias ls="eza"
alias find="fd"
alias cat="bat"
alias df="duf"
alias du="dust"
alias crawl="grep -Irisn"
alias pip="pip3"
alias sshgrace="ssh jp2844@grace.hpc.yale.edu"
alias sshjelly="ssh jp2844@jellybean.cs.yale.edu"
alias sshhaomiao="ssh hw524@172.29.249.65"
alias mathenv="source $HOME/venvs/math/bin/activate"
alias fenv="source $HOME/venvs/sim/bin/activate"

# Git Commands
alias gco="git checkout"
alias gr="git reset"
alias gs="git status"

# Anaconda
alias ca="conda activate"
alias ci="conda install"
alias cx="conda env export --no-build"
alias cda="conda deactivate"

# Fix annoying ctrl-s shit
stty -ixon

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias notary='echo "# $(date)" >> $HOME/notary.md && echo '' >> $HOME/notary.md && $EDITOR $HOME/notary.md'
alias notary_rm='rm -rf $HOME/notary.md'

export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";
export VCPKG_ROOT="/Users/jarredparr/vcpkg"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

eval $(thefuck --alias)

# bun completions
[ -s "/Users/jarredparr/.reflex/.bun/_bun" ] && source "/Users/jarredparr/.reflex/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.reflex/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

. ~/.linuxify
