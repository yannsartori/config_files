# Base stuff
export CLICOLOR=1
export CPPFLAGS="-I/usr/local/opt/readline/include"
export DISABLE_AUTO_TITLE=true
export EDITOR=nvim
export HISTFILE=~/.zsh_history
export HISTSIZE=999999999
export LDFLAGS="-L/usr/local/opt/readline/lib"
export LSCOLORS=GxFxCxDxBxegedabagaced
export REQUESTS_CA_BUNDLE=/Users/sartori2/Documents/darc/mkdocs/docs/files/ca-bundle.crt
export SAVEHIST=$HISTSIZE
export VISUAL=nvim
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_RUNTIME_DIR=$HOME/.run
export XDG_STATE_HOME=$HOME/.local/state
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=0'
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Force everything to use XDG
# Ruby bundle
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME"/bundle
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME"/bundle
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME"/bundle
# Rust cargo
export CARGO_HOME="$XDG_DATA_HOME"/cargo
# Conda
export CONDARC="$XDG_CONFIG_HOME"/conda/condarc
# Docker
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
# Jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
# NuGet
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
# OPAM
export OPAMROOT="$XDG_DATA_HOME"/opam
# Poetry
export POETRY_HOME="$XDG_CONFIG_HOME"/poetry
# Pyenv
export PYENV_ROOT="$XDG_DATA_HOME"/pyenv
# Ncurses
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
# NodeJS
export NODE_REPL_HISTORY="$XDG_DATA_HOME"/node_repl_history
# NPM
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME"/npm/config
