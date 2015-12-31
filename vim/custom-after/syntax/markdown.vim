syn match markdownPlainUrl "https\?:\/\/\S\+\ze\(\s\|$\)"
syn match markdownUrlIntro "https\?:\/\/" conceal contained containedin=markdownUrl,markdownPlainUrl

syn clear markdownCode
syn region markdownCode matchgroup=markdownCodeDelimiter start="`" end="`" keepend concealends contains=markdownLineStart

syn clear markdownH1
syn clear markdownH2

syn region markdownH1 matchgroup=markdownHeaderDelimiter start="^# " end="  " end="$" concealends
syn region markdownH2 matchgroup=markdownHeaderDelimiter start="^## " end="  " end="$" concealends

hi! link markdownH1        BoldUnderlined
hi! link markdownH2        BoldUnderlined
hi! link markdownCode      Code
hi! link markdownUrlIntro  markdownUrl
hi! link markdownPlainUrl  PreProc
