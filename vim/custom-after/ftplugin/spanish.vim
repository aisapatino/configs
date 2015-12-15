setl textwidth=80
setl spell
setl spelllang=es_mx
setl tabstop=4

func! WordReference()
  let l:word = expand('<cword>')
  let l:url = 'http://www.wordreference.com/es/en/translation.asp?spen=' . l:word
  exec 'silent !open "' . l:url . '"'
endf
nnoremap gw :call WordReference()<CR>
