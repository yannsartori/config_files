local map = require("utils").map
local nmap = require("utils").nmap
local imap = require("utils").imap

-- Delete entire words
imap("<M-BS>", "<C-W>", { remap = false })

-- Better spell fixer
nmap("<leader>sf", "<CMD>Telescope spell_suggest<CR>")

-- Buffer mappings
nmap("<leader>b", "<CMD>bp <BAR> bd #<CR>")

-- Pair programming
local relative_number_toggler = function()
	if vim.api.nvim_win_get_option(0, "relativenumber") then
		vim.api.nvim_win_set_option(0, "relativenumber", false)
	else
		vim.api.nvim_win_set_option(0, "relativenumber", true)
	end
end
nmap("<leader>\\", relative_number_toggler)

-- plugins {{
-- Note that some plugins (in particular, those with on_attach capabilities) have their mappings defined in their configuration files.
-- nvim-tree {{
nmap("<leader>nt", "<CMD>NvimTreeToggle<CR>")
nmap("<leader>nr", "<CMD>NvimTreeRefresh<CR>")
nmap("<leader>nf", "<CMD>NvimTreeFindFileToggle<CR>")
-- }}

-- comment {{
map({ "n", "v" }, "<C-_>", "<leader>!", { remap = true })
-- }}

-- Telescope {{
nmap("<C-P>", "<CMD>Telescope find_files<CR>")
nmap("<C-F>", "<CMD>Telescope live_grep<CR>")
nmap("<leader>gb", "<CMD>Telescope buffers<CR>")
-- }}

-- git-conflict {{
nmap("<leader>co", "<CMD>GitConflictChooseOurs<CR>")
nmap("<leader>cb", "<CMD>GitConflictChooseBoth<CR>")
nmap("<leader>c0", "<CMD>GitConflictChooseNone<CR>")
nmap("<leader>ct", "<CMD>GitConflictChooseTheirs<CR>")
nmap("<leader>gc", "<CMD>GitConflictNextConflict<CR>")
nmap("<leader>gC", "<CMD>GitConflictPrevConflict<CR>")
-- }}

-- Treesj {{
nmap("<leader>ss", "<CMD>TSJToggle<CR>")
-- }}

-- vim-maximizer {{
nmap("<C-W>z", "<CMD>MaximizerToggle<CR>")
-- }}

-- }}
