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
    vim.keymap.set('n', '<leader>f', function()
      local params = require('vim.lsp.util').make_formatting_params({})
      client.request('textDocument/formatting', params, nil, bufnr)
    end, { buffer = bufnr })
  end
end

local lsp_formatting = function(bufnr)
    vim.lsp.buf.format({
        filter = function(clients)
            -- filter out clients that you don't want to use
            return vim.tbl_filter(function(client)
                return client.name ~= "tsserver"
            end, clients)
        end,
        bufnr = bufnr,
    })
end

local function lsp_keymaps(client, bufnr)
	-- Use Telescope as much as possible
	local opts = { buffer = bufnr }

	-- Common mappings
	nmap("gd", "<cmd>Telescope lsp_definitions<CR>", opts)
	nmap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	nmap("gr", "<cmd>Telescope lsp_references<CR>", opts)
  nmap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	nmap("gE", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	nmap("ge", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	nmap("gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	-- Less common
	nmap("gi", "<cmd>Telescope lsp_implementations<CR>", opts)
	nmap("gy", "<cmd>Telescope lsp_type_definitions<CR>", opts)
  -- nmap("<leader>f", lsp_formatting(bufnr), opts)
  formatting_map(client, bufnr)
	map({ "v", "x" }, "<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)

	-- Only here just because
	nmap("<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	nmap("<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	nmap("<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	nmap("<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

function M.on_attach(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.renameProvider = false
  end
	lsp_keymaps(client, bufnr)
	lsp_highlight_document(client)
	require("lsp_signature").on_attach(client) -- Maybe remove client
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

-- Do so we can bind global functions
_G.lsp.handlers = M
return M
