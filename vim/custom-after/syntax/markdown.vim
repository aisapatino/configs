" Syntax
"--------

syn match markdownPlainUrl "https\?:\/\/\S\+\ze\(\s\|$\)"
syn match markdownUrlIntro "https\?:\/\/" conceal contained containedin=markdownUrl,markdownPlainUrl

syn match markdownFilepath "\~[/a-zA-Z0-9_\-]*"

syn clear markdownCode
syn region markdownCode matchgroup=markdownCodeDelimiter start="\(^\|\s\)\zs`\ze[^`]" end="`" keepend concealends oneline contains=markdownLineStart

" Don't assume 4-space indent means code block
syn clear markdownCodeBlock

" Mandatory leading space that is not included in region
syn clear markdownH1
syn clear markdownH2
syn clear markdownH3
syn region markdownH1 matchgroup=markdownHeaderDelimiter start="^# " end="  " end="$" concealends
syn region markdownH2 matchgroup=markdownHeaderDelimiter start="^## " end="  " end="$" concealends
syn region markdownH3 matchgroup=markdownHeaderDelimiter start="^### " end="  " end="$" concealends

" Highlight
"-----------

hi! link markdownH1        BoldUnderlined
hi! link markdownH2        BoldUnderlined
hi! link markdownCode      Code
hi! link markdownUrlIntro  markdownUrl
hi! link markdownPlainUrl  PreProc
hi! link markdownFilepath  Special
