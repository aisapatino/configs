" Syntax
"-------

syn keyword luaLocal local
syn keyword luaSelf self

syn match luaCustomFunction "\(\<function\>\)\@<=\s\+\S\+\s*(\@=" 
syn match luaCustomFunction "\([a-zA-Z0-9_]\+\)\(\s=\sfunction\)\@="
syn match luaCommentHeader "---.*"
syn match luaNestedFunc ":\@<=\w\+"

" Highlight
"----------

" built-in functions as keywords, not identifiers
hi! link luaFunc Keyword
" highlight function end as Statement, function name as Function
hi! link luaFunction Statement
hi! link luaCustomFunction Function
hi! link luaCommentHeader CommentHeader
hi! link luaNestedFunc Include
hi! link luaLocal Type
hi! link luaSelf Identifier
