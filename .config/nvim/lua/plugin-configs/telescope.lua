require('telescope').setup {
    defaults = {
        prompt_prefix = '  ',
        selection_caret = '  ',
        entry_prefix = '  ',
        layout_config = {
            horizontal = {
               prompt_position = 'top',
               preview_width = 0.55,
               results_width = 0.8,
            },
            vertical = {
               mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        path_display = {
            'truncate'
        },
        winblend = 0,
        border = {},
        borderchars = {
            '─', '│', '─', '│', '╭', '╮', '╯', '╰'
        },
        color_devicons = true,
        use_less = true,
        set_env = {
            COLORTERM = 'truecolor'
        },
        file_ignore_patterns = { 'lua-language-server' }
    },
}

