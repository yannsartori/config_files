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
	},
	{ "iamcco/markdown-preview.nvim" },
  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function() require("ufo").setup() end,
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
    config = function()
      require("treesj").setup({
        use_default_key_maps = false,
      })
    end,
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
    "jose-elias-alvarez/null-ls.nvim",
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
    }
  },
	{
    "saadparwaiz1/cmp_luasnip",
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
