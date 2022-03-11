local bg = require('utils').bg
local fg = require('utils').fg
local fg_bg = require('utils').fg_bg
local colors = require('catppuccin.api.colors').get_colors()

-- TODO make this better
local darker_black = colors.black1
local black3 = colors.black3
local black3p5 = "#313040"
local white = colors.white
local red = colors.maroon
local yellow = colors.yellow
local purple = colors.lavender
local sky = colors.sky
local blue = colors.blue
local green = colors.green
local black = colors.black0

-- Line number
fg("cursorlinenr", white)

-- Hide
fg("EndOfBuffer", black)

-- For floating windows
fg("FloatBorder", blue)
bg("NormalFloat", darker_black)

-- Pmenu
bg("Pmenu", black3)
bg("PmenuSbar", black3p5)
bg("PmenuSel", colors.mauve)
bg("PmenuThumb", sky)
fg("CmpItemAbbr", white)
fg("CmpItemAbbrMatch", white)
fg("CmpItemKind", white)
fg("CmpItemMenu", white)

-- For lsp diagnostics
fg("DiagnosticHint", purple)
fg("DiagnosticError", red)
fg("DiagnosticWarn", yellow)
fg("DiagnosticInformation", green)

-- For telescope
fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black3, black3)

fg_bg("TelescopePromptNormal", white, black3)
fg_bg("TelescopePromptPrefix", red, black3)

bg("TelescopeNormal", darker_black)

fg_bg("TelescopePreviewTitle", black, green)
fg_bg("TelescopePromptTitle", black, red)
fg_bg("TelescopeResultsTitle", darker_black, darker_black)
