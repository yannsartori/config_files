if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

	autoload -Uz compinit
	compinit
fi
export JAVA_HOME=/Users/yannsartori/.p2/pool/plugins/org.eclipse.justj.openjdk.hotspot.jre.full.macosx.x86_64_15.0.1.v20201027-0507/jre
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
if [ $TERM_PROGRAM = "iTerm.app" ] || [ $USING_ITERM -eq 1 ]; then
    export PROMPT='%B%F{#abe9b3}%n@%m %F{#96CDFB}%5~ %F{#d9e0ee}$ %b'
    export USING_ITERM=1
else
    export TERM=xterm-256color
    export PROMPT='%B%F{28}%n@%m %F{27}%5~ %f$ %b'
fi
export PATH=/usr/local/smlnj/bin:"$PATH"
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -t"
alias tutch=/Users/yannsartori/Documents/tutch-0.53/bin/tutch
alias gcc=/usr/local/bin/gcc-10

eval $(opam config env)

export PATH="$HOME/.poetry/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
