" Note: this is set up on top of the pangloss/vim-javascript plugin

" Syntax
"--------

syn match jsClassName "\(class\ \)\@<=\S\+" containedin=jsClassDefinition

" highlight function names for prototypes, functions defined in arrays
syn match jsFuncName "\([a-zA-Z0-9_]\+\)\(\s=\sfunction\)\@="
syn match jsFuncName "\(function\s\)\@<=\([a-zA-Z0-9_]\+\)"
syn match jsFuncName "\([a-zA-Z0-9_]\+\)\(:\sfunction\)\@="
syn match jsFuncName "\([a-zA-Z0-9_]\+\)\(\s=\s(.*=>\)\@=" containedin=jsIdentExpIdent,jsAssignmentExpr

syn keyword jsThis      self _this
syn keyword jsModule    exports module
syn keyword mocha       it before after beforeEach afterEach containedin=jsFuncCall,jsFuncBlock
syn keyword mochaSuite  suite describe containedin=jsFuncCall
syn keyword mochaDone   done           containedin=jsFuncCall,jsFuncArgs,jsParen
syn keyword mochaWarn   skip only      containedin=jsFuncCall
syn keyword chaiExpect  expect         containedin=jsFuncCall

" Highlight
"------------

" pre-existing groups
hi! link jsUndefined      Constant
hi! link jsGlobalObjects  Keyword
hi! link jsFunction       Operator
hi! link jsFuncBraces     Operator
hi! link jsClassBraces    Operator
hi! link jsTemplateBraces Special
hi! link jsObjectKey      Number
hi! link jsFunctionKey    Number
hi! link jsThis           Identifier

" added groups
hi! link jsClassName     ClassName
hi! link jsModule        Keyword
hi! link mochaSuite      Function
hi! link mocha           Statement
hi! link mochaDone       Keyword
hi! link mochaWarn       WarningMsg
hi! link chaiExpect      Keyword
