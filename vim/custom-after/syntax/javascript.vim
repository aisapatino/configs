" Note: this is set up on top of the pangloss/vim-javascript plugin

syntax keyword jsThis self _this
hi! link jsThis       Identifier

hi! link jsFunction   Operator
hi! link jsFuncBraces Operator
hi! link jsFuncParens Operator
hi! link jsBraces     Operator

hi! link jsUndefined  Constant
" hi! link jsObjectKey

hi! link jsGlobalObjects Keyword

" mocha/chai test keywords
syn keyword mochaChai     suite describe it before after beforeEach afterEach containedin=jsFuncCall,jsFuncBlock
syn keyword mochaChaiDone done      containedin=jsFuncCall,jsFuncArgs,jsParen
syn keyword mochaWarn     skip only containedin=jsFuncCall
syn keyword chaiAssert    expect    containedin=jsFuncCall

hi! link chaiAssert      Keyword
hi! link mochaChaiDone   Keyword
hi! link mochaChai       Statement
hi! link mochaWarn       WarningMsg

" bolded comment headers (/* comment starting with 2+ capped letters)
syn match javaScriptCommentHeader "^\/\*\s[A-Z]\{2,40}.*\*"
hi! link javaScriptCommentHeader CommentHeader
