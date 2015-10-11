" Note: this is set up on top of the pangloss/vim-javascript plugin

syntax keyword jsThis self _this
hi! link jsThis Boolean

hi! link jsFunction Operator
hi! link jsFuncBraces Operator
hi! link jsFuncParens Operator

" mocha/chai test keywords
syn keyword chaiAssert expect containedin=jsFuncCall
syn keyword mochaChai suite describe it before after beforeEach afterEach containedin=jsFuncCall,jsFuncBlock
syn keyword mochaChaiDone done containedin=jsFuncCall,jsFuncArgs,jsParen
syn keyword mochaWarn skip only containedin=jsFuncCall

hi! link chaiAssert      Include
hi! link mochaChai       Function
hi! link mochaChaiDone   Special
hi! link mochaWarn       WarningMsg

" bolded comment headers (/* comment starting with 2+ capped letters)
syn match javaScriptCommentHeader "^\/\*\s[A-Z]\{2,40}.*\*"
hi! link javaScriptCommentHeader CommentHeader
