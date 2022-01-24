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

nnoremap <Up> <Up>zz
nnoremap <Down> <Down>zz
nnoremap <C-Down> <C-w>w

set background=dark

filetype indent off
augroup python
    autocmd!
    autocmd FileType python setlocal noet ts=4 expandtab
augroup end
