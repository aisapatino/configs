function! alpw#utils#ShortPath(p)
  let l:path = substitute(a:p, $HOME, '~', '')
  let l:path = substitute(l:path, 'Projects', 'P', '')
  let l:path = substitute(l:path, $VIMRUNTIME, 'VIMRUNTIME', '')
  return l:path
endfunction

function! alpw#utils#CWD()
  return alpw#utils#ShortPath(getcwd())
endf

