return {
	"akinsho/git-conflict.nvim",
	config = function()
		require("git-conflict").setup({
			default_mappings = false,
		})
	end,
}
