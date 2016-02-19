" Note: this is set up on top of the pangloss/vim-javascript plugin

" Syntax
"--------

syn match jsClassName "\(class\ \)\@<=\S\+"
syn match jsClassMethod "\zs\w\+\ze(.*)\s\?{$" containedin=jsBlock

" Identify properties on the exports object
syn clear jsExportContainer
syn keyword jsModule exports module
syn match jsExports "\(exports\.\)\@<=\S\+"

" Add common 'this' aliases
syn keyword jsThis self _this

syn keyword mocha         it before after beforeEach afterEach containedin=jsFuncCall,jsFuncBlock
syn keyword mochaSuite    suite describe containedin=jsFuncCall
syn keyword mochaDone     done      containedin=jsFuncCall,jsFuncArgs,jsParen
syn keyword mochaWarn     skip only containedin=jsFuncCall
syn keyword chaiExpect    expect    containedin=jsFuncCall

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

hi! link mochaSuite      Function
hi! link mocha           Statement
hi! link mochaDone       Keyword
hi! link mochaWarn       WarningMsg
hi! link chaiExpect      Keyword

hi link jsClassName      ClassName
hi link jsClassMethod    Function
hi link jsModule         Keyword
hi! link jsObjectKey     Number
