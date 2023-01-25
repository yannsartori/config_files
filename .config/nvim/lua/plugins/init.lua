return {
	-- Aesthetic Plugins {{
	{
		"folke/twilight.nvim",
		config = true,
		pin = true,
	},
	{ "kyazdani42/nvim-web-devicons", pin = true },
	{
		"norcalli/nvim-colorizer.lua",
		config = true,
		pin = true,
	},
	{
		"stevearc/dressing.nvim",
		pin = true,
		lazy = true,
	},
	-- }}

	-- Usability Plugins {{
	{
		"danymat/neogen",
		config = function()
			require("neogen").setup({
				snippet_engine = "luasnip",
				languages = {
					python = {
						template = {
							annotation_convention = "reST",
						},
					},
				},
			})
		end,
		pin = true,
	},
	{ "iamcco/markdown-preview.nvim", pin = true, build = "cd app && yarn install" },
	{
		"kiyoon/jupynium.nvim",
		build = "pip3 install --user .",
	},
	{ "nvim-lua/plenary.nvim", pin = true, lazy = true },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make", pin = true },
	{ "tpope/vim-repeat", pin = true },
	{ "tpope/vim-surround", pin = true },
	{
		"Wansmer/treesj",
		config = true,
		pin = true,
	},
	{ "szw/vim-maximizer", pin = true },
	-- }}

	-- LSP Plugins {{
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		cmd = { "TroubleToggle", "Trouble" },
		config = function()
			require("trouble").setup({
				use_diagnostic_signs = true,
			})
		end,
		pin = true,
	},
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		event = "BufRead",
		config = function()
			require("lspsaga").setup({
				request_timeout = 3000,
				symbol_in_winbar = {
					enable = false,
				},
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		pin = true,
		dependencies = {
			"hrsh7th/cmp-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
		},
		event = "InsertEnter",
	},
	{ "hrsh7th/vim-vsnip", pin = true },
	{ "jose-elias-alvarez/null-ls.nvim", pin = true },
	{
		"L3MON4D3/LuaSnip",
		pin = true,
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	{ "neovim/nvim-lspconfig", pin = true },
	{ "saadparwaiz1/cmp_luasnip", pin = true },
	{ "williamboman/mason-lspconfig.nvim", pin = true },
	{ "williamboman/mason.nvim", pin = true },
	-- }}

	-- HTML Plugins {{
	{ "windwp/nvim-ts-autotag", pin = true },
	-- }}

	-- Python Plugins {{
	{ "Vimjas/vim-python-pep8-indent", pin = true },
	-- }}

	-- Custom Plugins {{
	{
		"yannsartori/neovim-auto-docs",
		config = function()
			require("neovim-auto-docs")
		end,
		pin = true,
	},
	-- }}
}
