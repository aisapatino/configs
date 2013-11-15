" http://coderkeen.com/old/articles/identifiers-en.html

" todo
"   highlight funcnames even in learnsuugakuy.example.functionName = function()..
"   error when no semicolon?


" syntax highlighting on numbers
hi! link javaScriptNumber Number

" don't bold braces
hi! link javaScriptBraces NONE

" highlight var, this as keywords, not identifiers
hi! link javaScriptIdentifier Keyword

" highlight doc components inside comments
syn match javaScriptParamDoc "@[a-z]\+" containedin=javaScriptComment
syn match javaScriptDocType "{[a-zA-Z\.]\+}" containedin=javaScriptComment nextgroup=javaScriptIdent skipwhite
syn match javaScriptIdent "[a-z_]\+" contained
hi link javaScriptDocType CommentKey
hi link javaScriptParamDoc CommentKey

hi link javaScriptIdent Identifier

