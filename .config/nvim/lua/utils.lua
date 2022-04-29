local M = {}
local cmd = vim.cmd

--- Wrap for the vim.api.nvim_set_keymap function
--
-- By default, the mapping is a recursive, silent mapping.
-- @param modes - The mode(s) (single letter) to use
-- @param shortcut - The shortcut to map
-- @param command - The command to map the short cut to
-- @param opts - Any additionally options to use (expr, remap, silent)
function M.map(modes, shortcut, command, opts)
	opts = vim.tbl_extend("keep", opts or {}, {
		-- remap = true,
		silent = true,
		expr = false,
	})
	vim.keymap.set(modes, shortcut, command, opts)
end

--- Does a normal, recursive, silent mapping
--
-- @param shortcut - The shortcut to map
-- @param command - The command to map the short cut to
-- @param opts - Any additionally options to use (expr, noremap, silent, buffer)
-- local nmap = require("utils").nmap
function M.nmap(shortcut, command, opts)
	M.map("n", shortcut, command, opts)
end

--- Does a insert, recursive, silent mapping
--
-- @param shortcut - The shortcut to map
-- @param command - The command to map the short cut to
-- @param opts - Any additionally options to use (expr, noremap, silent, buffer)
function M.imap(shortcut, command, opts)
	M.map("i", shortcut, command, opts)
end

--- Set the highlight foreground
--
-- @param group The highlight group
-- @param col The foreground color
function M.fg(group, col)
	cmd("hi " .. group .. " guifg=" .. col)
end

--- Set the highlight background
--
-- @param group The highlight group
-- @param col The background color
function M.bg(group, col)
	cmd("hi " .. group .. " guibg=" .. col)
end

--- Set the highlight foreground and background
--
-- @param group The highlight group
-- @param fgcol The foreground color
-- @param bgcol The background color
function M.fg_bg(group, fgcol, bgcol)
	cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

return M
