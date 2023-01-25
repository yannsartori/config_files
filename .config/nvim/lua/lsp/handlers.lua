local M = {}
local api = vim.api
local map = require("utils").map
local nmap = require("utils").nmap

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
	if client.server_capabilities.documentHighlightProvider and client.name ~= "html" then
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
local function formatting_map(client, bufnr)
	local disabled_servers = { -- basically null_ls servers
		["angularls"] = true,
		["cssls"] = true,
		["html"] = true,
		["pyright"] = true,
		["sumneko_lua"] = true,
		["tsserver"] = true,
		["yamlls"] = true,
		["zk"] = true,
	}

	if disabled_servers[client.name] == nil then
		vim.keymap.set("n", "<leader>f", function()
			local params = require("vim.lsp.util").make_formatting_params({})
			client.request("textDocument/formatting", params, nil, bufnr)
		end, { buffer = bufnr })
	end
end

local function lsp_keymaps(client, bufnr)
	-- Prioritize LSPSaga > Telescope > builtin lsp
	local opts = { buffer = bufnr }

	-- Common mappings
	nmap("gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	nmap("gD", "<cmd>Lspsaga peek_definition<CR>", opts)
	nmap("K", "<cmd>Lspsaga hover_doc<CR>", opts)
	nmap("gr", "<cmd>Lspsaga lsp_finder<CR>", opts)
	nmap("<leader>rn", "<cmd>Lspsaga rename<CR>", opts)
	nmap("gE", "<cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	nmap("ge", "<cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	nmap("gl", "<cmd>Lspsaga show_line_diagnostics<CR>", opts)

	-- Less common
	nmap("gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	nmap("gy", "<cmd>Telescope lsp_type_definitions<CR>", opts)
	formatting_map(client, bufnr)
	map({ "v", "x" }, "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
	nmap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

function M.on_attach(client, bufnr)
	local inferior_servers = { -- servers who are doubled up with another, and we don't want their capabilities
		["tsserver"] = true,
	}
	if inferior_servers[client.name] ~= nil then
		client.server_capabilities.renameProvider = false
		client.server_capabilities.definitionProvider = false
		client.server_capabilities.referencesProvider = false
	end

	lsp_keymaps(client, bufnr)
	lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Do so we can bind global functions
_G.lsp.handlers = M
return M
