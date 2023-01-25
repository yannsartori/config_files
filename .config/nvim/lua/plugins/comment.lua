return {
	"numToStr/Comment.nvim",
	pin = true,
	event = "VeryLazy",
	config = function()
		require("Comment").setup({
			toggler = { -- there was a conflict with mappings, so this "blackholes" it
				line = "<leader>!c",
				block = "<leader>@c",
			},
			opleader = {
				line = "<leader>!",
				block = "<leader>@",
			},
		})
	end,
}
