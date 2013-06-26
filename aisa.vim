" TO DO
"  quicklist

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisa"

" Types of text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Normal      guifg=#404850 guibg=#f0f0f0  ctermbg=15  ctermfg=black

hi String      guifg=#a0b0c0 ctermfg=black
hi Number      guifg=#40a070 ctermfg=black
hi Float       guifg=#40a070 ctermfg=black
hi Operator    guifg=#06287e

hi Statement   guifg=#06287e gui=bold
hi Repeat      guifg=#06287e gui=bold
hi Conditional guifg=#06287e gui=bold
hi Comment     guifg=#7fbf58 gui=italic
hi Identifier  guifg=#5b3674 gui=italic
hi Function    guifg=#ff00f8 gui=bold
hi Define      guifg=#1060a0 gui=italic
hi Structure   guifg=#1060a0 gui=italic
hi Special     guifg=#70a0d0 gui=italic
hi Title       guifg=#202020 gui=bold
hi Underlined  guifg=#202020 gui=underline
hi PreProc     guifg=#1060a0 gui=bold
hi Constant    guifg=#a07040
hi Type        guifg=#6c71c4 gui=NONE

" Text states
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi MatchParen  guifg=#166e42 guibg=NONE    gui=bold
hi Error       guifg=red     guibg=white   gui=bold,underline
hi Todo        guifg=NONE    guibg=NONE    gui=italic,bold
hi Folded      guifg=#a0a0a0 guibg=#e8e8e8 gui=italic
hi TrailingSpaces            guibg=#f0c8c8

hi DiffChange  guifg=NONE    guibg=NONE
hi DiffText    guifg=#166e42 guibg=#e3faef gui=NONE
hi DiffAdd     guifg=#166e42 guibg=#e3faef gui=NONE
hi DiffDelete  guifg=#fae6e6 guibg=#fae6e6 gui=italic

" Window/screen components
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi NonText     guifg=#c0c0c0 guibg=#e0e0e0 ctermbg=grey ctermfg=2
hi ColorColumn               guibg=#f6f6f6
hi Directory   guifg=#1060a0

"Tabpages
hi TabLine     guifg=black   guibg=#b0b8c0 gui=italic ctermbg=black ctermfg=grey
hi TabLineFill guifg=#9098a0 ctermbg=black ctermfg=grey
hi TabLineSel  guifg=black   guibg=#f0f0f0 gui=italic,bold

" Cursor
hi Cursor       guifg=black   guibg=#b0b4b8
hi lCursor      guifg=black   guibg=white
hi CursorLine                 guibg=#f6f6f6
hi CursorColumn               guibg=#eaeaea

" Gutter
hi LineNr        guifg=#ffffff guibg=#c0d0e0 ctermfg=white ctermbg=32
hi CursorLineNr  guifg=#c0d0e0 guibg=#f6f6f6 guifg=#c0d0e0 guibg=#f6f6f6
hi FoldColumn    guifg=#ffffff guibg=#c0d0e0

" Status line
hi StatusLine    guifg=white   guibg=#8090a0 gui=bold ctermbg=grey ctermfg=black
hi StatusLineNC  guifg=#506070 guibg=#a0b0c0 ctermbg=grey ctermfg=black

" Split lines
hi VertSplit     guifg=#a0b0c0 guibg=#a0b0c0 gui=NONE ctermbg=black  ctermfg=grey

" Buffer list
hi MBENormal               guifg=#a0b0c0            gui=italic
hi MBEChanged              guifg=#ff0000
hi MBEVisibleNormal        guifg=#06287e            gui=NONE
hi MBEVisibleChanged       guifg=#ff0000 guibg=NONE gui=NONE
hi MBEVisibleActiveNormal  guifg=#70a0d0 guibg=NONE gui=bold
hi MBEVisibleActiveChanged guifg=#ff0000 guibg=NONE gui=bold

