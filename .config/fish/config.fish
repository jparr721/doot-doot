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

# local bin
fish_add_path $HOME/.local/bin

# cargo
fish_add_path $HOME/.cargo/bin

# bun (also covers omp + other bun-installed CLIs)
if test -d "$HOME/.bun/bin"
    fish_add_path "$HOME/.bun/bin"
end


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv fish)"

# >>> railway initialize >>>
source "$HOME/.railway/env.fish"
# <<< railway initialize <<<

# Composio CLI
set --export COMPOSIO_INSTALL_DIR "/home/jsp/.composio"
set --export PATH $COMPOSIO_INSTALL_DIR $PATH

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/private/tmp/google-cloud-sdk/path.fish.inc' ]; . '/private/tmp/google-cloud-sdk/path.fish.inc'; end

# Pi
fish_add_path "/Users/jarredparr/.local/share/fnm/node-versions/v25.6.0/installation/bin"
