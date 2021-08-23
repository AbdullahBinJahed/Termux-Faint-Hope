""" My syntax """
syn match    cCustomParen    "?=(" contains=cParen contains=cCppParen
syn match    cCustomFunc     "\w\+\s*(\@=" contains=cCustomParen
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope
hi def link cCustomParen Function
hi def link cCustomFunc  Function
hi def link cCustomScope Function
"hi def link cCustomClass Function

hi def cCustomFunc  gui=bold guifg=yellowgreen
hi def link cCustomClass Function
