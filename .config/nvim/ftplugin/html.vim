set tabstop=2
" Vanilla auto-closing mappings {{
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" }}
" Automatically start coc-angular
:call CocActionAsync('activeExtension', 'coc-angular') 
