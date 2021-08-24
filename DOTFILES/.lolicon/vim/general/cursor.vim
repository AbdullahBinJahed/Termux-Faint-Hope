" - entered insert mode
let &t_SI = "\e[5 q\e]12;blue\x7"
" - entered replace mode
let &t_SR = "\e[0 q\e]12;Red\007"
" - leaving insert/replace mode
let &t_EI = "\e[2 q\e]112\007"

