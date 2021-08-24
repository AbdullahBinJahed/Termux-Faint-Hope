syn match    cCustomParen    "?=(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def cCustomParen gui=bold guifg=red
hi def cCustomFunc  gui=bold guifg=yellow
hi def cCustomClass gui=reverse guifg=green
hi def cCustomScope gui=bold guifg=red

