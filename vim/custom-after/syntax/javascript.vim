" Note: this is set up on top of the pangloss/vim-javascript plugin

" Syntax
"--------

syn clear jsExportContainer

syn match jsExports "^exports\zs\S\+"

syn keyword jsThis self _this

syn keyword mochaChai     suite describe it before after beforeEach afterEach containedin=jsFuncCall,jsFuncBlock
syn keyword mochaChaiDone done      containedin=jsFuncCall,jsFuncArgs,jsParen
syn keyword mochaWarn     skip only containedin=jsFuncCall
syn keyword chaiAssert    expect    containedin=jsFuncCall

" Highlight
"-----------

hi! link jsExports       ClassName
hi! link jsThis          Identifier

hi! link jsFunction      Operator
hi! link jsFuncBraces    Operator
hi! link jsFuncParens    Operator
hi! link jsBraces        Operator

hi! link jsUndefined     Constant
hi! link jsGlobalObjects Keyword

hi! link chaiAssert      Keyword
hi! link mochaChaiDone   Keyword
hi! link mochaChai       Statement
hi! link mochaWarn       WarningMsg
