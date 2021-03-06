syn match    cCustomParen    "?=(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def cCustomParen gui=bold guifg=red
hi def cCustomFunc  gui=bold guifg=#0000FF
hi def cCustomClass gui=reverse guifg=yellowgreen
hi def cCustomScope gui=bold guifg=cyan

