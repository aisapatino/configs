"" Override existing group highlighting
"-------------------------------------------------------------------------------

" highlight builtins as keywords, not functions
hi! link pythonBuiltin Keyword

" decorator symbol & function as special
syn clear pythonDecorator
syn match pythonDecorator "@" display nextgroup=pythonDecoratorContents skipwhite
hi link pythonDecorator PreProc
syn match pythonDecoratorContents "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained
hi link pythonDecoratorContents Define

"" Keywords
"-------------------------------------------------------------------------------

" None isn't a boolean but this seems like best fit anyway
syn keyword pythonBoolean False True None
hi link pythonBoolean Boolean

" highlight self
syn keyword pythonSelf self
hi link pythonSelf Type

"" Matches
"-------------------------------------------------------------------------------

" *args **kwargs
syn match pythonArgs "*\(*kw\)\?args"
hi link pythonArgs Keyword

" in declaration, class and function names get own highlighting
syn keyword pythonStatement def nextgroup=pythonFunction skipwhite
syn keyword pythonStatement class nextgroup=pythonClass skipwhite
syn match pythonClass "[a-zA-Z]\+" contained
hi link pythonClass ClassName

" logging
syn match pythonLogging "logger\.\%(debug\|info\|warning\|error\)"
hi link pythonLogging Debug

" comment headers
syn match CommentHeader "#\s[A-Z][A-Z\ 0-9&]\{2,50}.*"

" highlight model and form fields
syn match pythonDjangoField "[a-z_]\+\%(\s=\s\%(models\|forms\).*Field\)\@="
hi link pythonDjangoField Include

" docstrings as comments, not strings
syn region pythonDocTest start=/"""/ end=/"""/
hi link pythonDocTest Comment
syn keyword pythonDocKeywords Arguments Returns Args Raises Attributes Setup Asserts containedin=pythonDocTest
hi link pythonDocKeywords CommentSpecial
