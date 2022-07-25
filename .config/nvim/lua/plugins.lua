local Plug = vim.fn["plug#"]
local call = vim.call
local cmd = vim.cmd

call("plug#begin")
-- Aesthetic Plugins {{
Plug("akinsho/bufferline.nvim", { ["tag"] = "v2.2.1" }) -- Last Updated: 06/22/2022
Plug("catppuccin/nvim", { as = "catppuccin", ["commit"] = "d46425163dad4cc74910c0c81eeedb00cadf8a61" }) -- Last Updated: 06/22/2022
Plug("feline-nvim/feline.nvim", { ["commit"] = "1ea42671c523a080a01c62c40c2c8e7fc0139a8f" }) -- Last Updated: 06/22/2022
Plug("kyazdani42/nvim-web-devicons", { ["commit"] = "8d2c5337f0a2d0a17de8e751876eeb192b32310e" }) -- Last Updated: 06/22/2022
Plug("lukas-reineke/indent-blankline.nvim", { ["tag"] = "v2.18.4" }) -- Last Updated: 06/22/2022
Plug("norcalli/nvim-colorizer.lua", { ["commit"] = "36c610a9717cc9ec426a07c8e6bf3b3abcb139d6" }) -- Last Updated: 06/22/2022
Plug("stevearc/dressing.nvim", { ["commit"] = "af179837e1cdddfb164f0296883951b2255c46d2" }) -- Last Updated: 06/22/2022
-- }}

-- Usability Plugins {{
Plug("akinsho/git-conflict.nvim", { ["commit"] = "a8abdc59603516e1d45eb78d511efa40c6035bdc" }) -- Last Updated: 06/22/2022
Plug("dhruvasagar/vim-zoom", { ["tag"] = "v0.3.2" }) -- Last Updated: 06/22/2022
Plug("dstein64/vim-startuptime", { ["tag"] = "v4.0.0" }) -- Last Updated: 06/22/2022
Plug("iamcco/markdown-preview.nvim", { ["do"] = "cd app && yarn install", ["tag"] = "v0.0.10" }) -- Last Updated: 06/22/2022
Plug("kyazdani42/nvim-tree.lua", { ["commit"] = "79258f1d670277016523e13c0a88daa25070879f" }) -- Last Updated: 06/22/2022
Plug("lewis6991/gitsigns.nvim", { ["commit"] = "3543443eb3856fbe4a9d70f3fe8dc73e007199a1" }) -- Last Updated: 06/22/2022
Plug("lewis6991/impatient.nvim", { ["commit"] = "969f2c5c90457612c09cf2a13fee1adaa986d350" }) -- Last Updated: 06/22/2022
Plug("numToStr/Comment.nvim", { ["commit"] = "2c26a00f32b190390b664e56e32fd5347613b9e2" }) -- Last Updated: 06/22/2022
Plug("nvim-lua/plenary.nvim", { ["commit"] = "968a4b9afec0c633bc369662e78f8c5db0eba249" }) -- Last Updated: 06/22/2022
Plug(
	"nvim-telescope/telescope-fzf-native.nvim",
	{ ["do"] = "make", ["commit"] = "6a33ecefa9b3d9ade654f9a7a6396a00c3758ca6" }
) -- Last Updated: 06/22/2022
Plug("nvim-telescope/telescope.nvim", { ["commit"] = "d88b44ddf14670cffa9fdb1eaca7a0429a973653" }) -- Last Updated: 06/22/2022
Plug(
	"nvim-treesitter/nvim-treesitter",
	{ ["do"] = vim.fn["TSUpdate"], ["commit"] = "238532fe82b3dbfedcc06f11a536e19b1df696e1" }
) -- Last Updated: 06/22/2022
Plug("tpope/vim-repeat", { ["tag"] = "v1.2" }) -- Last Updated: 06/22/2022
Plug("tpope/vim-surround", { ["tag"] = "v2.2" }) -- Last Updated: 06/22/2022
Plug("windwp/nvim-autopairs", { ["commit"] = "4a95b3982be7397cd8e1370d1a09503f9b002dbf" }) -- Last Updated: 06/22/2022
-- }}

