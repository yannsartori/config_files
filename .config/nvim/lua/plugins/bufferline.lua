return {
	"akinsho/bufferline.nvim",
	tag = "v3.1.0",
	event = "VeryLazy",
	config = function()
		local mocha = require("catppuccin.palettes").get_palette("mocha")
		require("bufferline").setup({
			highlights = {
				-- background = {
				--   fg = "#00FF00",
				--   bg = "#00FF00",
				-- },
				fill = {
					fg = mocha.mantle,
					bg = mocha.mantle,
				},
			},
			options = {
				-- after = "catppuccin",
				numbers = "ordinal",
				diagnostics = "nvim_lsp",
				separator_style = "thick",
				show_buffer_close_icons = false,
				show_close_icon = false,
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						highlight = "Directory",
						separator = false,
					},
				},
			},
		})
	end,
}
