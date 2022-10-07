require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"css",
		"dockerfile",
		"html",
		"javascript",
		"jsdoc",
		"json",
		"lua",
		"python",
		"typescript",
		"vim",
		"yaml",
	},
	sync_install = false,
	autotag = {
		enable = true,
	},
	highlight = {
		enable = true,
    disable = { "json", "yaml" },
		-- additional_vim_regex_highlighting = true,
	},
	incremental_selection = {
		enable = true,
	},
	playground = {
		enable = true,
	},
})
