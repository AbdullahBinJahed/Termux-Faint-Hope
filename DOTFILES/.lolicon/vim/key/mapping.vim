"### Mapping Escape and Insert mode ###
nnoremap <Space> i
nnoremap <CR> i
noremap jj <ESC>
noremap! jj <ESC>

"### Saving and Exiting files ###
inoremap `` <ESC>:wq<CR>
noremap `` <ESC>:wq<CR>
noremap <C-s> <ESC>:w<CR>
noremap! <C-s> <ESC>:w<CR>
noremap <C-q> <ESC>:q!<CR>
noremap! <C-q> <ESC>:q!<CR>
"inoremap <C-x> <ESC>:q!<CR>  " Not working ...
"noremap <C-x> <ESC>:q!<CR>   " *sad ABJ noises*

"### Copy, Paste and Cut ###
vnoremap <C-c> y
noremap <c-p> Pi
vnoremap <c-x> d

"### Undo and Redo ###
nnoremap <C-Z> u
inoremap <C-Z> <C-O>u
nnoremap <C-r> <C-R>
inoremap <C-r> <C-O><C-R>

"### Selecting Line ###
inoremap <S-UP> <ESC><S-V>
inoremap <S-DOWN> <ESC><S-V>
inoremap <S-LEFT> <ESC><C-v>
inoremap <S-RIGHT> <ESC><C-v>
noremap <S-UP> <S-V>
noremap <S-DOWN> <S-V>
noremap <S-LEFT> <C-v>
noremap <S-RIGHT> <C-v>
vnoremap <S-UP> <UP>
vnoremap <S-DOWN> <DOWN>
vnoremap <S-LEFT> <LEFT>
vnoremap <S-RIGHT> <RIGHT>

"### Moving Lines Up Down ###
noremap [1;3A <ESC>:m-2<CR>
noremap! [1;3A <ESC>:m-2<CR>
noremap [1;3B <ESC>:m+<CR>
noremap! [1;3B <ESC>:m+<CR>

"### Copying line Up Down ###
inoremap [1;4B <ESC><S-V>ypi
inoremap [1;4A <ESC><S-V>y<UP>pi
noremap [1;4B <S-V>ypi
noremap [1;4A <S-V>y<UP>pi

"### File and Tabs ###
noremap! <F1> <ESC>:Texplore<CR>
noremap <F1> <ESC>:Texplore<CR>
noremap! <F1> <ESC>:Texplore<CR>
noremap [1;4D <ESC>:tabp<CR>
noremap! [1;4D <ESC>:tabp<CR>
noremap [1;4C <ESC>:tabn<CR> 
noremap! [1;4C <ESC>:tabn<CR>  

"### Comments ###
nnoremap  :s/^/#/<CR>i
inoremap  <ESC>:s/^/#/<CR>i
vnoremap  <S-I>#<ESC><ESC>i

"map <F9> a<C-R>=strftime("%c")<CR><Esc>
"map  <S-I>//<ESC><ESC>

"### Better nav for omnicomplete ###
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
"### <TAB>: completion. ###
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"### Better tabbing ###
vnoremap < <gv
vnoremap > >gv

"### Cmp-Shct shortcut ###
noremap <C-a> :!c<CR>
noremap! <C-a> <ESC>:!c<CR>
