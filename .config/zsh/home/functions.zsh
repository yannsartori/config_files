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

function gcheckout {
  # Lower the pattern and replace spaces with dashes
  local glob="${*:l:gs/ /-}"
  if [[ -z "$glob" ]]; then
    print "Provide a branch glob"
    return 1
  fi

  # Verify we are in a git repo
  git rev-parse --is-inside-work-tree &> /dev/null
  if [[ $? -ne 0 ]]; then
    print "Not in git repo"
    return 1
  fi

  # List the remotes (in case we don't have it locally), get the first match,
  # and strip the leading `origin/`
  branch_name=$(git branch -lr | grep "$glob" | head -n 1 | xargs)
  branch_name="${branch_name:gs/origin\///}"
  if [[ -z "$branch_name" ]]; then
    print "Could not find branch with glob ${glob}"
    return 1
  fi

  git checkout "$branch_name"
}

