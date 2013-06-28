" TO DO
"   replace violet and brown
"   search colors?

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisa"

" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #404850  #506070  #f6f6f6
" normal   sline    colorcol, cursorline
" #a0b0c0  #06287e  #1060a0
" *        *        *
" #40a070  #7fbf58  #e3faef
" numbers  comments diffs
" #ff0000  #ff00f8  #5b3674  #fae6e6  #6c71c4
" errors   func/class        diffs
" #a07040
" constant

" Types of text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Normal      guifg=#404850 guibg=#f0f0f0  ctermbg=15  ctermfg=black

hi String      guifg=#a0b0c0 ctermfg=black
hi Number      guifg=#40a070 ctermfg=black
hi Float       guifg=#40a070 ctermfg=black
hi Operator    guifg=#06287e gui=bold
hi Statement   guifg=#06287e gui=bold
hi Repeat      guifg=#06287e gui=bold
hi Conditional guifg=#06287e gui=bold
hi Comment     guifg=#7fbf58 gui=italic
hi Identifier  guifg=#5b3674 gui=italic
hi Function    guifg=#ff00f8 gui=bold
hi Define      guifg=#1060a0 gui=italic
hi Structure   guifg=#1060a0 gui=italic
hi Special     guifg=#1060a0 gui=italic
hi Title       guifg=NONE    gui=bold
hi Underlined  guifg=NONE    gui=underline
hi PreProc     guifg=#1060a0 gui=bold
hi Constant    guifg=#a07040
hi Type        guifg=#6c71c4 gui=NONE

" Text states
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi MatchParen  guifg=#40a070 guibg=NONE    gui=bold
hi Error       guifg=red     guibg=#ffffff   gui=bold,underline
hi Todo        guifg=NONE    guibg=NONE    gui=italic,bold
hi Folded      guifg=#a0a0a0 guibg=#e8e8e8 gui=italic
hi TrailingSpaces            guibg=#f0c8c8

hi DiffChange  guifg=NONE    guibg=NONE
hi DiffText    guifg=#06287e guibg=#e3faef gui=NONE
hi DiffAdd     guifg=#06287e guibg=#e3faef gui=NONE
hi DiffDelete  guifg=#fae6e6 guibg=#fae6e6 gui=italic

" Window/screen components
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi ColorColumn               guibg=#f6f6f6

" Cursor
hi Cursor       guifg=#ffffff guibg=#404850
hi CursorLine                 guibg=#f6f6f6

" Gutter
hi LineNr        guifg=#ffffff guibg=#a0b0c0 ctermfg=white ctermbg=32
hi CursorLineNr  guifg=#a0b0c0 guibg=#f6f6f6

" Status line
hi StatusLine    guifg=#ffffff guibg=#a0b0c0 gui=bold ctermbg=grey ctermfg=black
hi StatusLineNC  guifg=#506070 guibg=#a0b0c0 ctermbg=grey ctermfg=black

" Split line
hi VertSplit     guifg=#506070 guibg=#506070 gui=NONE ctermbg=black  ctermfg=grey

" Buffer list
hi MBENormal               guifg=#a0b0c0            gui=italic
hi MBEChanged              guifg=#ff0000
hi MBEVisibleNormal        guifg=#06287e            gui=NONE
hi MBEVisibleChanged       guifg=#ff0000 guibg=NONE gui=NONE
hi MBEVisibleActiveNormal  guifg=#1060a0 guibg=NONE gui=bold
hi MBEVisibleActiveChanged guifg=#ff0000 guibg=NONE gui=bold

hi Directory   guifg=#1060a0

