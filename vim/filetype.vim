" Custom filetype detection. Loads before defaults.

augroup alpwFiletypes
  autocmd!
  autocmd BufRead,BufNewFile *.es.txt set filetype=lang
  autocmd BufRead,BufNewFile *.en.txt set filetype=lang
  autocmd BufRead,BufNewFile *.md set filetype=markdown

  autocmd BufNewFile,BufRead *.html call s:DetectDjangoTemplate()
augroup END

" Better detection for django templates. Checks for tag in first ten lines.
func! s:DetectDjangoTemplate()
  for n in range(1, 10)
    if getline(n) =~ '{%\|{{\|{#'
      set filetype=htmldjango
      break
    endif
  endfor
  setfiletype html
endf
