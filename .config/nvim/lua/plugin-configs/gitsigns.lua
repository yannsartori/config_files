local map = require('utils').map

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
    local gs = package.loaded.gitsigns

    -- Actions
    map('n', '<leader>cp', gs.preview_hunk)
    map('n', '<leader>cd', function() gs.diffthis('~') end)
	end,
})
