" http://coderkeen.com/old/articles/identifiers-en.html

" todo
"   highlight funcnames even in learnsuugakuy.example.functionName = function()..
"   error when no semicolon?

" highlight function names for prototypes
syn match javaScriptFuncName "\([a-zA-Z_]\+\)\(\s=\sfunction\)\@="
hi link javaScriptFuncName Function

" syntax highlighting on numbers
hi! link javaScriptNumber Number

" don't bold braces or the word function
hi! link javaScriptBraces NONE
hi! link javaScriptFunction NONE

" highlight doc components inside comments
syn match javaScriptParamDoc "@[a-z]\+" containedin=javaScriptComment
syn match javaScriptDocType "{[a-zA-Z\.]\+}" containedin=javaScriptComment nextgroup=javaScriptIdent skipwhite
syn match javaScriptIdent "[a-z_]\+" contained
hi link javaScriptDocType CommentSpecial
hi link javaScriptParamDoc CommentSpecial
hi link javaScriptIdent Identifier

