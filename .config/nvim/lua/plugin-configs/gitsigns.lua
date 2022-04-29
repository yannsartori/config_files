local map = require("utils").map
require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = {
			hl = "GitSignsChange",
			text = "▎",
			numhl = "GitSignsChangeNr",
			linehl = "GitSignsChangeLn",
		},
	},
	current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
	on_attach = function(bufnr)
		-- Navigation
		local opts = { buffer = bufnr, expr = true }
		-- Actions
		map("n", "<leader>cp", "<cmd>Gitsigns preview_hunk<CR>", { buffer = bufnr })
		map("n", "<leader>cd", "<cmd>Gitsigns diffthis<CR>", { buffer = bufnr })
	end,
})
