set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisa"

" Notes for terminal
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings up to work well enough in terminal, mainly for diffs
" Mapping of my color pallete

" 1 black
" 2 dark gray
" 3 dark red
" 4 red-orange
" 5 green
" 6 light green
" 7 dark yellow
" 8 yellow
" 9 blue
" 10 soft blue
" 11 dark purple
" 12 light purple
" 13 teal
" 14 cyan
" 15 light gray
" 16 almost white


" Types of text (Python-relevant first)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" old string color, med blue: 4070a0

hi Normal    guifg=#404850   guibg=#f0f0f0  ctermbg=15  ctermfg=black

hi String    guifg=#a0b0c0 ctermfg=black
hi Number    guifg=#40a070 ctermfg=black
hi Float     guifg=#40a070 ctermfg=black


" PythonStatement, PreCondit (from, import). keywords:  class/def etc
" html: tag-names
hi Statement  guifg=#06287e gui=bold
hi Repeat      guifg=#06287e gui=bold
hi Conditional guifg=#06287e gui=bold
hi Operator   guifg=#06287e

hi Comment   guifg=#7fbf58 gui=italic

hi Identifier guifg=#5b3674 gui=italic

" PythonFunction (def & class names), PythonBuiltinFunc (a)
hi Function   guifg=#ff00f8 gui=bold

" Python Decorators, doctestvalue
hi Define      guifg=#1060a0 gui=italic

" Python Standard exceptions, BuiltinObj, pythonExClass
hi Structure  guifg=#1060a0 gui=italic

" PythonCoding, Run, escape %(...)s - constructs, encoding, doctests
hi Special    guifg=#70a0d0 gui=italic

" Html titles
hi Title      guifg=#202020 gui=bold
hi Underlined  guifg=#202020 gui=underline

" color of <TAB>s etc
hi SpecialKey guibg=#f0c8c8
" Include -- from, import
" Exception - except, finally, raise, try, built in Exceptions

" ???
hi PreProc    guifg=#1060a0 gui=NONE

hi Constant  guifg=#a07040

" HTML arguments, Python unused?
hi Type       guifg=#e5a00d gui=italic

" Text states
""""""""""""""""""""""""""""""""""""""""""""""""""""

hi MatchParen guifg=white guibg=#80a090 gui=bold
" PythonSpaceError
hi Error      guifg=red guibg=white gui=bold,underline
hi Todo       guifg=#a0b0c0 guibg=NONE gui=italic,bold,underline
hi Folded    guifg=#a0a0a0 guibg=#e8e8e8 gui=italic

" Diff
highlight DiffAdd cterm=bold ctermfg=124 ctermbg=15
highlight DiffChange cterm=bold ctermfg=cyan ctermbg=15
highlight DiffText cterm=bold ctermfg=gray ctermbg=15
highlight DiffDelete cterm=bold ctermfg=red ctermbg=15
" hi DiffChange guifg=NONE guibg=#e0e0e0 gui=italic,bold
"hi DiffText guifg=NONE guibg=#f0c8c8 gui=italic,bold
"hi DiffAdd guifg=NONE guibg=#c0e0d0 gui=italic,bold
"hi DiffDelete guifg=NONE guibg=#f0e0b0 gui=italic,bold

" Window/screen components
""""""""""""""""""""""""""""""""""""""""""""""""""""

hi NonText   guifg=#c0c0c0 guibg=#e0e0e0 ctermbg=grey  ctermfg=2
hi ColorColumn guibg=#f6f6f6

"Tabpages
hi TabLine guifg=black guibg=#b0b8c0 gui=italic ctermbg=black  ctermfg=grey
hi TabLineFill guifg=#9098a0 ctermbg=black  ctermfg=grey
hi TabLineSel guifg=black guibg=#f0f0f0 gui=italic,bold

" Cursor
hi Cursor    guifg=black   guibg=#b0b4b8
hi lCursor   guifg=black   guibg=white
hi CursorLine guibg=#f6f6f6
hi CursorColumn guibg=#eaeaea

" Gutter
hi LineNr guifg=#ffffff guibg=#c0d0e0 ctermfg=white  ctermbg=32
hi CursorLineNr guifg=#c0d0e0 guibg=#f6f6f6 guifg=#c0d0e0 guibg=#f6f6f6
hi FoldColumn guifg=#ffffff guibg=#c0d0e0

" Status line
hi StatusLine guifg=white guibg=#8090a0 gui=bold ctermbg=grey  ctermfg=black
hi StatusLineNC guifg=#506070 guibg=#a0b0c0 ctermbg=grey ctermfg=black

" Window border
hi VertSplit guifg=#a0b0c0 guibg=#a0b0c0 gui=NONE ctermbg=black  ctermfg=grey

