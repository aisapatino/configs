" Syntax overrides

" Highlight built-in functions as keywords, not identifiers
hi! link luaFunc Keyword

" highlight function end as Statement, function name as Function
hi! link luaFunction Statement
syn match luaCustomFunction "\(\<function\>\)\@<=\s\+\S\+\s*(\@=" 
hi link luaCustomFunction Function

syn match luaCommentHeader "---.*"
hi link luaCommentHeader CommentHeader

" Function calls
syn match luaNestedFunc ":\@<=\w\+"
hi link luaNestedFunc Include

" self
syn keyword luaIdent self
hi! link luaIdent Identifier

" Add string concat to operators (doesn't work yet due to ifthen block)
syn keyword luaOperator .. = + -
