set tabstop=2

" JsDoc config {
nnoremap <leader>jd :JsDoc<CR>
let g:jsdoc_formatter = 'tsdoc'
" }}

" Vanilla auto-closing mappings {{
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" }}
