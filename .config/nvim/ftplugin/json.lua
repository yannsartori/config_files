local opt = vim.opt
opt.softtabstop = 2
opt.shiftwidth = 2

vim.keymap.set("n", "o", function()
	local line = vim.api.nvim_get_current_line()

	local should_add_comma = string.find(line, "[^,{[]$")
	if should_add_comma then
		return "A,<cr>"
	else
		return "o"
	end
end, { buffer = true, expr = true })
