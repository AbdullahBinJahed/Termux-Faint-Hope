" :set autoindent 
" :set cindent
:set tabstop=2
:set softtabstop=2
:set shiftwidth=2
:set expandtab
:set number

filetype plugin indent on

"""""" One
"set t_8b=[48;2;%lu;%lu;%lum
"set t_8f=[38;2;%lu;%lu;%lum
"""""" One end
set t_Co=256

if (has("termguicolors"))
  set termguicolors
endif


:nnoremap <Space> i
:nnoremap <CR> i

"#### Saving and Exiting files
:inoremap 00 <ESC>:wq<CR>
:noremap 00 <ESC>:wq<CR>
:noremap <C-s> <ESC>:w<CR>
:noremap! <C-s> <ESC>:w<CR>
:noremap <C-q> <ESC>:q!<CR>
:noremap! <C-q> <ESC>:q!<CR>
":inoremap <C-x> <ESC>:q!<CR>  " Not working ...
":noremap <C-x> <ESC>:q!<CR>   " *sad ABJ noises*

"#### Copy, Paste and Cut ####"
:noremap <C-c> y
:noremap <C-V> p
:noremap <C-X> d

"#### Undo and Redo ####"
nnoremap <C-Z> u
inoremap <C-Z> <C-O>u
nnoremap <C-Y> <C-R>
inoremap <C-Y> <C-O><C-R>

"#### Selecting Line ####"
:inoremap <S-UP> <ESC><S-V>
:inoremap <S-DOWN> <ESC><S-V>
:inoremap <S-LEFT> <ESC><C-v>
:inoremap <S-RIGHT> <ESC><C-v>

"#### Moving Lines Up Down
:noremap [1;3A <ESC>:m-2<CR>
:noremap! [1;3A <ESC>:m-2<CR>
:noremap [1;3B <ESC>:m+<CR>
:noremap! [1;3B <ESC>:m+<CR>

"### Copying line Up Down
inoremap [1;4B <ESC><S-V>ypi
inoremap [1;4A <ESC><S-V>y<UP>pi

:noremap! <F1> <ESC>:Texplore<CR>

" #### File and Tabs #### "
:noremap <F1> <ESC>:Texplore<CR>
:noremap! <F1> <ESC>:Texplore<CR>
:noremap [1;4D <ESC>:tabp<CR>
:noremap! [1;4D <ESC>:tabp<CR>
:noremap [1;4C <ESC>:tabn<CR> 
:noremap! [1;4C <ESC>:tabn<CR>  

"#### Comments ####"


":map <F9> a<C-R>=strftime("%c")<CR><Esc>
":map  <S-I>//<ESC><ESC>

"#### Cursor ####"
" - entered insert mode
let &t_SI = "\e[5 q\e]12;blue\x7"
" - entered replace mode
let &t_SR = "\e[0 q\e]12;Red\007"
" - leaving insert/replace mode
let &t_EI = "\e[2 q\e]112\007"

""" Function highlighting """
hi cCustomFunc  gui=bold guifg=red
hi cCustomClass gui=reverse guifg=#00FF00
hi cCustomParen gui=bold guifg=#FF0000
hi cCustomScope gui=bold guifg=#FFFFFF


" augroup autosave
"   autocmd!
"   autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
"   autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
" augroup END

call plug#begin('~/.vim/plugged')
"Plug 'mattn/emmet-vim'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'rakr/vim-one'
Plug 'cseelus/vim-colors-lucid'
Plug 'Yggdroot/indentLine'
call plug#end()


"""""" One """"""
"let g:airline_theme='one'
"set background=dark
"let g:one_allow_italics = 1
":colorscheme one
"call one#highlight('vimLineComment', 'cccccc', '', 'italic')

"if (empty($TMUX))
"  if (has("nvim"))
"    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"  endif
"endif


"""""" Lucid """"""
colorscheme lucid
set background=dark
syntax on

"""""" IndentLine """"""
" let g:indentLine_setColors = 0
" let g:indentLine_defaultGroup = 'SpecialKey'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
