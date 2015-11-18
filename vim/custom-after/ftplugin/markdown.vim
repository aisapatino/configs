setlocal wrap
let g:markdown_fenced_languages = ['python', 'javascript'] " 'py=python', 'js=javascript']

func! MarkdownFold()
  let l:default = (v:lnum == 1) ? '0' : '='
  let l:match = matchstr(getline(v:lnum), '^#\+')
  let l:res = l:default
  if (l:match != '')
    let l:res = '>' . string(strlen(l:match))
  endif
  return l:res
endf

setlocal foldmethod=expr
setlocal foldexpr=MarkdownFold()
