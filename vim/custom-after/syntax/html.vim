" Syntax
"-------

" Custom Data Attributes http://dev.w3.org/html5/spec/elements.html#embedding-custom-non-visible-data
syn match htmlArg "\<\(data(\-[a-z]\+)\+\)=" contained

" Microdata http://dev.w3.org/html5/md/
syn keyword htmlArg contained itemid itemscope itemtype itemprop itemref

" Highlight
"----------

" Don't highlight js - let js syntax do the highlighting
" hi link javaScript Normal
" hi link javaScriptBraces Normal

" De-emphasize brackets themselves
hi! link htmlTag Comment

" De-emphasize closing tags
hi! link htmlEndTag Operator
