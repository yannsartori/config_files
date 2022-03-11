local M = {}
local api = vim.api
local bnmap = require("utils").bnmap

function M.setup()
	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local config = {
		-- disable virtual text
		virtual_text = false,
		-- show signs
		signs = {
			active = signs,
		},
		update_in_insert = true,
		underline = true,
		severity_sort = true,
		float = {
			focusable = false,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(config)

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = false,
		underline = true,
		signs = true,
	})

	vim.cmd([[autocmd CursorHold * lua vim.diagnostic.open_float()]])

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
		border = "rounded",
	})

	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
		border = "rounded",
	})
end

-- Highlight on cursor hold
local function lsp_highlight_document(client)
	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		api.nvim_exec(
			[[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
			false
		)
	end
end

-- Mappings.
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	-- Common mappings
	bnmap(bufnr, "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	bnmap(bufnr, "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	bnmap(bufnr, "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	bnmap(bufnr, "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	bnmap(bufnr, "gE", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	bnmap(bufnr, "ge", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

	-- Less common
	bnmap(bufnr, "<leader>e", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	bnmap(bufnr, "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	bnmap(bufnr, "gy", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	bnmap(bufnr, "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

	-- Only here just because
	bnmap(bufnr, "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	bnmap(bufnr, "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	bnmap(bufnr, "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	bnmap(bufnr, "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

function M.on_attach(client, bufnr)
	if client.name == "tsserver" then
		client.resolved_capabilities.document_formatting = false
	end
	lsp_keymaps(bufnr)
	lsp_highlight_document(client)
	require("lsp_signature").on_attach(client) -- Maybe remove client
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Do so we can bind global functions
_G.lsp.handlers = M
return M

-- require('lspconfig').sumneko_lua.setup {
--   on_attach = on_attach,
--   cmd = { './lua-language-server/bin/lua-language-server' },
--   flags = {
--     debounce_text_changes = 150,
--   },
-- }
