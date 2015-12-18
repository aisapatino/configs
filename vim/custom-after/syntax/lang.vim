" Top title is centered
syn match esTitle "\s\{5,37}.*\ze\n\n" contains=esProperNoun

" Todo prettier option that avoids matching sentence
syn match esSubTitle ".*\ze\n-\{4,50}$" contains=esProperNoun,esNote
syn match esSubTitle "#\s.*$"

" Match sentences to make it easier to detect mid-sentence caps
syn region esSentence start="[¿¡[:upper:]\[]" end="[?!.\[\]	]\]\?" transparent contains=esEnglish,esNote,esProperNoun

" Skip spell check for capitalized words
syn match esProperNoun "\u\w*\ze[ .?!,;\-)"»$]" contained contains=@noSpell

" Skip spell check for English words/phrases and hide delimiters
syn region esEnglish matchgroup=esTags start="<en>" end="</en>" concealends contains=@noSpell

" Highlight translation comments/notes
syn region esNote start="\[\*" end="\]" contains=esEnglish

hi link esTitle    Title
hi link esSubTitle Title
hi link esNote     Special
hi link esTags     Folded
