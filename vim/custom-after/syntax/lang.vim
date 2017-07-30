" Custom filetype created for translating between English & Spanish. Supports spellcheck

syn region esTitle matchgroup=Folded start="|" end="|" concealends contains=esProperNoun

" Todo prettier option that avoids matching sentence
syn match esSubTitle ".*\ze\n-\{4,50}$" contains=esProperNoun,esNote
syn match esSubTitle "#\s.*$"

" Match sentences to make it easier to detect mid-sentence caps
syn region esSentence start="[¿¡[:upper:]\[]" end="[?!.\[\]	]\]\?" contains=esEnglish,esNote,esProperNoun,esSkip,esTodo

" Skip spell check for capitalized words
syn match esProperNoun "\s\u\w*\ze[ .?!,;\-)"»$]" transparent contained contains=@noSpell

" Skip spell check
syn region esSkip matchgroup=esTags start="<" end=">" concealends contains=@noSpell

" Highlight translation comments/notes
syn region esNote start="\[\*" end="\]" contains=esEnglish
syn match esTodo "\[?\]"

hi link esTitle    Title
hi link esSubTitle Title
hi link esNote     Special
hi link esTags     Folded
hi link esTodo     Error
