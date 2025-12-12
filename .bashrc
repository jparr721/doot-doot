# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
source ~/.local/share/omarchy/default/bash/rc

# Add your own exports, aliases, and functions here.
#
# Make an alias for invoking commands you use constantly
# alias p='python'
alias vim='nvim'
alias l='ls -al'

alias prj="cd $HOME/Projects"
alias dl="cd $HOME/Downloads"

alias gaa="git add --all"
alias gco="git checkout"
alias gr="git reset"
alias gb="git branch"
alias gs="git status"
alias gc="git commit"
alias gp="git push"
alias gd="git diff"

. "$HOME/.cargo/env"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# go
export PATH="$HOME/go/bin:$PATH"

# local bin
export PATH="$HOME/.local/bin:$PATH"
