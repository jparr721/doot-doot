## Core Env
set -Ux EDITOR nvim

# Command Overrides
function vi;  nvim $argv; end
function vim; nvim $argv; end
function cat;  batcat $argv; end
function find; fdfind $argv; end
function crawl; grep -Irisn $argv; end
function tmux; tmux -2 $argv; end
function l; ls -alh; end

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
