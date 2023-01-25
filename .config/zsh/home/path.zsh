zsh_plugins="$HOME.config/zsh/plugins"
path=(
    "$HOME/.local/share/nvim/lsp_servers/taplo"
    "$HOME/.local/bin"
    "$XDG_CONFIG_HOME/poetry/bin"
    "$XDG_CONFIG_HOME/cargo/bin"
    "$HOME/.local/share/cargo/bin"
    "$path[@]")

export PATH
