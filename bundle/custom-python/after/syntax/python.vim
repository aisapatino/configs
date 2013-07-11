" pythonStatement (bool, built in funcs) are linked to funcs no ty

syn region PythonDocTest start=/"""/ end=/"""/
hi link PythonDoctest Comment

" modified from vim's syntax file:
syn clear pythonDecorator
syn match pythonDecorator "@" display nextgroup=pythonDecoratorContents skipwhite
hi link pythonDecorator Special
syn match pythonDecoratorContents "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained
hi link pythonDecoratorContents Special

syn keyword pythonDefine class def nextgroup=pythonFunction skipwhite
hi link pythonDefine Define

