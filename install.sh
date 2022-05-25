# First, make you sure you run `sudo visudo` and add the current account (some packages require sudo)

# Get brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Non casks
brew install \
    bat \
    diff-so-fancy \
    fd \
    lazygit \
    lsd \
    neofetch \
    node \
    pyenv \
    ripgrep \
    rust \
    thefuck \
    tmux \
    yarn 
    zk
# Bleeding edge
brew install --HEAD neovim

# Casks
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font alacritty

# Npm installations
npm install --global yarn @angular/language-service@next typescript @angular/language-server markdownlint markdownlint-cli
# Cargo installations
cargo install stylua

# Install vim.plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install poetry
pyenv install 3.9.12
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

