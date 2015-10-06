" Custom filetype detection. Loads *before* defaults

au BufRead,BufNewFile *.md set filetype=markdown

au  BufNewFile,BufRead *.html call s:DetectDjangoTemplate()
" check for django template tag in first ten lines
func! s:DetectDjangoTemplate()
  for n in range(10, line('$') - 1)
    if getline(n) =~ '{%\|{{\|{#'
      set filetype=htmldjango
      break
    endif
  endfor
  setfiletype html
endf
