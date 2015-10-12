" Custom filetype detection. Loads before defaults.

au BufRead,BufNewFile *.md set filetype=markdown

" Better detection for django templates. Checks for tag in first ten lines.
au  BufNewFile,BufRead *.html call s:DetectDjangoTemplate()
func! s:DetectDjangoTemplate()
  for n in range(10, line('$') - 1)
    if getline(n) =~ '{%\|{{\|{#'
      set filetype=htmldjango
      break
    endif
  endfor
  setfiletype html
endf
