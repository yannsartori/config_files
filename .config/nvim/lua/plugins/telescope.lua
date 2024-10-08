return {
	"nvim-telescope/telescope.nvim",
	cmd = "Telescope",
	config = function()
		require("telescope").load_extension("fzf")
		require("telescope").setup({
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--hidden",
					"-s",
				},
				prompt_prefix = " 󰍉 ",
				selection_caret = "  ",
				entry_prefix = "  ",
				layout_config = {
					horizontal = {
						prompt_position = "top",
						preview_width = 0.55,
						results_width = 0.8,
					},
					vertical = {
						mirror = false,
					},
					width = 0.87,
					height = 0.80,
					preview_cutoff = 120,
				},
				mappings = {
					i = {
						["<C-p>"] = require("telescope.actions.layout").toggle_preview,
						["<C-d>"] = require("telescope.actions").delete_buffer,
					},
				},
				path_display = {
					"truncate",
				},
				preview = {
					hide_on_startup = true,
				},
				winblend = 0,
				border = {},
				borderchars = {
					"─",
					"│",
					"─",
					"│",
					"╭",
					"╮",
					"╯",
					"╰",
				},
				color_devicons = true,
				use_less = true,
				set_env = {
					COLORTERM = "truecolor",
				},
				file_ignore_patterns = {
					".ipynb",
					".ju.",
					"e2e",
					"lua-language-server",
					"node_modules",
					"swagger",
				},
			},
			extensions = {
				file_browser = {
					theme = "ivy",
					hijack_netrw = true,
				},
			},
		})
	end,
}
