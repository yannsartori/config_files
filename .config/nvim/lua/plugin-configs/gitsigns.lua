local bmap = require("utils").bmap
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
		bmap(bufnr, "n", "gc", "&diff ? ']c' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
		bmap(bufnr, "n", "gC", "&diff ? '[c' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

		-- Actions
		bmap(bufnr, "n", "<leader>cp", "<cmd>Gitsigns preview_hunk<CR>")
		bmap(bufnr, "n", "<leader>cd", "<cmd>Gitsigns diffthis<CR>")
	end,
})
