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
  2. Install a Powerline nerd font by doing the following:
       1. Run `brew tap homebrew/cask-fonts`
       2. Install a nerd font by running `brew install --cask font-${NERD_FONT_NAME}`. Note that historically this has been `font-hack-nerd-font`.
       3. Set your terminal font to this font.
  4.Set the terminal font to this
  5. Run `python3 -m pip install --user --upgrade pynvim` (Note: This might need to be run for every pyenv entered, in which case, replace `python3` with `python`)
  6. Open `~/.config/nvim/init.vim` (errors will occur) and run `:PlugInstall`
  7. Reopen Neovim and ensure everything is working. Then run `:UpdateRemotePlugins`
  8. Reopen Neovim. Everything should work!!
