return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		local function get_short_cwd()
			return vim.fn.fnamemodify(vim.fn.getcwd(), ":~")
		end

		local nvimtree = {
			sections = {
				lualine_a = {
					{ get_short_cwd, separator = { left = "" }, right_padding = 2 },
				},
			},
			filetypes = { "NvimTree" },
		}

		local git_branch = function()
			local res = vim.b.gitsigns_head or ""
			if #res > 0 then
				local _, _, branch_tag = string.find(res, "([^-]*)-?.*")
				if string.find(branch_tag, "^%d+$") then
					branch_tag = "#" .. branch_tag
				end
				return branch_tag
			end
			return res
		end

		local location = function()
			local col = vim.fn.virtcol(".")
			return string.format("COL %-2d", col)
		end

		local auto = require("lualine.themes.auto")
		local colors = require("catppuccin.palettes").get_palette()
		auto.normal.c.bg = colors.surface0

		return {
			options = {
				theme = auto,
				globalstatus = true,
				disabled_filetypes = { statusline = { "mason", "lazy" } },
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					{ "mode", separator = { left = "" }, right_padding = 2 },
				},
				lualine_b = {
					{ git_branch, icon = "" },
				},
				lualine_c = {
					{
						"diff",
						symbols = {
							added = "  ",
							modified = "  ",
							removed = "  ",
						},
					},
					{ "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
					{
						"filename",
						path = 1,
						symbols = {
							modified = "  ",
							readonly = "  ",
							unnamed = "",
							newfile = "  ",
						},
					},
				},
				lualine_x = {
					{
						"diagnostics",
						sections = { "error", "warn", "info" },
						symbols = {
							error = " ",
							warn = " ",
							info = " ",
						},
					},
				},
				lualine_y = {},
				lualine_z = {
					{ location, separator = { right = "" } },
				},
			},
			extensions = { nvimtree },
		}
	end,
	config = function(_, opts)
		local lualine = require("lualine")
		lualine.setup(opts)
	end,
}
