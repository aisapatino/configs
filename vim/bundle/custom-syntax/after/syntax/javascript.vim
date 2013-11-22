" http://coderkeen.com/old/articles/identifiers-en.html

" todo
"   ajax builtins
"   highlight word function (mildly)

" highlight function names for prototypes
syn match javaScriptFuncName "\([a-zA-Z0-9_]\+\)\(\s=\sfunction\)\@="
syn match javaScriptFuncName "\(function\s\)\@<=\([a-zA-Z0-9_]\+\)"
hi link javaScriptFuncName Function

" syntax highlighting on numbers
hi! link javaScriptNumber Number

" don't bold braces or the word function
hi! link javaScriptBraces Statement
hi! link javaScriptFunction NONE

" highlight doc components inside comments
syn match javaScriptParamDoc "@[a-z]\+" containedin=javaScriptComment
syn match javaScriptDocType "{[a-zA-Z\.]\+}" containedin=javaScriptComment nextgroup=javaScriptIdent skipwhite
syn match javaScriptIdent "[a-z_]\+" contained
hi link javaScriptDocType CommentSpecial
hi link javaScriptParamDoc CommentSpecial
hi link javaScriptIdent Identifier
