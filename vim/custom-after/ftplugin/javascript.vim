" Jump between classes, functions, tests
" Don't know why the \| need escaping but they do
nnoremap ]] :call Alpw_Jump('^\s*\(before\\|after\\|it(\\|describe\\|class\\|function\)', 'W')<CR>
nnoremap [[ :call Alpw_Jump('^\s*\(before\\|after\\|it(\\|describe\\|class\\|function\)', 'bW')<CR>
