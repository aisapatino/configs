" " TODO
" make builtin funcs italic, constants (True False None) reg


" constants
syn match pythonConstant "[A-Z_]\{2,30}"
hi link pythonConstant Constant

" docstrings as comments, not strings
syn region pythonDocTest start=/"""/ end=/"""/
hi link pythonDocTest Comment
syn keyword pythonDocKeywords Arguments Returns Args Raises Attributes Setup Asserts containedin=pythonDocTest
hi link pythonDocKeywords CommentSpecial

" decorator symbol & function as special
syn clear pythonDecorator
syn match pythonDecorator "@" display nextgroup=pythonDecoratorContents skipwhite
hi link pythonDecorator PreProc
syn match pythonDecoratorContents "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained
hi link pythonDecoratorContents Define

" in declaration, class and func names get own highlighting
syn keyword pythonStatement def nextgroup=pythonFunction skipwhite
syn keyword pythonStatement class nextgroup=pythonClass skipwhite
syn match pythonClass "[a-zA-Z]\+" contained
hi link pythonClass ClassName

" highlight builtins as keywords, not functions
hi! link pythonBuiltin Keyword

" referencing a class
" syn match pythonClassRef "\<\%(\u[a-z]\+\)\{2,4}\>"
" hi link pythonClassRef Identifier

" highlight self & super
syn keyword pythonSelf self super
hi link pythonSelf Identifier

" highlight logging
syn match pythonLogging "logger\.\%(debug|info\|warning\|error\)"
hi link pythonLogging Debug

