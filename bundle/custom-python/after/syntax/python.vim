syn region PythonDocTest start=/"""/ end=/"""/
hi link PythonDoctest Comment
" copied and modified from vim's syntax file:
syn match pythonDecorator	"@" display nextgroup=pythonDecorator skipwhite
hi link pythonDecorator Define
" for is bold, in is not
" pythonStatement (bool, built in funcs) are linked to funcs no ty
" 
