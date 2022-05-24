zsh_plugins="$HOME.config/zsh/plugins"
path=(
    "$zsh_plugins/diff-so-fancy:"
    "$HOME/.local/share/nvim/lsp_servers/taplo"
    "$HOME/.local/bin"
    "$XDG_CONFIG_HOME/poetry/bin"
    "$XDG_CONFIG_HOME/cargo/bin"
    "$path[@]")

export PATH
