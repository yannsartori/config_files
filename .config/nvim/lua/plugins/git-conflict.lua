return {
	"akinsho/git-conflict.nvim",
	pin = true,
	config = function()
		require("git-conflict").setup({
			default_mappings = false,
		})
	end,
}
