" Custom overrides for snippet highlighting

syn clear snipSnippetHeaderKeyword snipSnippetFooterKeyword
syn match snipSnippetHeaderKeyword "^snippet" contained conceal nextgroup=snipSnippetTrigger skipwhite
syn match snipSnippetFooterKeyword "^endsnippet" conceal cchar=– contained
hi! link snipSnippetHeaderKeyword Special
hi! link snipSnippetFooterKeyword Special
hi! link snipSnippetTrigger       Function
hi! link snipSnippetDocString     Operator
hi! link snipTabStop              Identifier
hi! link snipMirror               Identifier
