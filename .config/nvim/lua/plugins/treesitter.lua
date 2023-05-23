return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"bash",
				"css",
				"dockerfile",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"python",
				"typescript",
				"vim",
				"yaml",
			},
			-- sync_install = true,
			autotag = {
				enable = true,
			},
			disable = function(lang, buf)
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
			highlight = {
				enable = true,
				disable = { "json", "yaml" },
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					node_incremental = "<CR>",
					scope_incremental = "<S-CR>",
					node_decremental = "<BS>",
				},
			},
			indent = {
				enable = true,
				disable = { "python" },
			},
		})
	end,
}
