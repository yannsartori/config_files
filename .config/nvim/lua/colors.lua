local bg = require("utils").bg
local fg = require("utils").fg
local fg_bg = require("utils").fg_bg
local colors = require("catppuccin.api.colors").get_colors()

local darker_black = colors.mantle
local black3 = colors.surface0
local black3p5 = "#313040"
local white = colors.text
local red = colors.maroon
local yellow = colors.yellow
local purple = colors.lavender
local sky = colors.sky
local blue = colors.blue
local green = colors.green
local black = colors.crust
local base = colors.base

-- Line number
fg("cursorlinenr", white)

-- Window splits
fg("WinSeparator", white)

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
fg_bg("DiagnosticHint", purple, base)
fg_bg("DiagnosticError", red, base)
fg_bg("DiagnosticWarn", yellow, base)
fg_bg("DiagnosticInformation", green, base)
fg_bg("DiagnosticInfo", blue, base)

-- For telescope
fg_bg("TelescopeBorder", darker_black, darker_black)
fg_bg("TelescopePromptBorder", black3, black3)

fg_bg("TelescopePromptNormal", white, black3)
fg_bg("TelescopePromptPrefix", red, black3)

bg("TelescopeNormal", darker_black)

fg_bg("TelescopePreviewTitle", black, green)
fg_bg("TelescopePromptTitle", black, red)
fg_bg("TelescopeResultsTitle", darker_black, darker_black)

-- For treesitter context
bg("TreesitterContext", black3)
fg("TreesitterContextLineNumber", red)

-- For winbar
