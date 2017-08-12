syn match netrwExtension "\w\@<=\.[[:alnum:]]\+$" containedin=netrwPlain,netrwDotfile
syn match netrwDotfile "^\.\S\+[^/]$" containedin=netrwPlain

hi! link netrwExtension LineNr
hi! link netrwDotfile   NONE
hi! link netrwClassify  Comment
hi! link netrwExe       Question
hi! link netrwLink      netrwSymlink
hi! link netrwSymlink   Keyword

syn clear netrwClassify
syn match  netrwClassify "[*=|@/]\ze\%(\s\{2,}\|$\)" contained conceal
