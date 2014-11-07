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

" override highlighting on this
syn keyword jsThis this _this self
hi link jsThis Type

" highlight jsdoc components
syn match javaScriptParamDoc "@[a-z]\+" containedin=javaScriptComment nextgroup=javaScriptDocType skipwhite
syn match javaScriptDocType "{.\+}" contained nextgroup=javaScriptIdent skipwhite
syn match javaScriptIdent "[a-zA-Z]\+" contained
hi link javaScriptDocType CommentSpecial
hi link javaScriptParamDoc CommentSpecial
hi link javaScriptIdent CommentSpecial

" highlight mocha/chai test keywords
syn keyword mochaChaiHeader suite describe
hi link mochaChaiHeader Function
syn keyword chaiAssert expect
hi link chaiAssert Include
"syn keyword mochaChai it test before setup beforeEach after teardown afterEach
"hi link mochaChai javaScriptStatement
syn keyword mochaChai2 xit xdescribe done skip
hi link mochaChai2 javaScriptSpecial

