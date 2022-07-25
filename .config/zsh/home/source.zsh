[[ ! -r /Users/sartori2/.opam/opam-init/init.zsh ]] || source /Users/sartori2/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
[ -f "/Users/yannsartori/.ghcup/env" ] && source "/Users/yannsartori/.ghcup/env" # ghcup-env
[ -f "/Users/yannsartori/.local/share/cargo/env" ] && source "/Users/yannsartori/.local/share/cargo/env" # cargo
source <(ng completion script) # Load Angular CLI autocompletion.
