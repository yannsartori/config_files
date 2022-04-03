base="$HOME/.config/zsh/home"
# Has to be set before using the theme
SPACESHIP_PROMPT_DEFAULT_PREFIX=""
source "$base/../themes/spaceship-prompt/spaceship.zsh"
spaceship_git_branch() {
  [[ $SPACESHIP_GIT_BRANCH_SHOW == false ]] && return

  local git_current_branch="$vcs_info_msg_0_"
  [[ -z "$git_current_branch" ]] && return

  git_current_branch="${git_current_branch#heads/}"
  git_current_branch="${git_current_branch/.../}"
  # Extract out everything before - (or the entire branch, if none)
  git_current_branch=$(echo $git_current_branch | sed -E 's/([^-]*)-?.*/\1/')
  # Add # if numeric
  if [[ $git_current_branch =~ "[0-9]+" ]]; then
      git_current_branch="#$git_current_branch"
  fi

  spaceship::section \
    "$SPACESHIP_GIT_BRANCH_COLOR" \
    "$SPACESHIP_GIT_BRANCH_PREFIX${git_current_branch}$SPACESHIP_GIT_BRANCH_SUFFIX"
}
SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  node          # Node.js section
  haskell       # Haskell Stack section
  docker        # Docker section
  venv          # virtualenv section
  conda         # conda virtualenv section
  pyenv         # Pyenv section
  exec_time     # Execution time
  line_sep      # Line break
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_HG_SHOW=false
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_RUBY_SHOW=false
SPACESHIP_ELM_SHOW=false
SPACESHIP_ELIXIR_SHOW=false
SPACESHIP_XCODE_SHOW_LOCAL=false
SPACESHIP_SWIFT_SHOW_LOCAL=false
SPACESHIP_GOLANG_SHOW=false
SPACESHIP_PHP_SHOW=false
SPACESHIP_RUST_SHOW=false
SPACESHIP_JULIA_SHOW=false
SPACESHIP_AWS_SHOW=false
SPACESHIP_DOTNET_SHOW=false
SPACESHIP_EMBER_SHOW=false
SPACESHIP_KUBECONTEXT_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_TERRAFORM_SHOW=false
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_VI_MODE_SHOW=false
SPACESHIP_JOBS_SHOW=false

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_SEPARATE_LINE=true
SPACESHIP_CHAR_SYMBOL=❯
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_GIT_STATUS_STASHED=""
SPACESHIP_GIT_STATUS_UNTRACKED=""
SPACESHIP_GIT_PREFIX=""
