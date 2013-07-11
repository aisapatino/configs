" Syntax overrides

syn match LuaDefine "function|end"
hi link LuaDefine Define

hi! link luaFunction NONE
syn match luaCustomFunction "\(\<function\>\)\@<=\s\+\S\+\s*(\@=" 
hi link luaCustomFunction Function

