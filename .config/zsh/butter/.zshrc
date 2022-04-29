neofetch --disable memory
base="$HOME/.config/zsh/butter"

# Order here is important
source "$base/functions.zsh"
source "$base/opts.zsh"
source "$base/vars.zsh"
source "$base/path.zsh"
source "$base/source.zsh"
source "$base/alias.zsh"
source "$base/evals.zsh"
source "$base/mappings.zsh"

for plugin in $base/../plugins/*.*; do
    source "$plugin"
done

source "$base/../themes/spaceship.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
# __conda_setup="$('/Users/sartori2/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
# if [ $? -eq 0 ]; then
#     eval "$__conda_setup"
# else
#     if [ -f "/Users/sartori2/miniconda3/etc/profile.d/conda.sh" ]; then
#         . "/Users/sartori2/miniconda3/etc/profile.d/conda.sh"
#     else
#         export PATH="/Users/sartori2/miniconda3/bin:$PATH"
#     fi
# fi
# unset __conda_setup
# <<< conda initialize <<<

