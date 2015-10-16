let s:main_header = '^"-\{78}'
let s:sub_header = '^"\s\?-\{3,45}$'
let s:comment = '^"'

" Fold using headers. Only supports two levels.
func! VimFoldExpr()
  let current_line = getline(v:lnum)
  let prev_line = getline(v:lnum - 1)
  let next_line = getline(v:lnum + 1)

  " First line and main headers -> level 0
  if v:lnum == 1 || (match(current_line, s:main_header) == 0)
    return 0

  " Main header contents starting with line after -> level 1
  elseif (match(prev_line, s:main_header) == 0) && (match(next_line, s:main_header) == -1)
    return 1

  " Subheader contents starting with line -> level 2
  elseif match(current_line, s:sub_header) == 0
    return 2

  " Subheader text -> level 1
  elseif match(next_line, s:sub_header) == 0
    return 1

  else
    return '='
  endif
endfunction

set foldexpr=VimFoldExpr()
set foldmethod=expr
