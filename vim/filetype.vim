" Custom filetype detection. Loads before defaults.

au BufRead,BufNewFile *.es.txt set filetype=lang
au BufRead,BufNewFile *.en.txt set filetype=lang
au BufRead,BufNewFile *.md set filetype=markdown

" Better detection for django templates. Checks for tag in first ten lines.
au  BufNewFile,BufRead *.html call s:DetectDjangoTemplate()
func! s:DetectDjangoTemplate()
  for n in range(1, 10)
    if getline(n) =~ '{%\|{{\|{#'
      set filetype=htmldjango
      break
    endif
  endfor
  setfiletype html
endf
