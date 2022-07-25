local npairs = require("nvim-autopairs")
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

-- Autopairs when autocompleting a function
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({
  filetypes = {
    typescript = false,
  }
}))

npairs.setup({
	check_ts = true,
	enable_check_bracket_line = false,
	disable_filetype = { "TelescopePrompt", "vim" },
})
