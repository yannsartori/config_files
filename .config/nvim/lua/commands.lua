local cmd = vim.cmd
local opt = vim.opt
local api = vim.api
local fn = vim.fn

-- Get the path
api.nvim_create_user_command("Path", function()
	local git_root = vim.fs.dirname(vim.fs.find({ ".git" }, { upward = true })[1])
	if git_root then
		git_root = git_root .. "/"
	end
	local filename = vim.api.nvim_buf_get_name(0)
	local formatted_name = filename:gsub(git_root or "", "")
	vim.cmd('let @+="' .. formatted_name .. '"')
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
