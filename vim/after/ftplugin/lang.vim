if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setl wrap
setl tabstop=4

let b:alpw_lang = matchlist(expand('%:t'), '\.\(\w\w\)\.txt$')[1]

if b:alpw_lang == 'es'
  setl spell
  setl spelllang=es_mx
endif

func! WordReference()
  let l:word = expand('<cword>')
  let l:url = 'http://www.wordreference.com/es/en/translation.asp?spen=' . l:word
  exec 'silent !open "' . l:url . '"'
endf
nnoremap gw :call WordReference()<CR>

if !exists('*Alpw_OpenPair')
  func! Alpw_OpenPair()
    let l:path = expand('%')
    echom b:alpw_lang
    if b:alpw_lang == 'es'
      let l:path = substitute(l:path, '\.es\.', '\.en\.', '')
    elseif b:alpw_lang == 'en'
      let l:path = substitute(l:path, '\.en\.', '\.es\.', '')
    else
      echom "Unknown language"
    endif
    set scrollbind
    exec 'vnew ' . l:path
    set scrollbind
  endf
endif
com! Pair call Alpw_OpenPair()
