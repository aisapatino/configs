" Note: this is set up on top of the pangloss/vim-javascript plugin
" See ~/.vim/plugged/vim-javascript/syntax/javascript.vim

" Syntax
"--------

syn match jsClassName "\(class\ \)\@<=\S\+" containedin=jsClassDefinition
syn match jsFuncName "\([a-zA-Z0-9_]\+\)\(\s=\s\(async\ \)\?(.*=>\)\@=" containedin=jsVariableDef,jsIdentExpIdent,jsAssignmentExpr,jsBlock,jsFuncBlock,jsObjectProp
syn match jsFuncName "\([a-zA-Z0-9_]\+\)\(\s=\s\(async\ \)\?function\)\@=" containedin=jsObjectProp,jsVariableDef
syn match jsFuncName "\([a-zA-Z0-9_]\+\)\(:\s\function\)\@="

syn match testDesc +'\([_a-zA-Z]\+\ \)\?should.\+'+ containedin=jsParen
syn match routerDef "[a-zA-Z]*[rR]outer.\(get\|post\|delete\|options\|put\|use\)" containedin=jsFuncBlock

syn region jsGraphqlComment start=+"""+ end=+"""+ containedin=jsTemplateString

syn keyword jsProto     prototype        containedin=jsObjectProp
syn keyword jsThis      self _this
syn keyword jsModule    exports module   containedin=jsObjectProp
syn keyword mocha       it before after beforeEach afterEach containedin=jsFuncCall,jsFuncBlock
syn keyword mochaSuite  suite describe   containedin=jsFuncCall
syn keyword mochaDone   done             containedin=jsFuncCall,jsFuncArgs,jsParen
syn keyword mochaWarn   skip only        containedin=jsFuncCall,jsObjectProp
syn keyword chaiExpect  expect           containedin=jsFuncCall
syn keyword jsReactFunc setState render  containedin=jsFuncCall

" Highlight
"------------

" pre-existing groups
hi! link jsFuncCall       Normal
hi! link jsUndefined      Constant
hi! link jsGlobalObjects  Keyword
hi! link jsFunction       Operator
hi! link jsFuncBraces     Operator
hi! link jsClassBraces    Operator
hi! link jsTemplateBraces Special
hi! link jsObjectKey      Number
hi! link jsFunctionKey    Number
hi! link jsThis           Identifier
hi! link jsProto          Special
hi! link jsClassProperty  Function

" added groups
hi! link jsClassName     ClassName
hi! link jsModule        Keyword
hi! link mochaSuite      Function
hi! link mocha           Statement
hi! link mochaDone       Keyword
hi! link mochaWarn       WarningMsg
hi! link chaiExpect      Keyword
hi! link testDesc        Underlined
hi! link routerDef       Function
hi! link jsReactFunc     SpecialFunc
hi! link jsGraphqlComment Comment
