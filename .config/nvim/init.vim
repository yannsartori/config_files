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
set signcolumn=yes
set shiftwidth=0
set shortmess+=c
set showmatch
set spelllang
set spellsuggest=best,9
set tabstop=4
set title
set updatetime=300
set foldlevelstart=99

let mapleader = " "

call plug#begin()
" Aesthetic Plugins {{
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'itchyny/lightline.vim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'akinsho/bufferline.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
" }}

" Usability Plugins {{
Plug 'dhruvasagar/vim-zoom'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'lewis6991/spellsitter.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yannsartori/neovim-jsdoc.py'
" }}

" LSP Plugins {{
Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
    integrations = {
        telescope = true,
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

" BufferLine config {{
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

" Indent-blankline config {{
lua <<EOF
vim.opt.list = true

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF
" }}

" Vim-Zoom config {{
let g:zoom_tmux_z = v:true
" }}

" Nvim-tree config {{
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
let g:nvim_tree_change_dir_global = 1 "0 by default, use :cd when changing directories.
let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'notify',
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
" Dictionary of buffer option names mapped to a list of option values that
" indicates to the window picker that the buffer's window should not be
" selectable.
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath.
"if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
"but this will not work when you set indent_markers (because of UI conflict)

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }

nnoremap <leader>nt :NvimTreeToggle<CR>
nnoremap <leader>nr :NvimTreeRefresh<CR>
nnoremap <leader>nf :NvimTreeFindFile<CR>
" NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue
lua <<EOF
    require'nvim-tree'.setup {
      disable_netrw       = true,
      hijack_netrw        = true,
      open_on_setup       = false,
      ignore_ft_on_setup  = {},
      auto_close          = false,
      open_on_tab         = false,
      hijack_cursor       = false,
      update_cwd          = false,
      update_to_buf_dir   = {
        enable = true,
        auto_open = true,
      },
      diagnostics = {
        enable = false,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        }
      },
      update_focused_file = {
        enable      = false,
        update_cwd  = false,
        ignore_list = {}
      },
      system_open = {
        cmd  = nil,
        args = {}
      },
      filters = {
        dotfiles = false,
        custom = {}
      },
      git = {
        enable = true,
        ignore = false,
        timeout = 500,
      },
      view = {
        width = 30,
        height = 30,
        hide_root_folder = false,
        side = 'left',
        auto_resize = false,
        mappings = {
          custom_only = false,
          list = {}
        },
        number = false,
        relativenumber = false,
        signcolumn = "yes"
      },
      trash = {
        cmd = "trash",
        require_confirm = true
      }
    }
EOF
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
-- remap('i', '<esc>', [[pumvisible() ? "<c-e><esc>" : "<esc>"]], { expr = true, noremap = true })
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

" Comment.nvim config {{
lua <<EOF
require'Comment'.setup {
    toggler = {
        block = 'g|c'
    },
    opleader = {
        block = 'g|',
    }
}
EOF
map <C-_> gc
" }}
" Spellsitter config {{
" lua require('spellsitter').setup()
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
  incremental_selection = {enable = true}
}
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
" }}


" Coc config {{
" Default extensions to install if not present
let g:coc_global_extensions=['coc-sh', 'coc-tsserver', 'coc-pyright', 'coc-json', 'coc-angular', 'coc-git', 'coc-markdownlint']

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

" Telescope config {{
nnoremap <C-P> <cmd>Telescope find_files<cr>
nnoremap <C-F> <cmd>Telescope live_grep<cr>
lua <<EOF
local colors = require'catppuccin.api.colors'.get_colors()
require('telescope').setup{
    defaults = {
        prompt_prefix = "  ",
        selection_caret = "  ",
        entry_prefix = "  ",
        layout_config = {
            horizontal = {
               prompt_position = "top",
               preview_width = 0.55,
               results_width = 0.8,
            },
            vertical = {
               mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
        },
        path_display = { "truncate" },
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" },
    }
}
-- TODO make this better
local darker_black = colors.black1
local black2 = colors.black3
local white = colors.white
local red = colors.maroon
local green = colors.blue
local black = colors.black0
vim.cmd("hi TelescopeBorder guifg=" .. darker_black .. " guibg=" .. darker_black)
vim.cmd("hi TelescopePromptBorder guifg=" .. black2 .. " guibg=" .. black2)

vim.cmd("hi TelescopePromptNormal guifg=" .. white .. " guibg=" .. black2)
vim.cmd("hi TelescopePromptPrefix guifg=" .. red .. " guibg=" .. black2)

vim.cmd("hi TelescopeNormal guibg=" .. darker_black)

vim.cmd("hi TelescopePreviewTitle guifg=" .. black .. " guibg=" .. green)
vim.cmd("hi TelescopePromptTitle guifg=" .. black .. " guibg=" .. red)
vim.cmd("hi TelescopeResultsTitle guifg=" .. darker_black .. " guibg=" .. darker_black)

vim.cmd("hi TelescopeSelection guibg=" .. black2)
EOF
" }}

" Custom commands {{
function _Copy()
    :CocDisable
    :IndentBlanklineDisable
    :set norelativenumber nonumber signcolumn=no
endfunction
:command Copy call _Copy()

function _Nocopy()
    :CocEnable
    :IndentBlanklineEnable
    :set relativenumber number signcolumn=yes  
endfunction
:command Nocopy call _Nocopy()

" Only here for consistency
:command Paste set paste
:command Nopaste set nopaste
" }}

" Custom insert entering/leaving logic {{
autocmd InsertEnter * setlocal spell
autocmd InsertEnter * setlocal norelativenumber
autocmd InsertLeave * setlocal nospell
autocmd InsertLeave * setlocal relativenumber
" }}
" General mappings {{
" Delete entire words
inoremap <M-BS> <C-W> 
" Better spell fixer
nnoremap <leader>s z=
nnoremap gs ]s
nnoremap gS [s
" }}

" Buffer mappings {{
nnoremap <leader>h :bprevious<CR>
nnoremap <leader>l :bnext<CR>
nnoremap gb :BufferLinePick<CR>
" Removes it
nmap <leader>b :bp <BAR> bd #<CR>
" }}

