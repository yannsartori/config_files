return {
	"catppuccin/nvim",
	name = "catppuccin",
	pin = true,
	lazy = false,
	priority = 1000,
	config = function()
		local catppuccin = require("catppuccin")
		vim.cmd("Catppuccin mocha")
		catppuccin.setup({
			styles = {
				functions = { "bold" },
				keywords = { "italic" },
				loops = { "italic " },
			},
			color_overrides = {
				macchiato = {
					base = "#1E1E2E",
				},
			},
			integrations = {
				gitsigns = true,
				mason = true,
				cmp = true,
				treesitter = true,
				nvimtree = true,
				telescope = true,
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
