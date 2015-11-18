" Custom mapping for navigating help files

if exists('b:did_ftplugin_2')
  finish
endif
let b:did_ftplugin_2 = 1

if !exists('*Alpw_Jump')
  echom 'Alpw_Jump not found; cannot set mappings'
  finish
endif

" Move between headers
let b:header = '^\(===\|---\).*\(===\|---\)$'
" let b:something = '^[-A-Z .][-A-Z0-9 .()]*[ \t]\+\*'
nnoremap <buffer> <Leader>h :call Alpw_Jump(b:header, 'e')<CR>j
nnoremap <buffer> <Leader>H :call Alpw_Jump(b:header, 'be')<CR>j
