" Things I don't use but don't want to have to re-figure out

"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------
" Plugin 'lambdalisue/vim-gista'
" Plugin 'wavded/vim-stylus'
" Plugin 'mxw/vim-jsx'      " sets ft=javascript
" Plugin 'jsx/jsx.vim.git'  " sets ft jsx (no syntastic, but no jscs errors)
"
" let g:gista#github_user='aisapatino'
" let g:gista#close_list_after_open = 1          " hide list after opening one
" let g:gista#update_on_write = 1                " update with :w
" let g:gista#post_private = 1
" com! Gistl :Gista --list

"------------------------------------------------------------------------------
" Functions
"------------------------------------------------------------------------------

" Convert file to unix
com! DosToUnix execute "update | e ++ff=dos | setlocal ff=unix | w"

" Fix django template style
com! DjangoTemplateStyle :%s/{{\(\S\)/{{\ \1/g|:%s/\(\S\)}}/\1\ }}/g

func! HtmlToJade()
  :%s/<\/\w\+>//gc
  :%s/<div\s//gc
  :%s/class="/\./gc
  :%s/id="/#/gc
  :%s/->/\./gc
  :%s/<//gc
  :%s/>$//gc
  :%s/>/\ /gc
  :%s/a\s/a(/gc
  :%s/\n\n/\r/gc
endf

com! HtmlToJade exec HtmlToJade()

com! ToLowerCase :%s/\(\w\)\(\u\)/\1_\U\2/gc

com! RemoveAnsiCodes :%s/\e.\{-}m//gc

" TODO parens with non-greedy matching
com! RemoveOperatorSpaces :%s/\ \(=\|+\|-\|*\|%\/\/\)\ /\1/gc

command! SingleQuotes :%s/\([^"]\)"\([^"]\)/\1'\2/gc
