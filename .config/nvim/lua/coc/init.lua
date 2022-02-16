local g = vim.g
_G.coc = {}
-- Extensions to make sure you have at startup
g.coc_global_extensions = {
    'coc-sh', 'coc-tsserver', 'coc-pyright', 'coc-json', 'coc-angular', 'coc-git',
    'coc-markdownlint', 'coc-sumneko-lua',
}
require('coc.mappings')
