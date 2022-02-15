function CocCurrentFunction()
    return vim.fn.get('b:', 'coc_current_function', '')
end
vim.g['lightline'] = {
     colorscheme = 'catppuccin',
     active = {
         left = {
             { 'mode', 'paste' },
             { 'cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified' },
         },
         right = {
             { 'filetype', 'lineinfo', 'percent' },
         },
     },
    component_function = {
    gitbranch = 'FugitiveHead',
    cocstatus = 'coc#status',
    currentfunction = 'CocCurrentFunction',
 },
}
