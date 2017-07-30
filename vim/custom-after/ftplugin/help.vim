" Custom mapping for navigating help files

if exists('b:did_ftplugin_2')
  finish
endif
let b:did_ftplugin_2 = 1

if !exists('*alpw#main#Jump')
  echom 'alpw#main#Jump not found; cannot set mappings'
  finish
endif

" Move between headers
let b:header = '^\(===\|---\).*\(===\|---\)$'
nnoremap <buffer> [[ :call alpw#main#Jump(b:header, 'e')<CR>j
nnoremap <buffer> ]] :call alpw#main#Jump(b:header, 'be')<CR>j
