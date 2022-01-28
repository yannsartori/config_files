set cmdheight=2
set expandtab
set hidden
set lazyredraw
set linebreak
set noerrorbells
set nobackup
set noswapfile
set noshowmode
set nowritebackup
set number
set relativenumber
set scrolloff=10
set signcolumn=number
set shiftwidth=0
set shortmess+=c
set showmatch
set tabstop=4
set title
set updatetime=300
set foldlevelstart=99
set signcolumn=yes

" General mappings {{
let mapleader = " "
" }}

" Buffer mappings {{
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
nnoremap gb :BufferLinePick<CR>
" Removes it
nmap <leader>b :bp <BAR> bd #<CR>
" }}

" Nerd tree mappings
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>no :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>
" }}

call plug#begin()
" Aesthetic Plugins {{
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
" }}

" Usability Plugins {{
Plug 'dhruvasagar/vim-zoom'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" }}

" LSP Plugins {{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" }}


" Typescript/Javascript Plugins {{
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'typescript'],
  \ 'do': 'make install'
\}
" }}

" HTML Plugins {{
Plug 'alvan/vim-closetag'
" }}

call plug#end()

" Built-in Vim/Neovim config {{
let g:vimsyn_embed= 'lPr'
" }}

" Catppuccin config {{
lua <<EOF
local catppuccin = require("catppuccin")
catppuccin.setup({
    styles = {
        comments = "italic",
        functions = "bold",
        keywords = "italic",
        strings = "NONE",
        variables = "NONE",
    },
})
catppuccin.remap({
    TSProperty = {style = "NONE"}, -- italic
    TSConditional = {style = "italic"}, -- bold
    TSConstant = {style = "bold"}, -- NONE
    TSRepeat = {style = "italic"}, -- bold
    TSInclude = {style = "NONE"}, -- italic
    TSFuncBuiltin = {style = "bold"}, -- italic
    TSTypeBuiltin = {style = "NONE"}, -- italic
    TSVariableBuiltin = {style = "bold"}, -- italic
    TSMethod = {style = "bold"}, -- italic
    typescriptTSProperty = { style = "NONE" } -- italic
})
EOF
set termguicolors
" }}

" LightLine config {{
function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction
let g:lightline = {
  \ 'colorscheme': 'catppuccin',
  \ 'active': {
  \   'left': [
  \     ['mode', 'paste'],
  \     ['cocstatus', 'currentfunction', 'gitbranch', 'readonly', 'filename', 'modified'],
  \   ],
  \   'right': [
  \     [ 'filetype', 'lineinfo', 'percent' ],
  \   ],
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead',
  \   'cocstatus': 'coc#status',
  \   'currentfunction': 'CocCurrentFunction',
  \ },
\ }
" }}

" Vim-Zoom config {{
let g:zoom_tmux_z = v:true
" }}

" Bufferline config {{
lua <<EOF
require("bufferline").setup{
    options={
        numbers="ordinal",
        diagnostics="coc",
        separator_style="thick",
    }
}
EOF
" }}

" Telescope config {{
nnoremap <C-P> <cmd>Telescope find_files<cr>
nnoremap <C-F> <cmd>Telescope live_grep<cr>
" }}

" Nvim-autopairs config {{
lua <<EOF
local remap = vim.api.nvim_set_keymap
local npairs = require('nvim-autopairs')

npairs.setup({
    map_bs=false,
    map_cr=false,
    disable_filetype={ "TelescopePrompt" , "vim" },
})

vim.g.coq_settings = { keymap = { recommended = false } }

-- these mappings are coq recommended mappings unrelated to nvim-autopairs
remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
remap('i', '<c-c>', [[pumvisible() ? "<c-e><c-c>" : "<c-c>"]], { expr = true, noremap = true })
remap('i', '<tab>', [[pumvisible() ? "<c-n>" : "<tab>"]], { expr = true, noremap = true })
remap('i', '<s-tab>', [[pumvisible() ? "<c-p>" : "<bs>"]], { expr = true, noremap = true })

-- skip it, if you use another global object
_G.MUtils= {}

MUtils.CR = function()
  if vim.fn.pumvisible() ~= 0 then
    if vim.fn.complete_info({ 'selected' }).selected ~= -1 then
      return npairs.esc('<c-y>')
    else
      return npairs.esc('<c-e>') .. npairs.autopairs_cr()
    end
  else
    return npairs.autopairs_cr()
  end
end
remap('i', '<cr>', 'v:lua.MUtils.CR()', { expr = true, noremap = true })

MUtils.BS = function()
  if vim.fn.pumvisible() ~= 0 and vim.fn.complete_info({ 'mode' }).mode == 'eval' then
    return npairs.esc('<c-e>') .. npairs.autopairs_bs()
  else
    return npairs.autopairs_bs()
  end
end
remap('i', '<bs>', 'v:lua.MUtils.BS()', { expr = true, noremap = true })
EOF
" }}

" Treesitter config {{
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {'bash', 'css', 'dockerfile', 'html', 'javascript', 'jsdoc', 'json', 'lua', 'python', 'typescript', 'vim', 'yaml'},
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true,
  },
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}


" Coc config {{
" Default extensions to install if not present
let g:coc_global_extensions=['coc-sh', 'coc-tsserver', 'coc-pyright', 'coc-json', 'coc-angular', 'coc-git']

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
 " Go to Error (like f)
nmap <silent> gE <Plug>(coc-diagnostic-prev)
nmap <silent> ge <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Param help
inoremap <C-P> <C-\><C-O>:call CocActionAsync('showSignatureHelp')<cr>

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

colorscheme catppuccin
