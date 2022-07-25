local lsp = require("feline.providers.lsp")

local lsp_severity = vim.diagnostic.severity
local b = vim.b

local assets = {
	left_semicircle = "",
	right_semicircle = "",
	right_semicircle_cut = "",
	left_semicircle_cut = "",
	vertical_bar_chubby = "█",
	vertical_bar_medium = "┃",
	vertical_bar_thin = "│",
	left_arrow_thin = "",
	right_arrow_thin = "",
	left_arrow_filled = "",
	right_arrow_filled = "",
	slant_left = "",
	slant_left_thin = "",
	slant_right = "",
	slant_right_thin = "",
	slant_left_2 = "",
	slant_left_2_thin = "",
	slant_right_2 = "",
	slant_right_2_thin = "",
	chubby_dot = "●",
	slim_dot = "•",
}

local clrs = require("catppuccin.core.palettes.init").get_palette()

-- settings
local sett = {
	bkg = clrs.surface0,
	diffs = clrs.mauve,
	extras = clrs.overlay1,
	curr_file = clrs.maroon,
	curr_dir = clrs.flamingo,
}

local mode_colors = {
	["n"] = { "NORMAL", clrs.lavender },
	["no"] = { "N-PENDING", clrs.lavender },
	["i"] = { "INSERT", clrs.green },
	["ic"] = { "INSERT", clrs.green },
	["t"] = { "TERMINAL", clrs.green },
	["v"] = { "VISUAL", clrs.flamingo },
	["V"] = { "V-LINE", clrs.flamingo },
	[""] = { "V-BLOCK", clrs.flamingo },
	["R"] = { "REPLACE", clrs.maroon },
	["Rv"] = { "V-REPLACE", clrs.maroon },
	["s"] = { "SELECT", clrs.maroon },
	["S"] = { "S-LINE", clrs.maroon },
	[""] = { "S-BLOCK", clrs.maroon },
	["c"] = { "COMMAND", clrs.peach },
	["cv"] = { "COMMAND", clrs.peach },
	["ce"] = { "COMMAND", clrs.peach },
	["r"] = { "PROMPT", clrs.teal },
	["rm"] = { "MORE", clrs.teal },
	["r?"] = { "CONFIRM", clrs.mauve },
	["!"] = { "SHELL", clrs.green },
}

local shortline = false

local function is_enabled(is_shortline, winid, min_width)
	if is_shortline then
		return true
	end

	winid = winid or 0
	return vim.api.nvim_win_get_width(winid) > min_width
end

-- Initialize the components table
local components = {
	active = {},
	inactive = {},
}

table.insert(components.active, {}) -- (1) left
table.insert(components.active, {}) -- (2) center
table.insert(components.active, {}) -- (3) right

-- global components
local invi_sep = {
	str = " ",
	hl = {
		fg = sett.bkg,
		bg = sett.bkg,
	},
}

-- helpers
local function any_git_changes()
	local gst = b.gitsigns_status_dict -- git stats
	if gst then
		if gst["gitdir"] then -- enable if we are in a git dir
			return true
		end
	end
	return false
end

-- #################### STATUSLINE ->

-- ######## Left

-- Current vi mode ------>
local vi_mode_hl = function()
	return {
		fg = sett.bkg,
		bg = mode_colors[vim.fn.mode()][2],
		style = "bold",
	}
end

components.active[1][1] = {
	provider = assets.vertical_bar_chubby,
	hl = function()
		return {
			fg = mode_colors[vim.fn.mode()][2],
			bg = sett.bkg,
		}
	end,
}

components.active[1][2] = {
	provider = "",
	hl = function()
		return {
			fg = sett.bkg,
			bg = mode_colors[vim.fn.mode()][2],
		}
	end,
}

components.active[1][3] = {
	provider = function()
		return " " .. mode_colors[vim.fn.mode()][1] .. " "
	end,
	hl = vi_mode_hl,
}

-- there is a dilema: we need to hide Diffs if ther is no git info. We can do that, but this will
-- leave the right_semicircle colored with purple, and since we can't change the color conditonally
-- then the solution is to create two right_semicircles: one with a mauve sett.bkg and the other one normal
-- sett.bkg; both have the same fg (vi mode). The mauve one appears if there is git info, else the one with
-- the normal sett.bkg appears. Fixed :)

-- enable if git diffs are not available
components.active[1][4] = {
	provider = assets.right_semicircle,
	hl = function()
		return {
			fg = mode_colors[vim.fn.mode()][2],
			bg = sett.bkg,
		}
	end,
	enabled = function()
		return not any_git_changes()
	end,
}

-- enable if git diffs are available
components.active[1][5] = {
	provider = assets.vertical_bar_chubby,
	hl = function()
		return {
			fg = mode_colors[vim.fn.mode()][2],
			bg = sett.diffs,
		}
	end,
	enabled = function()
		return any_git_changes()
	end,
}
-- Current vi mode ------>

