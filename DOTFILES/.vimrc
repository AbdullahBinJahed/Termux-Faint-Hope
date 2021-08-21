:set autoindent
:set cindent
:set shiftwidth=2
:set expandtab
:set  t_Co=256

" :colorscheme elflord

" inoremap ( ()<Esc>i
inoremap { {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
inoremap [ []<Esc>i
" inoremap < <><Esc>i
inoremap ' ''<Esc>i
inoremap " ""<Esc>i

" This matches character pairs that are defined.
function! ConditionalPairMap(open, close) abort
    let line = getline('.')
    let col = col('.')
    if col < col('$') || stridx(line, a:close, col + 1) != -1
        return a:open
    else
        return a:open . a:close . repeat("\<left>", len(a:close))
    endif
endfunction
inoremap <expr> ( ConditionalPairMap('(', ')')
inoremap <expr> { ConditionalPairMap('{', '}')
inoremap <expr> [ ConditionalPairMap('[', ']')

:set list lcs=tab:\|\
" let g:indentLine_setColors = 0
let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_color_term = 239
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
" let g:indentLine_setConceal = 0
" let g:indentLine_enabled = 0

call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
call plug#end()
