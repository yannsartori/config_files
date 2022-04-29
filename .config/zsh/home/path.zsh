zsh_plugins="$HOME.config/zsh/plugins"
path=(
    "$zsh_plugins/diff-so-fancy:"
    "$HOME/.local/share/nvim/lsp_servers/taplo"
    "$HOME/.poetry/bin"
    "$HOME/.cargo/bin"
    "$path[@]")

export PATH
