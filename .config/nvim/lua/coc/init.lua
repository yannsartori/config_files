local g = vim.g
_G.coc = {}
g.coc_global_extensions = {
    'coc-sh', 'coc-tsserver', 'coc-pyright', 'coc-json', 'coc-angular', 'coc-git',
    'coc-markdownlint', 'coc-sumneko-lua',
}
require('coc.mappings')
