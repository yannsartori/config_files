local map = require("utils").map
local nmap = require("utils").nmap
local imap = require("utils").imap

-- Delete entire words
imap("<M-BS>", "<C-W>", { remap = false })

-- Better spell fixer
nmap("<leader>s", "<CMD>Telescope spell_suggest<CR>")
nmap("gs", "]s")
nmap("gS", "[s")

-- Buffer mappings
nmap("<leader>h", "<CMD>BufferLineCyclePrev<CR>")
nmap("<leader>H", "<CMD>BufferLineMovePrev<CR>")
nmap("<leader>l", "<CMD>BufferLineCycleNext<CR>")
nmap("<leader>L", "<CMD>BufferLineMoveNext<CR>")
nmap("gb", "<CMD>BufferLinePick<CR>")
-- Removes it
nmap("<leader>b", "<CMD>bp <BAR> bd #<CR>")

-- plugins {{
-- Note that some plugins (in particular, those with on_attach capabilities) have their mappings defined in their configuration files.
-- nvim-tree {{
nmap("<leader>nt", "<CMD>NvimTreeToggle<CR>")
nmap("<leader>nr", "<CMD>NvimTreeRefresh<CR>")
nmap("<leader>nf", "<CMD>NvimTreeFindFile<CR>")
-- }}

-- comment {{
map({ "n", "v" }, "<C-_>", "<leader>!", { remap = true })
-- }}

-- Telescope {{
nmap("<C-P>", "<CMD>Telescope find_files<CR>")
nmap("<C-F>", "<CMD>Telescope live_grep<CR>")
-- }}

-- git-conflict {{
nmap("<leader>co", "<Plug>(git-conflict-ours)")
nmap("<leader>cb", "<Plug>(git-conflict-both)")
nmap("<leader>c0", "<Plug>(git-conflict-none)")
nmap("<leader>ct", "<Plug>(git-conflict-theirs)")
nmap("<leader>gc", "<Plug>(git-conflict-next-conflict)")
nmap("<leader>gC", "<Plug>(git-conflict-prev-conflict)")
-- }}
-- vim-zoom {{
nmap("<C-w>z", "<C-w>m", { remap = true })
-- }}
-- }}

-- Unmap shit

-- vim.keymap.del()
