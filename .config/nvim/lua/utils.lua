local M = {}
local cmd = vim.cmd

function M.map(mode, shortcut, command)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true})
end

function M.nmap(shortcut, command)
    M.map('n', shortcut, command)
end

function M.imap(shortcut, command)
    M.map('i', shortcut, command)
end

function M.fg(group, col)
    cmd('hi ' .. group .. ' guifg=' .. col)
end

function M.bg(group, col)
    cmd('hi ' .. group .. ' guibg=' .. col)
end

function M.fg_bg(group, fgcol, bgcol)
    cmd('hi ' .. group .. ' guifg=' .. fgcol ..  ' guibg=' .. bgcol)
end

return M
