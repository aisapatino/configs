" Modify default html highlighting

" don't highlight all js - let js syntax do the highlighting
hi link javaScript Normal
hi link javaScriptBraces Normal

" don't bold <> themselves
hi! link htmlTag Operator

" de-emphasize closing tags
syn clear htmlEndTag
syn region htmlEndTag start=+</+      end=+>+ contains=htmlTagError
hi link htmlEndTag Operator

" Emphatic comments
syn region htmlCommentHeader start=+<!---+ end=+-->+
hi link htmlCommentHeader CommentHeader

