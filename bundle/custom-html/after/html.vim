" Modify default html highlighting

" don't highlight all js
hi link javaScript Normal
hi link javaScriptBraces Normal
" Add simple django recognition
"

syn match djangoTag "{%.*%}"
hi link djangoTag Special

syn match djangoVarBlock "{{.*}}"
hi link djangoVarBlock Special

