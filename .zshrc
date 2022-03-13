parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' | sed -E 's/\* (develop|master|[0-9]*)-?.*/(\1)/'
}
setopt PROMPT_SUBST

if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi
# export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export DISABLE_AUTO_TITLE=true
export REQUESTS_CA_BUNDLE=/Users/sartori2/Documents/darc/mkdocs/docs/files/ca-bundle.crt
if [ $TERM_PROGRAM = "iTerm.app" ] || [ $USING_ITERM -eq 1 ]; then
    export PROMPT='%B%F{#abe9b3}%n@%m %F{#96CDFB}%5~ %F{#f28fad}$(parse_git_branch) %F{#d9e0ee}$ %b'
    export USING_ITERM=1
else
    export TERM=xterm-256color
    export PROMPT='%B%F{28}%n@%m %F{27}%5~ %f$ %b'
fi
export XDG_CONFIG_HOME=$HOME/.config

source ~/.bash_aliases

tmux_output=`tls 2> /dev/null`
# if [[ "$TERM_PROGRAM" != "vscode" ]]; then
#     if [ -z $tmux_output ]; then
#         tmux
#     fi
#     attached=`tls | grep attached`
#     if [ -z $attached ]; then
#         ta 0
#     fi
#     # alias vi='nvim'
#     # alias vim='nvim'
# fi

eval "$(pyenv init --path)"
eval $(docker-machine env default)

export PATH="$HOME/.poetry/bin:$PATH"

# opam configuration
[[ ! -r /Users/sartori2/.opam/opam-init/init.zsh ]] || source /Users/sartori2/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# Conda configuration
#export PATH="/usr/local/anaconda3/bin:$PATH"
