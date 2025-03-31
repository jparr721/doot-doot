# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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

ZSH_THEME="powerlevel10k/powerlevel10k"

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
alias python="python3"
alias ls="eza"
alias find="fd"
alias cat="bat"
alias df="duf"
alias du="dust"
alias crawl="grep -Irisn"
alias pip="pip3"
alias hack='docker run -it --name kali --network=host --privileged -v $HOME/Kali:/data kalilinux/kali-rolling'

# Git Commands
alias gco="git checkout"
alias gr="git reset"
alias gs="git status"

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

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
