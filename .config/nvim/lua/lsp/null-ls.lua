local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = true,
	on_attach = require("lsp.handlers").on_attach,
	sources = {
		formatting.prettier, -- Install in project dev dep (or npm i -g prettier)
		formatting.stylua, -- brew install cargo && cargo install stylua
		formatting.markdownlint, -- npm i -g markdownlint markdownlint-cli
		diagnostics.flake8, -- Install in project dev dep.
		diagnostics.markdownlint,
	},
})
