# Guide
Note: Instructions are for MacOS. Realistically, the only thing should change is the package manager.

## Dependencies
The following software is expected to be installed:

 - Iterm2 (or any terminal with true color)
 - fd
 - ripgrep
 - Neovim
 - tmux
 - Bash (ignore if using zsh)
 - Zsh (ignore if using bash)
 - Powerline nerd font on viewing machine 

## Setting Up
### General
  1. Clone this repo into the home directory, merging `conf_files` with `$HOME`.
### Iterm2
  1. Run `brew install --cask iterm2`
  2. Go to Preferences -> Profiles > Default > Colors
  3. Change the foreground to ffffff, background to 1e1e1e, and minimum contrast to 35
### Neovim
  1. Run `brew install neovim fd ripgrep`
  1. Install a Powerline nerd font by doing the following:
       1. Run `brew tap homebrew/cask-fonts`
       1. Install a nerd font by running `brew install --cask font-${NERD_FONT_NAME}`. Note that historically this has been `font-hack-nerd-font`.
       1. Set your terminal font to this font.
  1. Set the terminal font to this
  1. Run `python3 -m pip install --user --upgrade pynvim` (Note: This might need to be run for every pyenv entered, in which case, replace `python3` with `python`)
  1. Open `~/.config/nvim/init.vim` (errors will occur) and run `:PlugInstall`
  1. Reopen Neovim and ensure everything is working. Then run `:UpdateRemotePlugins`
  1. Reopen Neovim. Everything should work!!
