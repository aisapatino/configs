" Syntax
"--------

" Recognize vim vars inside parens
syn cluster vimOperGroup add=vimVar

" Recognize highlight commands
syn keyword vimLink  link def containedin=@vimHighlightCluster,vimHiLink

" Remove nextgroup=vimCommand, for options with :, in their values
syn clear vimSetSep
syn match vimSetSep contained  "[,:]" skipwhite

" Remove `skip` from default to make trailing \  work
syn region vimSet matchgroup=vimCommand start="\<\%(setl\%[ocal]\|setg\%[lobal]\|se\%[t]\)\>" skip="\%(\\\\\)*\\." end="$" matchgroup=vimNotation end="<[cC][rR]>" keepend oneline contains=vimSetEqual,vimOption,vimErrSetting,vimComment,vimSetString,vimSetMod

" Conceal fold markers
syn match vimFoldMarker  "\"\?\({{{\|}}}\)\d\?"  containedin=vimLineComment conceal

" Highlight
"-----------

hi! link vimFoldMarker Folded
hi! link vimFunction   Function
hi! link vimFuncName   Keyword
hi! link vimLink       Statement
hi! link vimGroup      Identifier
hi! link vimHiGroup    Identifier
hi! link vimHiGuiFgBg  NONE
hi! link vimHiGui      NONE
hi! link vimHiAttrib   Constant
