vim.g['lightline'] = {
     colorscheme = 'catppuccin',
     active = {
         left = {
             { 'mode', 'paste' },
             { 'gitbranch', 'readonly', 'filename', 'modified' },
         },
         right = {
             { 'filetype', 'lineinfo', 'percent' },
         },
     },
    component_function = {
        gitbranch = 'FugitiveHead',
        status = 'LspStatus',
     },
}
