local lspconfig = require("lspconfig")
local all_servers = {
	"angularls", --(npm install -g @angular/language-service@next typescript @angular/language-server)
	"bashls",
	"cssls",
	"dockerls",
	"elixirls",
  "gopls",
	"html",
	"jsonls",
	"pyright",
  "rust_analyzer",
	"lua_ls",
  "svelte",
	"taplo",
	"tsserver",
	"yamlls",
	"zk", -- (brew install zk)
}
local extra_configs = { "angularls", "jsonls", "pylsp", "pyright", "lua_ls" }

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = all_servers,
})

for _, server in ipairs(all_servers) do
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
		flags = { debounce_text_changes = 150 },
	}
	for _, val in ipairs(extra_configs) do
		if server == val then
			local extra_opts = require("lsp.settings." .. val)
			opts = vim.tbl_deep_extend("force", extra_opts, opts)
		end
	end

	lspconfig[server].setup(opts)
end
