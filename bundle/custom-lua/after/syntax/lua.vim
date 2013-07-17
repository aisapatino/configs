" Syntax overrides

hi! link luaFunction Define
syn match luaCustomFunction "\(\<function\>\)\@<=\s\+\S\+\s*(\@=" 
hi link luaCustomFunction Function

syn match luaCommentHeader "---.*"
hi link luaCommentHeader CommentHeader

