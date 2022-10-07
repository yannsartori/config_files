local cmd = vim.cmd

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


require('packer').startup(function(use)
  use("wbthomason/packer.nvim")

  use({ "akinsho/bufferline.nvim", lock = true, })
  use({ "catppuccin/nvim", lock = true, as = "catppuccin", })
  use({ "feline-nvim/feline.nvim", lock = true, })
  use({ "kyazdani42/nvim-web-devicons", lock = true, })
  use({ "lukas-reineke/indent-blankline.nvim", lock = true, })
  use({
    "norcalli/nvim-colorizer.lua",
    config = function() require('colorizer').setup() end,
    lock = true,
  })
  use({ "stevearc/dressing.nvim", lock = true, })
  -- }}

  -- Usability Plugins {{
  use({ "akinsho/git-conflict.nvim", tag = "v1.0.0" })
  use({ "iamcco/markdown-preview.nvim", lock = true, run = "cd app && yarn install", })
  use({ "kyazdani42/nvim-tree.lua", lock = true, })
  use({ "lewis6991/gitsigns.nvim", lock = true, })
  use({ "lewis6991/impatient.nvim", lock = true, })
  use({ "numToStr/Comment.nvim", lock = true, })
  use({ "nvim-lua/plenary.nvim", lock = true, })
  use({ "nvim-telescope/telescope-fzf-native.nvim", lock = true, run = "make", })
  use({ "nvim-telescope/telescope.nvim", lock = true, })
  use({
    "nvim-treesitter/nvim-treesitter",
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    lock = true,
  })
  use({
    "nvim-treesitter/playground",
    config = function() require("nvim-treesitter.configs").setup({playground = { enable = true }}) end,
    lock = true,
  })
  use({ "Pocco81/true-zen.nvim", lock = true, })
  use({ "tpope/vim-repeat", lock = true, })
  use({ "tpope/vim-surround", lock = true, })
  use({ "windwp/nvim-autopairs", lock = true, })
  -- }}

  -- LSP Plugins {{
  use({ "L3MON4D3/LuaSnip", lock = true, })
  use({
    "SmiteshP/nvim-navic",
    config = function() require("nvim-navic").setup({}) end,
    lock = true,
  })
  use({ "hrsh7th/cmp-buffer", lock = true, })
  use({ "hrsh7th/cmp-cmdline", lock = true, })
  use({ "hrsh7th/cmp-nvim-lsp", lock = true, })
  use({ "hrsh7th/cmp-nvim-lua", lock = true, })
  use({ "hrsh7th/cmp-path", lock = true, })
  use({ "hrsh7th/nvim-cmp", lock = true, })
  use({ "j-hui/fidget.nvim", config = function() require("fidget").setup({}) end, lock = true, })
  use({ "jose-elias-alvarez/null-ls.nvim", lock = true, })
  use({ "neovim/nvim-lspconfig", lock = true, })
  use({ "rafamadriz/friendly-snippets", lock = true, })
  use({ "ray-x/lsp_signature.nvim", lock = true, })
  use({ "saadparwaiz1/cmp_luasnip", lock = true, })
  use({ "williamboman/mason.nvim", lock = true, })
  use({ "williamboman/mason-lspconfig.nvim", lock = true, })
  -- }}

  -- HTML Plugins {{
  use({ "windwp/nvim-ts-autotag", lock = true, })
  -- }}

  -- Custom Plugins {{
  use({ "yannsartori/neovim-auto-docs", config = function() require("neovim-auto-docs") end, lock = true, })

  if packer_bootstrap then
    require('packer').sync()
  end
-- }}
end)

-- Plugin configs
local configurable_plugins = {
  "bufferline",
  "comment",
  "feline",
  "git-conflict",
  "gitsigns",
  "indent-blankline",
  "nvim-autopairs",
  "nvim-tree",
  "telescope",
  "treesitter",
  "true-zen",
}

-- Do impatient first for performance
require("impatient")
-- Do catpuccin to be able to set the colorscheme
require("plugin-configs/catpuccin")
cmd("colorscheme catppuccin")

for _, plugin in ipairs(configurable_plugins) do
	require("plugin-configs/" .. plugin)
end

-- Do lsp at the end
require("lsp")
