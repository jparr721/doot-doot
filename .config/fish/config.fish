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
