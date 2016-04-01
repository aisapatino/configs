" Syntax
"--------

"- Overrides
"------------

" decorator symbol & function as special
syn clear pythonDecorator
syn match pythonDecorator "@" display nextgroup=pythonDecoratorContents skipwhite
syn match pythonDecoratorContents "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained

" docstrings as comments, not strings
syn region pythonDocString start=/"""/ end=/"""/
syn keyword pythonDocKeywords Arguments Returns Args Raises Attributes Setup Asserts containedin=pythonDocString

"- New groups
"-------------

" boolean seems like closest fit for None
syn keyword pythonBoolean False True None

syn keyword pythonSelf self

syn match pythonArgs "*\(*kw\)\?args"
syn match pythonLogging "logger\.\%(debug\|info\|warning\|error\)"
" model and form fields
syn match pythonDjangoField "[a-z0-9_]\+\%(\s=\s[a-zA-Z\.]*\%(Field\|Key\)\)\@="

" distinguish class from func
syn keyword pythonStatement class nextgroup=pythonClass skipwhite
syn match pythonClass "\%(class\s\)\@<=[a-zA-Z]\+" contained

" Highlight
"-----------

" highlight builtins as keywords, not functions
hi! link pythonBuiltin          Keyword

hi link pythonSelf              Type
hi link pythonBoolean           Boolean
hi link pythonDecorator         PreProc
hi link pythonDecoratorContents Define
hi link pythonArgs              Keyword
hi link pythonClass             ClassName
hi link pythonLogging           Debug
hi link pythonDjangoField       Include
hi link pythonDocString         Comment
hi link pythonDocKeywords       Special
