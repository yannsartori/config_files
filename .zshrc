if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export CLICOLOR=1
export TERM="xterm-256color"
export LSCOLORS=GxFxCxDxBxegedabagaced
export PROMPT='%B%F{28}%n@%m %F{27}%5~ %f$ %b'
alias pip="python3 -m pip"