-- LSP Plugins {{
Plug("L3MON4D3/LuaSnip", { ["commit"] = "a12441e0598e93e67235eba67c8e6fbffc896f06" }) -- Last Updated: 06/22/2022
Plug("SmiteshP/nvim-navic", { ["commit"] = "1eb7823c5f7ebec1f968f51a1c46978cdead82ea" }) -- Last Updated: 06/22/2022
Plug("hrsh7th/cmp-buffer", { ["commit"] = "62fc67a2b0205136bc3e312664624ba2ab4a9323" }) -- Last Updated: 06/22/2022
Plug("hrsh7th/cmp-cmdline", { ["commit"] = "c36ca4bc1dedb12b4ba6546b96c43896fd6e7252" }) -- Last Updated: 06/22/2022
Plug("hrsh7th/cmp-nvim-lsp", { ["commit"] = "affe808a5c56b71630f17aa7c38e15c59fd648a8" }) -- Last Updated: 06/22/2022
Plug("hrsh7th/cmp-nvim-lua", { ["commit"] = "d276254e7198ab7d00f117e88e223b4bd8c02d21" }) -- Last Updated: 06/22/2022
Plug("hrsh7th/cmp-path", { ["commit"] = "466b6b8270f7ba89abd59f402c73f63c7331ff6e" }) -- Last Updated: 06/22/2022
Plug("hrsh7th/nvim-cmp", { ["commit"] = "df6734aa018d6feb4d76ba6bda94b1aeac2b378a" }) -- Last Updated: 06/22/2022
Plug("j-hui/fidget.nvim", { ["commit"] = "46d1110435f1f023c22fa95bb10b3906aecd7bde" }) -- Last Updated: 06/22/2022
Plug("jose-elias-alvarez/null-ls.nvim", { ["commit"] = "ff40739e5be6581899b43385997e39eecdbf9465" }) -- Last Updated: 06/22/2022
Plug("neovim/nvim-lspconfig", { ["commit"] = "9278dfbb92f8e99c313ce58ddcff92bd0bce5c0c" }) -- Last Updated: 06/22/2022
Plug("rafamadriz/friendly-snippets", { ["commit"] = "d27a83a363e61009278b6598703a763ce9c8e617" }) -- Last Updated: 06/22/2022
Plug("ray-x/lsp_signature.nvim", { ["commit"] = "49837977e210959c552bf357dc40ce18fadca501" }) -- Last Updated: 06/22/2022
Plug("saadparwaiz1/cmp_luasnip", { ["commit"] = "a9de941bcbda508d0a45d28ae366bb3f08db2e36" }) -- Last Updated: 06/22/2022
Plug("williamboman/nvim-lsp-installer", { ["commit"] = "5a0bf929eefad999e92963ee227c23a804cf0788" }) -- Last Updated: 06/22/2022
-- }}

-- HTML Plugins {{
-- Plug("nvim-treesitter/nvim-treesitter-angular", { ["commit"] = "53d55ba0473c3ac58e25ce3d016a0409481c645c" }) -- Last Updated: 06/22/2022
Plug("windwp/nvim-ts-autotag", { ["commit"] = "044a05c4c51051326900a53ba98fddacd15fea22" }) -- Last Updated: 06/22/2022
-- }}

-- Custom Plugins {{
Plug("yannsartori/neovim-auto-docs")
-- }}
call("plug#end")

-- Plugin configs
local configurable_plugins = {
	"bufferline",
	"colorizer",
	"comment",
	"feline",
	"fidget",
	"git-conflict",
	"gitsigns",
	"indent-blankline",
	"neovim-auto-docs",
	"nvim-autopairs",
	"nvim-navic",
	"nvim-tree",
	"telescope",
	"treesitter",
	"vim-zoom",
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
