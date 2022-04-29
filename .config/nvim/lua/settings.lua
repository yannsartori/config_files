local opt = vim.opt
local g = vim.g

opt.backup = false
opt.cmdheight = 2
opt.errorbells = false
opt.expandtab = true
opt.foldlevelstart = 99
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
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

g.mapleader = " "
-- I forgot why this was added, but seems intriguing
g.vimsyn_embed = "lPr"
