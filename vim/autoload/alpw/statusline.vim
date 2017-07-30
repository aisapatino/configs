function! s:ExpectReadonly(ft)
  " return true if given filetype is expected to be readonly; else false
  return (a:ft == 'help') || (a:ft == 'netrw') || (a:ft == 'fugitiveblame')
endf

function! alpw#statusline#FileId()
  " return file identifier for status line
  " depending on filetype, may be buffer number, filetype, directory and/or filename
  let l:ft = getbufvar('%', '&filetype')
  let l:result = s:ExpectReadonly(l:ft) ? '[' . l:ft . ']' : bufnr('%')
  let l:result .= ' '
  let l:result .= (l:ft == 'netrw') ? alpw#utils#ShortPath(getbufvar('%', 'netrw_curdir')) : expand('%:t')
  return l:result
endf

function! alpw#statusline#Modified()
  " return modified/nomodifiable indicator for statusline
  if s:ExpectReadonly(getbufvar('%', '&filetype'))
    return ''
  elseif getbufvar('%', '&modified')
    return '[+]'
  elseif getbufvar('%', '&modifiable') == 0
    return '[-]'
  endif
  return ''
endf

function! alpw#statusline#BranchIndent()
  " return indent level and branch name display for statusline
  if s:ExpectReadonly(getbufvar('%', '&filetype'))
    return ''
  endif

  let l:branch = fugitive#statusline()
  let l:branch = substitute(branch, '[Git', '', '')
  let l:branch = substitute(branch, ']', '', '')

  let l:width = &tabstop
  if (&expandtab == 'noexpandtab')
    let l:width .= 't'
  elseif l:width == 2
    let l:width = ''
  endif

  return l:branch . ' ' . l:width
endf

function! alpw#statusline#LintStatus()
  let counts = neomake#statusline#LoclistCounts()
  let result = ''
  if has_key(counts, 'E')
    return %#ErrorSign%{counts['E']}
  endif
  " if has_key(counts, 'W')
  "   let result .= '%#WarningSign#' . counts['W']
  " endif
  " return result
endfunction

function! alpw#statusline#Dir()
  " return shortened path for current buffer
  " skip for netrw since it displays path in file spot
  if getbufvar('%', '&filetype') == 'netrw'
    return ''
  endif
  return alpw#utils#ShortPath(expand('%:h'))
endf
