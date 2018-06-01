setlocal wrap
" Makes fenced languages work even if main_syntax had been set by another file
" Ok to do because I never use markdown inside another filetype
let main_syntax = 'markdown'

let g:markdown_fenced_languages = [
\  'py=python', 'python',
\  'js=javascript', 'javascript',
\  'bash=sh', 'sh'
\]

" Jump between headers
call alpw#main#SetJump('^#')

let b:prev = 0

func! Alpw_MarkdownFold()
  let line = getline(v:lnum)

  " Header always starts a fold
  let header = matchstr(line, '^#\+')
  if (header != '')
    let b:prev = strlen(header)
    return '>' . b:prev
  endif

  " Blank line before a header ends a fold unless the upcoming header
  " should be nested inside the current fold
  if (line == '')
    let header_next = strlen(matchstr(getline(v:lnum + 1), '^#\+'))
    if (header_next > 0)
      if (header_next == b:prev)
        return '<' . b:prev
      elseif (header_next < b:prev)
        let b:prev = header_next - 1
        return header_next
      endif
    endif
  endif

  return b:prev
endf

setlocal foldmethod=expr
setlocal foldexpr=Alpw_MarkdownFold()
