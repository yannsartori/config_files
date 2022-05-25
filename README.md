# Guide

Note: Instructions are for MacOS. Realistically, the only thing should change is
the package manager.

## Setting Up

### General

  1. Clone this repo into the home directory, merging `conf_files` with `$HOME`.

### Zsh

Add a soft link for `.zshrc` to point to `.config/zsh/name_of_machine/.zshrc`

### install.sh

Once you resource the `.zshrc`, run the `install.sh` to install the
dependencies. After the installations are finished, verify that the `.zshrc`
file is unchanged (some programs modify the path unnecessarily). Once this is
complete, resource the `.zshrc` file.

### Neovim

  1. Run `python3 -m pip install --user --upgrade pynvim` (Note: This might
    need to be run for every pyenv entered, in which case, replace `python3`
    with `python`)
  1. Open `~/.config/nvim/init.lua` (errors will occur) and run `:PlugInstall`
  1. Reopen Neovim. Everything should work!!