-- Diffs ------>
components.active[1][6] = {
	provider = "git_diff_added",
	hl = {
		fg = sett.bkg,
		bg = sett.diffs,
	},
	icon = "  ",
}

components.active[1][7] = {
	provider = "git_diff_changed",
	hl = {
		fg = sett.bkg,
		bg = sett.diffs,
	},
	icon = "  ",
}

components.active[1][8] = {
	provider = "git_diff_removed",
	hl = {
		fg = sett.bkg,
		bg = sett.diffs,
	},
	icon = "  ",
}

components.active[1][9] = {
	provider = function()
		local res = b.gitsigns_head or ""
		-- # Extract out everything before - (or the entire branch, if none)
		-- git_current_branch=$(echo $git_current_branch | sed -E 's/([^-]*)-?.*/\1/')
		-- # Add # if numeric
		-- if [[ $git_current_branch =~ "[0-9]+" ]]; then
		--   git_current_branch="#$git_current_branch"
		if #res > 0 then
			local _, _, branch_tag = string.find(res, "([^-]*)-?.*")
			if string.find(branch_tag, "^%d+$") then
				branch_tag = "#" .. branch_tag
			end
			return branch_tag
		end
		return res
	end,
	hl = {
		fg = sett.bkg,
		bg = sett.diffs,
	},
	icon = "  ",
}

components.active[1][10] = {
	provider = assets.right_semicircle,
	hl = {
		fg = sett.diffs,
		bg = sett.bkg,
	},
	enabled = function()
		return any_git_changes()
	end,
}

-- Diffs ------>

-- Extras ------>

-- position
components.active[1][11] = {
	provider = {
		name = "position",
		opts = {
			format = "Col {col}",
			padding = {
				col = 3,
			},
		},
	},
	hl = {
		fg = sett.extras,
		bg = sett.bkg,
	},
	left_sep = invi_sep,
}
-- Diagnostics ------>
-- workspace loader
-- genral diagnostics (errors, warnings. info and hints)
components.active[1][12] = {
	provider = "diagnostic_errors",
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.ERROR)
	end,

	hl = {
		fg = clrs.red,
		bg = sett.bkg,
	},
	icon = "  ",
}

components.active[1][13] = {
	provider = "diagnostic_warnings",
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.WARN)
	end,
	hl = {
		fg = clrs.yellow,
		bg = sett.bkg,
	},
	icon = "  ",
}

components.active[1][14] = {
	provider = "diagnostic_info",
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.INFO)
	end,
	hl = {
		fg = clrs.sky,
		bg = sett.bkg,
	},
	icon = "  ",
}

components.active[1][15] = {
	provider = "diagnostic_hints",
	enabled = function()
		return lsp.diagnostics_exist(lsp_severity.HINT)
	end,
	hl = {
		fg = clrs.rosewater,
		bg = sett.bkg,
	},
	icon = "  ",
}

-- ######## Left

-- ######## Center

local seperator = "  "

components.active[2][1] = {
	provider = function()
		return require("nvim-navic").get_location({
			separator = seperator,
		})
	end,
	enabled = function()
		return require("nvim-navic").is_available()
	end,
	hl = {
		fg = clrs.rosewater,
		bg = sett.bkg,
	},
}
-- Diagnostics ------>

-- ######## Center

-- ######## Right

components.active[3][1] = {
	provider = function()
		if next(vim.lsp.buf_get_clients()) ~= nil then
			return " "
		else
			return ""
		end
	end,
	hl = {
		fg = sett.extras,
		bg = sett.bkg,
	},
	right_sep = invi_sep,
}

components.active[3][2] = {
	provider = function()
		local filename = vim.fn.expand("%:t")
		local extension = vim.fn.expand("%:e")
		local icon = require("nvim-web-devicons").get_icon(filename, extension)
		if icon == nil then
			icon = "   "
			return icon
		end
		return " " .. icon .. " " .. filename .. " "
	end,
	enabled = shortline or function(winid)
		winid = winid or 0
		return vim.api.nvim_win_get_width(winid + 0) > 70
	end,
	hl = {
		fg = sett.bkg,
		bg = sett.curr_file,
	},
	left_sep = {
		str = assets.left_semicircle,
		hl = {
			fg = sett.curr_file,
			bg = sett.bkg,
		},
	},
}

components.active[3][3] = {
	provider = function()
		local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		return "  " .. dir_name .. " "
	end,

	enabled = shortline or function(winid)
		winid = winid or 0
		return vim.api.nvim_win_get_width(winid + 0) > 80
	end,

	hl = {
		fg = sett.bkg,
		bg = sett.curr_dir,
	},
	left_sep = {
		str = assets.vertical_bar_chubby,
		hl = {
			fg = sett.curr_dir,
			bg = sett.curr_file,
		},
	},
}
-- ######## Right

require("feline").setup({
	components = components,
})
