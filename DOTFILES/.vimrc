:set autoindent
:set cindent
:set shiftwidth=2
:set expandtab
:set  t_Co=256

inoremap 00 <ESC>:q

augroup autosave
  autocmd!
  autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
  autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
augroup END

call plug#begin('~/.vim/plugged')
" Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()
