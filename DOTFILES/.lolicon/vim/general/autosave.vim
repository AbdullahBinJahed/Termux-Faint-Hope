" augroup autosave
"   autocmd!
"   autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
"   autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
" augroup END
