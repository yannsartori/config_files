local catppuccin = require("catppuccin")
catppuccin.setup({
	styles = {
		comments = {"italic"},
		functions = {"bold"},
		keywords = {"italic"},
		strings = {},
		variables = {},
  },
  custom_highlights = {
    TSProperty = { style = {} }, -- italic
    TSConditional = { style = { "italic" } }, -- bold
    TSConstant = { style = { "bold" } }, -- NONE
    TSRepeat = { style = { "italic" } }, -- bold
    TSInclude = { style = {} }, -- italic
    TSFuncBuiltin = { style = { "bold" } }, -- italic
    TSTypeBuiltin = { style = {} }, -- italic
    TSVariableBuiltin = { style = { "bold" } }, -- italic
    TSMethod = { style = { "bold" } }, -- italic
    typescriptTSProperty = { style = {} }, -- italic
	},
	integrations = {
		telescope = true,
	},
  color_overrides = {
    all = {
      base = "#1E1E2E"
    }
  }
})
