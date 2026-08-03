## Core Env
set -Ux EDITOR nvim
# Command Overrides
function vi;  nvim $argv; end
function vim; nvim $argv; end
function cat;  bat $argv; end
function find; fd $argv; end
function crawl; grep -Irisn $argv; end
function ls; eza $argv; end
function l; eza -alh; end
############################
# Navigation shortcuts
############################
function doc; cd ~/Documents; end
function dl;  cd ~/Downloads; end
function prj; cd ~/Projects; end
############################
# Git shortcuts
############################
function ga; git add $argv; end
function gaa; git add --all; end
function gco; git checkout $argv; end
function gr; git reset $argv; end
function gb; git branch $argv; end
function gs; git status $argv; end
function gc; git commit $argv; end
function gp; git push $argv; end
function gd; git diff $argv; end
function gl; git pull $argv; end

# local bin
fish_add_path $HOME/.local/bin

# cargo
fish_add_path $HOME/.cargo/bin

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

# >>> railway initialize >>>
source "$HOME/.railway/env.fish"
# <<< railway initialize <<<

# Composio CLI
set --export COMPOSIO_INSTALL_DIR "/home/jsp/.composio"
set --export PATH $COMPOSIO_INSTALL_DIR $PATH
