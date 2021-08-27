" augroup autosave
"   autocmd!
"   autocmd BufRead * if &filetype == "" | setlocal ft=text | endif
"   autocmd FileType * autocmd TextChanged,InsertLeave <buffer> if &readonly == 0 | silent write | endif
" augroup END

augroup vimrcEx
  autocmd!

autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"autocmd BufRead,BufNewFile *.md set filetype=markdown
"autocmd BufRead,BufNewFile
"    \ aliases.local,
"    \zshenv.local,zlogin.local,zlogout.local,zshrc.local,zprofile.local,
"    \*/zsh/configs/*
"    \ set filetype=sh
"  autocmd BufRead,BufNewFile gitconfig.local set filetype=gitconfig
"  autocmd BufRead,BufNewFile tmux.conf.local set filetype=tmux
"  autocmd BufRead,BufNewFile vimrc.local set filetype=vim
augroup END

"augroup commenting_blocks_of_code
"  autocmd!
"  autocmd FileType c,cpp,java,javascript let s:comment_map = '// '
"  autocmd FileType sh,python,bash        let s:comment_map = '# '
"  autocmd FileType vim                   let s:comment_map = '" '
"augroup END
"noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


