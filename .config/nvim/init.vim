syntax on
set tabstop=4
set autoindent
set shiftwidth=0
set expandtab
set scrolloff=10
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
set laststatus=2
set noshowmode
set clipboard=unnamed

let mapleader = " "
nnoremap <Up> <Up>zz
nnoremap <Down> <Down>zz
nnoremap <C-Down> <C-w>w
nnoremap <leader>h :tabprevious<CR>
nnoremap <leader>l :tabnext<CR>
nnoremap <leader>nf :NERDTreeFocus<CR>
nnoremap <leader>no :NERDTreeFind<CR>
nnoremap <leader>nt :NERDTreeToggle<CR>

let g:lightline = {
  \ 'colorscheme': 'PaperColor',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ],
  \     [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \   ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'FugitiveHead'
  \ },
\ }

call plug#begin()
" General plugins
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'https://tpope.io/vim/fugitive.git'
Plug 'https://github.com/tpope/vim-surround'
Plug 'scrooloose/nerdtree'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'Valloric/YouCompleteMe'

" Python plugins
Plug 'https://github.com/vim-python/python-syntax.git'
Plug 'https://github.com/nvie/vim-flake8'
Plug 'vim-scripts/indentpython.vim'
Plug 'davidhalter/jedi'
Plug 'vim-syntastic/syntastic'

" Docker plugins
Plug 'https://github.com/ekalinin/Dockerfile.vim.git'
call plug#end()

set t_Co=256   " This is may or may not needed.

set background=dark
colorscheme PaperColor

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
