return {
	-- Aesthetic Plugins {{
	{
		"kyazdani42/nvim-web-devicons",
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = true,
	},
	{
		"stevearc/dressing.nvim",
		lazy = true,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		event = "BufReadPre",
		main = "ibl",
		opts = {
			indent = {
				char = "│",
				tab_char = "│",
			},
			scope = { enabled = true, show_end = false },
		},
	},
	-- }}

	-- Usability Plugins {{
	{
		"danymat/neogen",
		main = "neogen",
		opts = {
			snippet_engine = "luasnip",
			languages = {
				python = {
					template = {
						annotation_convention = "reST",
					},
				},
			},
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"kevinhwang91/nvim-ufo",
		dependencies = "kevinhwang91/promise-async",
		main = "ufo",
		opts = {},
	},
	{
		"nvim-lua/plenary.nvim",
		lazy = true,
	},
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
	},
	{
		"tpope/vim-repeat",
	},
	{
		"tpope/vim-surround",
	},
	{
		"Wansmer/treesj",
		main = "treesj",
		opts = {
			use_default_key_maps = false,
		},
	},
	{
		"szw/vim-maximizer",
	},
	-- }}

	-- LSP Plugins {{
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		event = "BufRead",
		main = "lspsaga",
		opts = {
			request_timeout = 3000,
			symbol_in_winbar = {
				enable = false,
				finder = {
					keys = {
						toggle_or_open = "<CR>",
					},
				},
			},
		},
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
		},
		event = "InsertEnter",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	},
	{
		"saadparwaiz1/cmp_luasnip",
	},
	{
		"stevearc/conform.nvim",
		main = "conform",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff" },
				markdown = { "markdownlint" },
				typescript = { "prettierd", "prettier" },
			},
			format_on_save = {
				async = true,
			},
		},
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				python = { "ruff" },
				markdown = { "markdownlint" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	-- }}

	-- HTML Plugins {{
	{
		"windwp/nvim-ts-autotag",
	},
	-- }}

	-- Python Plugins {{
	{
		"Vimjas/vim-python-pep8-indent",
	},
	-- }}
}
