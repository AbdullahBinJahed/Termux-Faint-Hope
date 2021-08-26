"### Mapping Escape and Insert mode ###
nnoremap <Space> i
nnoremap <CR> i
noremap jk <ESC>
noremap! jk <ESC>
noremap kj <ESC>
noremap! kj <ESC>
vnoremap <CR> <ESC>
vnoremap <BS> d
inoremap <Esc> <Esc>l

"### Saving and Exiting files ###
inoremap 99 <ESC>:wq<CR>
noremap 99 <ESC>:wq<CR>
noremap <C-s> <ESC>:w<CR>
noremap! <C-s> <ESC>:w<CR>
noremap <C-q> <ESC>:q!<CR>
noremap! <C-q> <ESC>:q!<CR>

"### Copy, Paste and Cut ###
vnoremap <C-c> y$
noremap <C-p> Pi
vnoremap <C-X> d

"### Undo and Redo ###
nnoremap <C-Z> u
inoremap <C-Z> <C-O>u
nnoremap <C-a> <C-R>
inoremap <C-a> <C-O><C-R>

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
nnoremap [1;3A :m-2<CR>==
nnoremap [1;3B :m+<CR>==
inoremap [1;3A <ESC>:m-2<CR>
inoremap [1;3B <ESC>:m+<CR>
vnoremap <A-UP> :m '<-2<CR>gv=gv
vnoremap <A-DOWN> :m '>+1<CR>gv=gv
"nnoremap <A-UP> :m .-2<CR>==
"nnoremap <A-DOWN> :m .+1<CR>==
"inoremap <A-DOWN> <Esc>:m .+1<CR>==gi
"inoremap <A-UP> <Esc>:m .-2<CR>==gi

"### Copying line Up Down ###
inoremap [1;4A <ESC><S-V>y<UP>pi
nnoremap [1;4A <S-V>y<UP>pi
vnoremap [1;4A <Up>:copy .<CR>
inoremap [1;4B <ESC><S-V>ypi
nnoremap [1;4B <S-V>ypi
vnoremap [1;4B :copy '><CR>

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
inoremap  <C-o>:s/^/#/<CR>
vnoremap  <S-I>#<ESC><ESC>i

"### Better nav for omnicomplete ###
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")
"### <TAB>: completion. ###
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
"### Better tabbing ###
vnoremap  <gv
vnoremap  >gv

"### Cmp-Shct shortcut ###
"nnoremap <F8> :w<CR>:!c %<CR>
"inoremap! <F8> <ESC>:w<CR>:!c %<CR>
nnoremap <C-r> :w<CR>:!c %<CR>
inoremap <C-r> <ESC>:w<CR>:!c %<CR>

"### Cursor moving ###
noremap <C-Right> 7l
noremap <C-Left> 7h
inoremap <A-Right> <C-o>99l<Right>
inoremap <A-Left> <C-o>99h
nnoremap <A-Right> 99li<Right>
nnoremap <A-Left> 99hi

"### Window moving ###
noremap <C-Up> <C-y>
noremap <C-Down> <C-e>
vnoremap <C-Up> <C-y>
vnoremap <C-Down> <C-e>
inoremap <C-Up> <C-O><C-y>
inoremap <C-Down> <C-O><C-e>

