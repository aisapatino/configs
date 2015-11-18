" Syntax highlighting
syn keyword vimLink  link def containedin=@vimHighlightCluster,vimHiLink
hi! link vimFunction   Keyword
hi! link vimLink       Statement
hi! link vimGroup      Identifier
hi! link vimHiGroup    Identifier
hi! link vimHiGuiFgBg  NONE
hi! link vimHiGui      NONE
hi! link vimHiAttrib   Constant

" Remove `nextgroup=vimCommand` from default to fix hi for options like diffopt
syn match   vimSetSep contained  "[,:]" skipwhite
" Remove `skip` to make trailing \  work
syn region  vimSet    matchgroup=vimCommand start="\<\%(setl\%[ocal]\|setg\%[lobal]\|se\%[t]\)\>" skip="\%(\\\\\)*\\." end="$" matchgroup=vimNotation end="<[cC][rR]>" keepend oneline contains=vimSetEqual,vimOption,vimErrSetting,vimComment,vimSetString,vimSetMod

syn match vimFoldMarker  "\"\?\({{{\|}}}\)\d\?"  containedin=vimLineComment conceal
hi! link vimFoldMarker Folded
