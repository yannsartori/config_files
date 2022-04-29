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
alias vi='nvim'
alias vim='nvim'

# System binaries
alias ls='lsd'
alias grep='grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}'

alias -s {zsh, yml,yaml}=nvim
