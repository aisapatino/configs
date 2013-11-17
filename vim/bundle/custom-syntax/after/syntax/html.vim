" Modify default html highlighting

" don't highlight all js
hi link javaScript Normal
hi link javaScriptBraces Normal

syn clear htmlEndTag
syn region htmlEndTag start=+</+      end=+>+ contains=htmlTagError
" need to put this in htmldjango, or make a file there that links to this
