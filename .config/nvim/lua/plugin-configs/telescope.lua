local colors = require('catppuccin.api.colors').get_colors()
local fg = require('utils').fg
local bg = require('utils').bg
local fg_bg = require('utils').fg_bg
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
    },
}

-- TODO make this better
local darker_black = colors.black1
local black2 = colors.black3
local white = colors.white
local red = colors.maroon
local green = colors.blue
local black = colors.black0

fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black2, black2)

fg_bg("TelescopePromptNormal", white, black2)
fg_bg("TelescopePromptPrefix", red, black2)

bg("TelescopeNormal", darker_black)

fg_bg("TelescopePreviewTitle", black, green)
fg_bg("TelescopePromptTitle", black, red)
fg_bg("TelescopeResultsTitle", darker_black, darker_black)
