" TODO:
" less strong highlighting for function/endfunction
" highlight function names in definition
" differentiate bn different keywords?

" vimFuncKey - start of func
" vimCommand - endfunction
"
" funcname = vimFunction
hi! link vimFunction ClassName

" comment headers
syn match vimCommentHeader '^"".*'
hi! link vimCommentHeader CommentHeader

