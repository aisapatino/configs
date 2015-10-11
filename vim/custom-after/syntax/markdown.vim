" conceal backticks except for cursor line
setlocal conceallevel=2
let &l:concealcursor = ''

" copy of built-in region definition with `concealends` added
syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" keepend concealends contains=markdownLineStart
" TODO italicize language after md block: ```javascript

" hidelight code blocks
hi! link markdownCode Code
hi! link markdownCodeBlock Code
