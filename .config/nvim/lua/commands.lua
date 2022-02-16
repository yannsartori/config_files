local cmd = vim.cmd
local opt = vim.opt
local M = {}
function M.copy()
    cmd('CocDisable')
    cmd('IndentBlanklineDisable')
    opt.relativenumber = false
    opt.number = false
    opt.signcolumn = 'no'
end
cmd('command -nargs=0 Copy lua require("commands").copy()')

function M.nocopy()
    cmd('CocEnable')
    cmd('IndentBlanklineEnable')
    opt.relativenumber = true
    opt.number = true
    opt.signcolumn = 'yes'
end
cmd('command -nargs=0 Nocopy lua require("commands").nocopy()')

cmd('command -nargs=0 Paste set paste')
cmd('command -nargs=0 Nopaste set nopaste')

-- Custom insert entering/leaving logic {{
cmd([[
autocmd InsertEnter * setlocal spell
autocmd InsertEnter * setlocal norelativenumber
autocmd InsertLeave * setlocal nospell
autocmd InsertLeave * setlocal relativenumber
]])
-- }}

-- Coc commands
cmd('command -nargs=0 Format :call CocActionAsync("format")')
-- Add `:Fold` command to fold current buffer.
cmd('command! -nargs=? Fold :call CocAction("fold", <f-args>)')

-- Add `:OR` command for organize imports of the current buffer.
cmd('command! -nargs=0 OR :call CocActionAsync("runCommand", "editor.action.organizeImport")')

-- Highlight the symbol and its references when holding the cursor.
cmd([[
autocmd CursorHold * silent call CocActionAsync('highlight')
]])
return M
