local Plug = vim.fn['plug#']
local call = vim.call
local cmd = vim.cmd

call('plug#begin')
-- Aesthetic Plugins {{
Plug('catppuccin/nvim', {as = 'catppuccin'})
Plug 'itchyny/lightline.vim'
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
Plug 'yannsartori/neovim-jsdoc.py'
-- }}

-- LSP Plugins {{
Plug 'neoclide/coc.nvim'
-- }}

-- HTML Plugins {{
Plug 'alvan/vim-closetag'
-- }}
call('plug#end')

-- Plugin configs
local configurable_plugins = {
    'lightline', 'bufferline', 'indent-blankline', 'vim-zoom', 'nvim-tree', 'nvim-autopairs',
    'comment', 'treesitter', 'telescope'
}
-- Do catpuccin to be able to set the colorscheme
require('plugin-configs/catpuccin')
cmd('colorscheme catppuccin')

for _, plugin in ipairs(configurable_plugins) do
    require('plugin-configs/' .. plugin)
end

-- Do coc at the end
require('coc')
