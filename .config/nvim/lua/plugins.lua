local Plug = vim.fn["plug#"]
local call = vim.call
local cmd = vim.cmd

call("plug#begin")
-- Aesthetic Plugins {{
Plug("akinsho/bufferline.nvim")
Plug("catppuccin/nvim", { as = "catppuccin" })
Plug("feline-nvim/feline.nvim")
Plug("kyazdani42/nvim-web-devicons")
Plug("lukas-reineke/indent-blankline.nvim")
-- }}

-- Usability Plugins {{
Plug("dhruvasagar/vim-zoom")
Plug("dstein64/vim-startuptime")
Plug("kyazdani42/nvim-tree.lua")
Plug("lewis6991/gitsigns.nvim")
Plug("lewis6991/impatient.nvim")
Plug("numToStr/Comment.nvim")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = vim.fn["TSUpdate"] })
Plug("nvim-treesitter/playground")
Plug("tpope/vim-surround")
Plug("windwp/nvim-autopairs")
-- }}

-- LSP Plugins {{
Plug("L3MON4D3/LuaSnip")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-cmdline")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-nvim-lua")
Plug("hrsh7th/cmp-path")
Plug("hrsh7th/nvim-cmp")
Plug("jose-elias-alvarez/null-ls.nvim")
Plug("neovim/nvim-lspconfig")
Plug("rafamadriz/friendly-snippets")
Plug("ray-x/lsp_signature.nvim")
Plug("saadparwaiz1/cmp_luasnip")
Plug("williamboman/nvim-lsp-installer")
-- }}

-- HTML Plugins {{
Plug("nvim-treesitter/nvim-treesitter-angular")
Plug("windwp/nvim-ts-autotag")
-- }}

-- Custom Plugins {{
Plug("/Users/sartori2/Desktop/neovim-auto-docs")
-- }}
call("plug#end")

-- Plugin configs
local configurable_plugins = {
	"bufferline",
	"comment",
	"feline",
	"gitsigns",
	"indent-blankline",
	"nvim-autopairs",
	"nvim-tree",
	"telescope",
	"treesitter",
	"vim-zoom",
}

-- Do impatient first for performance
-- Do catpuccin to be able to set the colorscheme
require("plugin-configs/catpuccin")
cmd("colorscheme catppuccin")

for _, plugin in ipairs(configurable_plugins) do
	require("plugin-configs/" .. plugin)
end

-- Do coc at the end
-- require('coc')
require("lsp")
