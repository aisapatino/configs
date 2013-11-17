" One or more of first set of words. Each has space at end
" One of second set of words (no space)
" Any combo of letters + spaces
" Ends when it reaches a (
syn region javaFuncStatement transparent start=+\(^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^>]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)\)(+ end=+)+ contains=javaFuncName,javaType,javaStorageClass,javaScopeDecl
syn match javaFuncName "\([a-zA-Z]*\)(\@=" contained
hi link javaFuncName Function

syn match javaClassName "\%(class\s\)\@<=\([A-Za-z]\)\+"
hi link javaClassName Function

syn cluster javaTop add=javaFuncStatement,javaClassName

hi link javaTypedef Keyword
