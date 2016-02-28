let b:prev = 0

func! Alpw_vim_fold()
  let line = getline(v:lnum)

  " Header always starts a fold
  let header = matchstr(line, '^"-\?\s\u')
  if (header != '')
    let b:prev = strlen(header) - 2
    return '>' . b:prev
  endif

  " Blank line before a header ends a fold unless the upcoming header
  " should be nested inside the current fold
  if (line == '')
    let header_next = strlen(matchstr(getline(v:lnum + 1), '^"-\?\s\u')) - 2
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

endfunc

setlocal foldmethod=expr
setlocal foldexpr=Alpw_vim_fold()
setlocal foldenable
