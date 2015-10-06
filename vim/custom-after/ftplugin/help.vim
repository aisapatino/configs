" Custom mapping for navigating help files

" b:did_ftplugin is used to tell if builtin ftplugin has run
if exists('b:did_ftplugin_2')
  finish
endif
let b:did_ftplugin_2 = 1

if !exists('*Alpw_Jump')
  echom 'Alpw_Jump not found; cannot set mappings'
  finish
endif
" go to header
let b:header = '=====\n\d\+\.'
nmap <silent> <buffer> <Leader>h ;call Alpw_Jump(b:header, 'e')<CR>
nmap <silent> <buffer> <Leader>H ;call Alpw_Jump(b:header, 'be')<CR>
