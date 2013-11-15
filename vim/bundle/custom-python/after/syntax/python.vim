" not python but i'm being lazy
hi! link qfLineNr NONE

" docstrings as comments, not strings
syn region PythonDocTest start=/"""/ end=/"""/
hi link PythonDoctest Comment

" decorator symbol & function as special
syn clear pythonDecorator
syn match pythonDecorator "@" display nextgroup=pythonDecoratorContents skipwhite
hi link pythonDecorator Special
syn match pythonDecoratorContents "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained
hi link pythonDecoratorContents Special

" func names as function, class/def as define
syn keyword pythonStatement def nextgroup=pythonFunction skipwhite
syn keyword pythonStatement class nextgroup=pythonClass skipwhite
syn match pythonClass "[a-zA-Z]\+" contained
hi link pythonClass ClassName

" fix syntax error in built in file
syn keyword pythonStatement False None

" highlight self & super
syn keyword pythonSelf self super

hi link pythonSelf PreProc


" REF
"
" Statement 		False None True as assert break lambda pass print return
" 					with yield del
" 					class & def by default
"
" Operator 			and in is not or
" Exception 		except finally raise try
" Exceptions		Specific error types (AssertionError, AttributeError, etc)
"     --> Structure
" Include  			from import
