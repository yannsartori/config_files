local map = require('utils').map
local nmap = require('utils').nmap
local imap = require('utils').imap

-- Delete entire words
imap('<M-BS>', '<C-W>', {noremap = true})

-- Better spell fixer
nmap('<leader>s', 'z=')
nmap('gs', ']s')
nmap('gS', '[s0')

-- Buffer mappings
nmap('<leader>h', '<CMD>bprevious<CR>')
nmap('<leader>l', '<CMD>bnext<CR>')
nmap('gb', '<CMD>BufferLinePick<CR>')
-- Removes it
nmap('<leader>b', '<CMD>bp <BAR> bd #<CR>')

-- plugins {{

-- nvim-tree {{
nmap('<leader>nt', '<CMD>NvimTreeToggle<CR>')
nmap('<leader>nr', '<CMD>NvimTreeRefresh<CR>')
nmap('<leader>nf', '<CMD>NvimTreeFindFile<CR>')
-- }}

-- comment {{
map('', '<C-_>', 'gc')
-- }}

-- Telescope {{
nmap('<C-P>', '<CMD>Telescope find_files<CR>')
nmap('<C-F>', '<CMD>Telescope live_grep<CR>')
-- }}
-- }}


