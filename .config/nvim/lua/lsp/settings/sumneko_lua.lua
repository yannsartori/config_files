return {
  cmd = { '/Users/sartori2/.local/share/nvim/lsp_servers/lua-language-server/bin/lua-language-server' },
	settings = {
		Lua = {
			diagnostics = {
				globals = { 'vim' },
			},
      workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
}
