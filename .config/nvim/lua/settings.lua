local opt = vim.opt
local g = vim.g

opt.autoindent = true
opt.backup = false
opt.cmdheight = 2
opt.errorbells = false
opt.expandtab = true
opt.foldlevelstart = 99
vim.wo.foldmethod = "expr"
vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
opt.hidden = true
opt.lazyredraw = true
opt.linebreak = true
opt.list = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.signcolumn = "yes"
opt.shiftwidth = 4
opt.shortmess:append("c")
opt.showmatch = true
opt.showmode = false
opt.spell = true
opt.spelllang = "en_us"
opt.spellsuggest = "best,9"
opt.swapfile = false
opt.tabstop = 4
opt.termguicolors = true
opt.title = true
opt.updatetime = 300
opt.writebackup = false
opt.laststatus = 3
opt.cmdheight = 1

g.mapleader = " "
