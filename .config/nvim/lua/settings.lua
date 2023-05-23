local opt = vim.opt
local g = vim.g

vim.loader.enable()
opt.autoindent = true
opt.backup = false
opt.cmdheight = 1
opt.errorbells = false
opt.expandtab = true
opt.foldenable = true
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.hidden = true
opt.laststatus = 3
opt.lazyredraw = true
opt.linebreak = true
opt.list = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.shiftwidth = 4
opt.shortmess:append("c")
opt.showmatch = true
opt.showcmd = false
opt.showmode = false
opt.signcolumn = "yes"
opt.spell = true
opt.spelllang = "en_us"
opt.spellsuggest = "best,9"
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.title = true
opt.updatetime = 300
opt.writebackup = false

g.mapleader = " "
