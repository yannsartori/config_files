-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
	default = "",
	symlink = "",
	git = {
		unstaged = "",
		staged = "S",
		unmerged = "",
		renamed = "➜",
		deleted = "",
		untracked = "U",
		ignored = "◌",
	},
	folder = {
		default = "",
		open = "",
		empty = "",
		empty_open = "",
		symlink = "",
	},
}

require("nvim-tree").setup({
	disable_netrw = true,
	diagnostics = {
		enable = true,
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
})
