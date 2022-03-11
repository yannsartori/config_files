local M = {}
local cmd = vim.cmd
local api = vim.api

--- Wrap for the vim.api.nvim_set_keymap function
--
-- By default, the mapping is a recursive, silent mapping.
-- @param mode - The mode (single letter) to use
-- @param shortcut - The shortcut to map
-- @param command - The command to map the short cut to
-- @param opts - Any additionally options to use (expr, noremap, silent)
function M.map(mode, shortcut, command, opts)
	opts = vim.tbl_extend("keep", opts or {}, {
		noremap = false,
		silent = true,
		expr = false,
	})
	api.nvim_set_keymap(mode, shortcut, command, opts)
end

--- Does a normal, recursive, silent mapping
--
-- @param shortcut - The shortcut to map
-- @param command - The command to map the short cut to
-- @param opts - Any additionally options to use (expr, noremap, silent)
function M.nmap(shortcut, command, opts)
	M.map("n", shortcut, command, opts)
end

--- Does a insert, recursive, silent mapping
--
-- @param shortcut - The shortcut to map
-- @param command - The command to map the short cut to
-- @param opts - Any additionally options to use (expr, noremap, silent)
function M.imap(shortcut, command, opts)
	M.map("i", shortcut, command, opts)
end

--- Wrap for the vim.api.nvim_buf_set_keymap function
--
-- By default, the mapping is a recursive, silent mapping.
-- @param buffnr - The buffer number to map on
-- @param mode - The mode (single letter) to use
-- @param shortcut - The shortcut to map
-- @param command - The command to map the short cut to
-- @param opts - Any additionally options to use (expr, noremap, silent)
function M.bmap(buffnr, mode, shortcut, command, opts)
	opts = vim.tbl_extend("keep", opts or {}, {
		noremap = false,
		silent = true,
		expr = false,
	})
	api.nvim_buf_set_keymap(buffnr, mode, shortcut, command, opts)
end

--- Does a normal, recursive, silent mapping on bufnr
--
-- @param bufnr - The buffer number to map on
-- @param shortcut - The shortcut to map
-- @param command - The command to map the short cut to
-- @param opts - Any additionally options to use (expr, noremap, silent)
function M.bnmap(buffnr, shortcut, command, opts)
	M.bmap(buffnr, "n", shortcut, command, opts)
end

--- Does a insert, recursive, silent mapping on bufnr
--
-- @param bufnr - The buffer number to map on
-- @param shortcut - The shortcut to map
-- @param command - The command to map the short cut to
-- @param opts - Any additionally options to use (expr, noremap, silent)
function M.bimap(buffnr, shortcut, command, opts)
	M.bmap(buffnr, "i", shortcut, command, opts)
end

--- Map a lua function
--
-- Make sure if this is done, that `G.${cur_module}` is set! (see /coc/mappings for an example)
-- @param cur_module The module path, period delimited. For instance, if in
--  .config/nvim/lua/mod/mapping.lua, pass in 'mod.mapping'
-- @param func The function (as a string)
-- @param mode The mode (single letter)
-- @returns The proper command
function M.map_lua_func(cur_module, func, mode)
	if mode == "n" then
		return ':lua require("' .. cur_module .. '").' .. func .. "()<CR>"
	end
	if mode == "i" then
		return "v:lua." .. cur_module .. "." .. func .. "()"
	end
end

--- Escape a vim command
--
-- Useful for doing insert maps
-- @param command The command to map
-- @returns The escaped command
function M.esc(command)
	return vim.api.nvim_replace_termcodes(command, true, false, true)
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
