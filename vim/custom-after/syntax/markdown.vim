syn match markdownPlainUrl "https\?:\/\/\S\+\ze\(\s\|$\)"
syn match markdownUrlIntro "https\?:\/\/" conceal contained containedin=markdownUrl,markdownPlainUrl

hi! link markdownCode      Code
hi! link markdownUrlIntro  markdownUrl
hi! link markdownPlainUrl  markdownUrl
