neofetch --disable memory
base="$HOME/.config/zsh/butter"

# Order here is important
source "$base/functions.zsh"
source "$base/opts.zsh"
source "$base/xdg.zsh"
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
