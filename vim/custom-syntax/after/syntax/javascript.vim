"" Override existing highlighting
"-------------------------------------------------------------------------------

" syntax highlighting on numbers
hi! link javaScriptNumber Number

" don't bold braces or the word function
hi! link javaScriptBraces Statement
hi! link javaScriptFunction NONE

"" Keywords
"-------------------------------------------------------------------------------

" override highlighting on this, add common alternatives
syn keyword jsThis this _this self
hi link jsThis Type

" highlight mocha/chai test keywords
syn keyword mochaChaiHeader suite describe
hi! link mochaChaiHeader ClassName
syn keyword chaiAssert expect
hi link chaiAssert Include
syn keyword mochaChai it before after beforeEach afterEach test suiteSetup suiteTeardown setup teardown 
hi link mochaChai Function
syn keyword mochaChai2 xit xdescribe done skip
hi link mochaChai2 javaScriptSpecial

"-------------------------------------------------------------------------------
"" Matches
"-------------------------------------------------------------------------------

" highlight function names for prototypes, functions defined in arrays
syn match javaScriptFuncName "\([a-zA-Z0-9_]\+\)\(\s=\sfunction\)\@="
syn match javaScriptFuncName "\(function\s\)\@<=\([a-zA-Z0-9_]\+\)"
syn match javaScriptFuncName "\([a-zA-Z0-9_]\+\)\(:\sfunction\)\@="
hi link javaScriptFuncName Function

" highlight jsdoc components
syn match javaScriptParamDoc "@[a-z]\+" containedin=javaScriptComment nextgroup=javaScriptDocType skipwhite
syn match javaScriptDocType "{.\+}" contained nextgroup=javaScriptIdent skipwhite
syn match javaScriptIdent "[a-z\.\[\]A-Z]\+" contained
hi link javaScriptDocType CommentSpecial
hi link javaScriptParamDoc CommentSpecial
hi link javaScriptIdent CommentSpecial

" highlight mocha/chai test keywords
syn keyword mochaChaiHeader suite describe
hi link mochaChaiHeader Function
syn keyword chaiAssert expect
hi link chaiAssert Include
syn keyword mochaChai it before after beforeEach afterEach test suiteSetup suiteTeardown setup teardown 
hi link mochaChai Function
syn keyword mochaChai2 xit xdescribe done skip
hi link mochaChai2 javaScriptSpecial

" bolded comment headers (/* comment starting with 2+ capped letters)
syn match javaScriptCommentHeader "^\/\*\s[A-Z]\{2,40}.*\*"
hi! link javaScriptCommentHeader CommentHeader

