syntax on
set tabstop=4
set autoindent
set shiftwidth=0
set expandtab
set scrolloff=10
set number
set showcmd
set linebreak
set wrap
set relativenumber
set noerrorbells
set title
set history=1000
set noswapfile
set lazyredraw
set showmatch
set incsearch
set hlsearch
set nowrap

nnoremap <Up> <Up>zz
nnoremap <Down> <Down>zz
nnoremap <C-Down> <C-w>w

let g:ale_completion_autoimport = 1
let g:ale_fixers = {
\    '*': [
\        'remove_trailing_lines',
\        'trim_whitespace'
\    ],
\    'python': [
\        'add_blank_lines_for_python_control_statements',
\        'autopep8',
\        'isort',
\        'yapf'
\    ]
\}
let g:ale_fix_on_save = 1
let g:flake8_max_line_length=100

call plug#begin()
Plug 'https://github.com/vim-python/python-syntax.git'
Plug 'NLKNguyen/papercolor-theme'
Plug 'https://github.com/tmhedberg/matchit.git'
Plug 'https://github.com/dense-analysis/ale'
Plug 'https://github.com/nvie/vim-flake8'
call plug#end()

set t_Co=256   " This is may or may not needed.

set background=dark
colorscheme PaperColor


filetype indent off
augroup python
    autocmd!
    autocmd FileType python setlocal noet ts=4 expandtab
augroup end
