setlocal wrap

" I never use markdown inside another ft. This makes fenced languages work
" even if main_syntax had been set by another file
let main_syntax = 'markdown'

let g:markdown_fenced_languages = [
  \ 'py=python', 'python',
  \ 'js=javascript', 'javascript',
  \ 'bash=sh', 'sh'
\]

func! MarkdownFold()
  let l:level = (v:lnum == 1) ? '0' : '='
  let l:match = matchstr(getline(v:lnum), '^#\+')
  if (l:match != '')
    let l:level = '>' . string(strlen(l:match))
  endif
  return l:level
endf

setlocal foldmethod=expr
setlocal foldexpr=MarkdownFold()
