-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
require('nvim-lsp-installer').on_server_ready(function(server)
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
    flags = { debounce_text_changes = 150, }
	}

  local extra_configs = { 'angularls', 'jsonls', 'pyright', 'sumneko_lua', }
  for _, val in ipairs(extra_configs) do
    if server.name == val then
      extra_opts = require('lsp.settings.' .. val)
      opts = vim.tbl_deep_extend('force', extra_opts, opts)
    end
  end

	server:setup(opts)
end)
