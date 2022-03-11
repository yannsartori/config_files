local cmd = vim.cmd
local opt = vim.opt
local M = {}

--- Function to define how to transform vim to facilitate copying.
-- This includes:
-- - Disabling coc (to disable git gutter)
-- - Disabling blankline tab guidelines
-- - Clearing the gutter
function M.copy()
	cmd("Gitsigns detach")
	cmd("IndentBlanklineDisable")
	opt.relativenumber = false
	opt.number = false
	opt.signcolumn = "no"
end
cmd('command -nargs=0 Copy lua require("commands").copy()')

--- Function to define how to revert from Copy mode.
-- c.f. copy(), as this function is its inverse
function M.nocopy()
	cmd("Gitsigns attach")
	cmd("IndentBlanklineEnable")
	opt.relativenumber = true
	opt.number = true
	opt.signcolumn = "yes"
end
cmd('command -nargs=0 Nocopy lua require("commands").nocopy()')

-- Here for consistency
cmd("command -nargs=0 Paste set paste")
cmd("command -nargs=0 Nopaste set nopaste")

-- Custom insert entering/leaving logic {{
cmd([[
autocmd InsertEnter * setlocal spell
autocmd InsertEnter * setlocal norelativenumber
autocmd InsertLeave * setlocal nospell
autocmd InsertLeave * setlocal relativenumber
]])
-- }}

return M
