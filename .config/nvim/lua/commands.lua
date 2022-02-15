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
vim.cmd('command Copy lua require("commands").copy()')

function M.nocopy()
    cmd('CocEnable')
    cmd('IndentBlanklineEnable')
    opt.relativenumber = true
    opt.number = true
    opt.signcolumn = 'yes'
end
cmd('command Nocopy lua require("commands").nocopy()')

cmd('command Paste set paste')
cmd('command Nopaste set nopaste')

-- Custom insert entering/leaving logic {{
cmd([[
autocmd InsertEnter * setlocal spell
autocmd InsertEnter * setlocal norelativenumber
autocmd InsertLeave * setlocal nospell
autocmd InsertLeave * setlocal relativenumber
]])
-- }}
return M
