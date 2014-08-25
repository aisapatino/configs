" todo
"   ajax builtins
"   highlight word function (mildly)

" comment headers
syn match javaScriptCommentHeader "/\*\s\?-.*\*/"
hi! link javaScriptCommentHeader CommentHeader

" highlight function names for prototypes, functions defined in arrays
syn match javaScriptFuncName "\([a-zA-Z0-9_]\+\)\(\s=\sfunction\)\@="
syn match javaScriptFuncName "\(function\s\)\@<=\([a-zA-Z0-9_]\+\)"
syn match javaScriptFuncName "\([a-zA-Z0-9_]\+\)\(:\sfunction\)\@="
hi link javaScriptFuncName Function

" syntax highlighting on numbers
hi! link javaScriptNumber Number

" don't bold braces or the word function
hi! link javaScriptBraces Statement
hi! link javaScriptFunction NONE

" highlight jsdoc components
syn match javaScriptParamDoc "@[a-z]\+" containedin=javaScriptComment nextgroup=javaScriptDocType skipwhite
syn match javaScriptDocType "{.\+}" contained nextgroup=javaScriptIdent skipwhite
syn match javaScriptIdent "[a-z_]\+" contained
hi link javaScriptDocType CommentSpecial
hi link javaScriptParamDoc CommentSpecial
hi link javaScriptIdent CommentSpecial

" highlight node builtins
syn keyword mochaChai it describe expect before beforeEach after afterEach
hi link mochaChai javaScriptStatement

