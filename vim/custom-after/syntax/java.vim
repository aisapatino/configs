" Java function statement:
" One or more of first set of words. Each has space at end
" One of second set of words (no space)
" Any combo of letters + spaces
" Ends when it reaches a (
let lineStart = '^\s\+'
let spaces = '\s\+'
let scopeWords='\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)'

execute 'syn region javaFuncStatement transparent start=+' . lineStart . scopeWords . spaces . '+ end=+)+ contains=javaFuncName,javaType,javaStorageClass,javaScopeDecl,javaC_JavaLang'
syn match javaFuncName '\([a-zA-Z0-9]*\)(\@=' contained

syn match javaClassName '\%(class\s\)\@<=\([A-Za-z]\)\+'

hi! link javaFuncName   Function
hi! link javaClassName  ClassName
hi! link javaTypedef    Keyword
