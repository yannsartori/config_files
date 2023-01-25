local cmd = vim.cmd
local opt = vim.opt
local api = vim.api
local fn = vim.fn

-- Less typing
api.nvim_create_user_command("Status", function()
	cmd("Telescope git_status")
end, {})

-- Get the path
api.nvim_create_user_command("Path", function()
	local filename = vim.api.nvim_buf_get_name(0)
	vim.cmd('let @+="' .. filename .. '"')
end, {})

-- Go back to where file was last opened.
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
