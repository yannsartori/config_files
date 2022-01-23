# Guide
Note: Instructions are for MacOS. Realistically, the only thing should change is the package manager.

## Dependencies
The following software is expected to be installed:

 - Neovim
 - tmux
 - Bash (ignore if using zsh)
 - Zsh (ignore if using bash)
 - Powerline nerd font on viewing machine 

## Setting Up
### General
  1. Clone this repo into the home directory, merging `conf_files` with `$HOME`.
### Neovim
  1. Run `brew install neovim`
  2. Install a Powerline nerd font [from this link](https://github.com/ryanoasis/nerd-fonts#font-installation). Note that space mono nerd font, size 14 has typically been used. Set the terminal font to this
  3. Run `python3 -m pip install --user --upgrade pynvim` (Note: This might need to be run for every pyenv entered, in which case, replace `python3` with `python`)
  4. Open `~/.config/nvim/init.vim` (errors will occur) and run `:PlugInstall`
  5. Reopen Neovim and ensure everything is working.
