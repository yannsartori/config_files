function copypath {
  # If no argument passed, use current directory
  local file="${1:-.}"

  # If argument is not an absolute path, prepend $PWD
  [[ $file = /* ]] || file="$PWD/$file"
  print -n "${file:a}" | pbcopy
}

function open_command() {
  local open_cmd

  # define the open command
  case "$OSTYPE" in
    darwin*)  open_cmd='open' ;;
    cygwin*)  open_cmd='cygstart' ;;
    linux*)   [[ "$(uname -r)" != *icrosoft* ]] && open_cmd='nohup xdg-open' || {
                open_cmd='cmd.exe /c start ""'
                [[ -e "$1" ]] && { 1="$(wslpath -w "${1:a}")" || return 1 }
              } ;;
    msys*)    open_cmd='start ""' ;;
    *)        echo "Platform $OSTYPE not supported"
              return 1
              ;;
  esac

  ${=open_cmd} "$@" &>/dev/null
}

function gdiff() {
    cd $(git rev-parse --show-toplevel)
    preview="git diff $@ -- {-1} | delta"
    git diff $@ --name-only | fzf -m --ansi --preview $preview --bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down
    cd - &> /dev/null
}

function lazy_load_nvm() {
    unset -f npm node nvm
    [[ -s "$NVM_DIR/nvm.sh" ]] && source "$NVM_DIR/nvm.sh"
}

function npm() {
    lazy_load_nvm
    npm $@
}

function node() {
    lazy_load_nvm
    node $@
}

function nvm() {
    lazy_load_nvm
    nvm $@
}
