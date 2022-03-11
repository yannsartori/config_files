local Plug = vim.fn['plug#']
local call = vim.call
local cmd = vim.cmd

call('plug#begin')
-- Aesthetic Plugins {{
Plug('catppuccin/nvim', {as = 'catppuccin'})
--Plug 'itchyny/lightline.vim'
Plug 'feline-nvim/feline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
-- }}

-- Usability Plugins {{
Plug 'dhruvasagar/vim-zoom'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug('nvim-treesitter/nvim-treesitter', {['do'] = vim.fn['TSUpdate']})
Plug 'nvim-treesitter/playground'
Plug 'yannsartori/neovim-jsdoc.py'
Plug 'dstein64/vim-startuptime'
-- }}

-- LSP Plugins {{
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'ray-x/lsp_signature.nvim'
Plug 'nvim-lua/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
-- }}

-- HTML Plugins {{
Plug 'alvan/vim-closetag'
Plug 'nvim-treesitter/nvim-treesitter-angular'
-- }}

-- Custom Plugins {{
Plug '/Users/sartori2/Desktop/neovim-auto-docs'
-- }}
call('plug#end')

-- Plugin configs
local configurable_plugins = {
    'bufferline', 'indent-blankline', 'vim-zoom', 'nvim-tree', 'nvim-autopairs',
    'comment', 'treesitter', 'telescope', 'neovim-auto-docs', 'feline'
}
-- Do catpuccin to be able to set the colorscheme
require('plugin-configs/catpuccin')
cmd('colorscheme catppuccin')

for _, plugin in ipairs(configurable_plugins) do
    require('plugin-configs/' .. plugin)
end

-- Do coc at the end
-- require('coc')
require('lsp')
