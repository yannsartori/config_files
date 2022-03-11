local catppuccin = require("catppuccin")
catppuccin.setup({
	styles = {
		comments = "italic",
		functions = "bold",
		keywords = "italic",
		strings = "NONE",
		variables = "NONE",
	},
	integrations = {
		telescope = true,
	},
})
catppuccin.remap({
	TSProperty = { style = "NONE" }, -- italic
	TSConditional = { style = "italic" }, -- bold
	TSConstant = { style = "bold" }, -- NONE
	TSRepeat = { style = "italic" }, -- bold
	TSInclude = { style = "NONE" }, -- italic
	TSFuncBuiltin = { style = "bold" }, -- italic
	TSTypeBuiltin = { style = "NONE" }, -- italic
	TSVariableBuiltin = { style = "bold" }, -- italic
	TSMethod = { style = "bold" }, -- italic
	typescriptTSProperty = { style = "NONE" }, -- italic
})
