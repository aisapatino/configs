function! alpw#main#GetFoldText()
  " display folds using text of next line + fold line count
  let l:num_lines = v:foldend - v:foldstart + 1
  let l:line = getline(v:foldstart)
  let l:pad_right = 75 - strlen(l:line)
  if l:pad_right % 2
    let l:line .= ' '
  endif
  let l:line .= repeat(' ⋅', l:pad_right/2)
  return l:line . printf('%4d', l:num_lines)
endfunction

function! alpw#main#Tabline()
  " tab numbers/titles on left, cwd on right
  let l:tabline = ''
  if tabpagenr('$') > 1
    for i in range(1, tabpagenr('$'))
      let l:tabline .= i == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
      let l:tabline .= ' ' . i . ' '
      if exists('g:tabtitle_' . i)
        let l:tabline .= ' ' . eval('g:tabtitle_' . i)
      endif
      let l:tabline .= ' '
    endfor
    let l:tabline .= '%#TabLineFill#'
  endif
  return l:tabline . '%=%#StatusLineNC#cwd: %*%{alpw#utils#CWD()} '
endfunction

function! alpw#main#Jump(pattern, flags) range
  " base jump function based on Python_jump. can be used for ft-specific jumps
  let l:count = v:count1        " if triggered with number in front
  let l:save = @/               " save last search pattern for restoring later
  mark '                        " mark starting spot so you can go back
  while l:count > 0
    exe search(a:pattern, a:flags)
    let l:count -= 1
  endw
  call histdel('/', -1)         " remove this from search history
  let @/ = l:save               " restore last search pattern
endfunction

function! alpw#main#SetJump(pattern)
  " set basic jump mappings - useful if nothing language-specific is defined
  " maps [[ ]] to go to non-whitespace at col 0
  let b:jump_pattern = a:pattern
  nnoremap <Leader>k :call alpw#commands#Jump(b:jump_pattern, 'bW')<CR>
  nnoremap <Leader>j :call alpw#commands#Jump(b:jump_pattern, 'W')<CR>
endfunction

"- Plugins
"---------

function! alpw#main#CtrlPStatus(focus, byfname, regex, prev, item, next, marked)
  " sets statusline in ctrlp window - see help for g:ctrlp_status_func
  let statustext = ' ' . a:item . '        ' . a:byfname
  let statustext .= '     ' . substitute(a:marked, '\(<\|>\|-\)', '', 'g')
  if a:regex
    let statustext .= '     (regex)'
  endif
  return statustext . '%=%{alpw#utils#CWD()}'
endfunction

function! alpw#main#CtrlPProgress(str)
  return a:str . ' files scanned...'
endfunction
