local cmd = vim.cmd
local opt = vim.opt
local api = vim.api
local fn = vim.fn

--- Function to define how to transform vim to facilitate copying.
-- This includes:
-- - Disabling coc (to disable git gutter)
-- - Disabling blankline tab guidelines
-- - Clearing the gutter
local function copy()
	cmd("Gitsigns detach")
	cmd("IndentBlanklineDisable")
	opt.relativenumber = false
	opt.number = false
	opt.signcolumn = "no"
end
api.nvim_create_user_command("Copy", copy, {})

--- Function to define how to revert from Copy mode.
-- c.f. copy(), as this function is its inverse
local function nocopy()
	cmd("Gitsigns attach")
	cmd("IndentBlanklineEnable")
	opt.relativenumber = true
	opt.number = true
	opt.signcolumn = "yes"
end
api.nvim_create_user_command("Nocopy", nocopy, {})

-- Here for consistency
api.nvim_create_user_command("Paste", function()
	opt.paste = true
end, {})
api.nvim_create_user_command("Nopaste", function()
	opt.paste = false
end, {})

-- Less typing
api.nvim_create_user_command("Status", function()
	cmd("Telescope git_status")
end, {})

-- Get the path
api.nvim_create_user_command("Path", function()
	local filename = vim.api.nvim_buf_get_name(0)
	vim.cmd('let @+="' .. filename .. '"')
end, {})

-- Custom insert entering/leaving logic {{
local function insertToggle(toggle)
	return function()
		opt.relativenumber = not toggle
		opt.spell = toggle
	end
end
api.nvim_create_autocmd({ "InsertEnter" }, {
	pattern = "*",
	callback = insertToggle(true),
})
api.nvim_create_autocmd({ "InsertLeave" }, {
	pattern = "*",
	callback = insertToggle(false),
})
api.nvim_create_autocmd({ "BufReadPost" }, {
	pattern = "*",
	callback = function()
		if fn.line("'\"") > 0 and fn.line("'\"") <= fn.line("$") then
			fn.setpos(".", fn.getpos("'\""))
			vim.api.nvim_feedkeys("zz", "n", true)
		end
	end,
})
-- }}
