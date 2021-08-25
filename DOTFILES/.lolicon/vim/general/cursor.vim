"set ttimeout
"set ttimeoutlen=1
"set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
"set ttyfast

" - entered insert mode
let &t_SI = "[5 q]12;Magenta\007"
" - entered replace mode
let &t_SR = "[0 q]12;Red\007"
" - leaving insert/replace mode
let &t_EI = "[2 q]112\007"


