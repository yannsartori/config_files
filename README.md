# Guide
## Dependencies
The following software is expected to be installed:

 - Neovim
 - tmux
 - Bash (ignore if using zsh)
 - Zsh (ignore if using bash)
 - Powerline font on viewing machine

## Setting Up
  1. If setting up neovim, make sure to run `python3 -m pip install --user --upgrade pynvim`
  3. Clone this repo into the home directory
  4. Install the following brew packages: `brew install cmake python go nodejs mono`
  5. Open up Neovim and run `:PlugInstall`
  6. cd into `$HOME/.local/share/nvim/plugged/YouCompleteMe` and run `python3 install.py --all`
