return {
	"kyazdani42/nvim-tree.lua",
	pin = true,
	cmd = {
		"NvimTreeToggle",
		"NvimTreeRefresh",
		"NvimTreeFindFile",
	},
	config = function()
		require("nvim-web-devicons").setup({
			override = {
				["spec.ts"] = {
					icon = "ﭧ",
					color = "#ABE9B3",
					cterm_color = "65",
					name = "spec",
				},
				["module.ts"] = {
					icon = "",
					color = "#F5C2E7",
					cterm_color = "65",
					name = "module",
				},
			},
		})
		require("nvim-tree").setup({
			actions = {
				open_file = {
					resize_window = true,
				},
			},
			disable_netrw = true,
			diagnostics = {
				enable = true,
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 500,
			},
			renderer = {
				icons = {
					glyphs = {
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
					},
				},
			},
		})
	end,
}
