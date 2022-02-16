local M = {}
local cmd = vim.cmd

function M.map(mode, shortcut, command, opts)
    opts = vim.tbl_extend('keep', opts or {}, {
        noremap = false,
        silent = true,
        expr = false,
    })
    vim.api.nvim_set_keymap(mode, shortcut, command, opts)
end

function M.nmap(shortcut, command, opts)
    M.map('n', shortcut, command, opts)
end

function M.imap(shortcut, command, opts)
    M.map('i', shortcut, command, opts)
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

function M.esc(command)
  return vim.api.nvim_replace_termcodes(command, true, false, true)
end

function M.map_lua_func(cur_module, func, mode)
    local base = ''
    if mode == 'n' then
        return ':lua require("' .. cur_module ..'").' .. func .. '()<CR>'
    end
    if mode == 'i' then
        return 'v:' .. cur_module .. '.' .. func .. '()'
    end
end

return M
