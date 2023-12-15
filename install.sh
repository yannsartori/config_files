# First, make you sure you run `sudo visudo` and add the current account (some packages require sudo)

# Get brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Non casks
brew install \
    bat \
    colima \
    docker \
    docker-compose \
    fd \
    fzf \
    git-delta \
    lazygit \
    lsd \
    neofetch \
    neovim \
    node \
    pyenv \
    ripgrep \
    rust \
    thefuck \
    tmux \
    yarn \
    zk \
    zsh-syntax-highlighting

# Casks
brew tap homebrew/cask-fonts
brew install --cask font-fira-mono-nerd-font font-liberation-nerd-font alacritty

# Npm installations
npm install --global yarn @angular/language-service@next typescript @angular/language-server markdownlint markdownlint-cli
# Cargo installations
cargo install stylua

# Install poetry
pyenv install 3.9.12
curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python -

