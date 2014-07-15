" Syntax overrides

" highlight function end as Statement, function name as Function
hi! link luaFunction Statement
syn match luaCustomFunction "\(\<function\>\)\@<=\s\+\S\+\s*(\@=" 
hi link luaCustomFunction Function

syn match luaCommentHeader "---.*"
hi link luaCommentHeader CommentHeader

syn match luaNestedFunc ":\@<=\w\+"
hi link luaNestedFunc Identifier

