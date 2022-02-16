local M = {}
local map = require('utils').map
local nmap = require('utils').nmap
local imap = require('utils').imap
local esc = require('utils').esc
local map_lua_func = require('utils').map_lua_func

imap('<c-space>', 'coc#refresh()', {expr = true})

function M.s_tab_mapper()
    if vim.fn.pumvisible() > 0 then
        return esc('<C-P>')
    else
        return esc('<C-h>')
    end
end
imap('<S-TAB>', map_lua_func('lua.coc.mappings', 's_tab_mapper', 'i'), {expr = true, noremap = true})

local function check_back_space()
  local col = vim.fn.col('.') - 1
  return col <= 0 or vim.fn.getline('.'):sub(col, col):match('%s')
end

function M.tab_completer()
    if vim.fn.pumvisible() > 0 then
        return esc('<C-n>')
    end
    if check_back_space() then
        return esc('<TAB>')
    end
    return vim.fn['coc#refresh']()
end
-- Use tab for trigger completion with characters ahead and navigate.
imap('<TAB>', map_lua_func('lua.coc.mappings', 'tab_completer', 'i'), {expr = true, noremap = true})
-- imap('<TAB>', 'v:lua.coc.mappings.tab_completer()', {expr = true, noremap = true})


function M.show_documentation()
    local filetype = vim.bo.filetype
    if filetype == 'vim' or filetype == 'help' then
        vim.api.nvim_command('h ' .. filetype)
    elseif vim.fn['coc#rpc#ready']() then
        vim.fn.CocActionAsync('doHover')
    end
end
nmap('K', map_lua_func('lua.coc.mappings', 'show_documentation', 'n'))

nmap('gd', '<Plug>(coc-definition)')
nmap('gy', '<Plug>(coc-type-definition)')
nmap('gi', '<Plug>(coc-implementation)')
nmap('gr', '<Plug>(coc-references)')
-- Go to error
nmap('gE', '<Plug>(coc-diagnostic-prev)')
nmap('ge', '<Plug>(coc-references)')

-- Symbol renaming.
nmap('<leader>rn', '<Plug>(coc-rename)')

-- Formatting selected code.
map('x', '<leader>f', '<Plug>(coc-format-selected)')
nmap('<leader>f', '<Plug>(coc-format-selected)')

_G.coc.mappings = M
return M
