# Directories
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

# Tmux
alias t="tmux"
alias ta="t a -t"
alias tls="t ls"
alias tn="t new -s"
alias td="./.tmux.startup.sh"

# Nvim
alias vim='nvim'

# System binaries
alias ls='lsd'
alias grep='grep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'
alias cat='bat -P'

# Random crap
alias yarn='yarn --use-yarnrc "$XDG_CONFIG_HOME/yarn/config"'
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

alias -s {zsh, yml,yaml}=nvim
