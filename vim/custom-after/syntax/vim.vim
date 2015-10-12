hi! link vimFunction   ClassName

hi! link vimGroup      Identifier
hi! link vimHiGuiFgBg  NONE
hi! link vimHiGui      NONE

" Remove `nextgroup=vimCommand` from default to fix hi for options like diffopt
syn match  vimSetSep  contained  "[,:]" skipwhite
