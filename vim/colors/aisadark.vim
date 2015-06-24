set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisadark"

" fix whiteout of location list
hi! link qfLineNr NONE

"------------------------------------------------------------------------------
" Terminal
"------------------------------------------------------------------------------

" xterm256 color codes used:
" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim

hi ColorColumn                  ctermbg=233
hi Cursor                       ctermbg=255
hi LineNr          ctermfg=8    ctermbg=0
hi CursorLineNr    ctermfg=255               cterm=bold
hi CursorLine                   ctermbg=0
hi StatusLine      ctermfg=0    ctermbg=234  cterm=bold

hi StatusLineNC    ctermfg=0    ctermbg=234
hi VertSplit                    ctermbg=23

hi Normal          ctermfg=7    ctermbg=0
hi Comment         ctermfg=8
hi CommentSpecial  ctermfg=57
hi CommentHeader   ctermfg=8    cterm=bold

hi String          ctermfg=4
hi Number          ctermfg=62
hi Function        ctermfg=129  cterm=bold
hi ClassName       ctermfg=162  cterm=bold
hi Identifier      ctermfg=22   cterm=NONE
hi Type            ctermfg=57

hi Boolean         ctermfg=135
hi Keyword         ctermfg=135

hi Statement       ctermfg=24  cterm=bold
hi Conditional     ctermfg=25  cterm=bold
hi Repeat          ctermfg=25  cterm=bold
hi Operator        ctermfg=25
hi Exception       ctermfg=25  cterm=bold

hi PreProc         ctermfg=25
hi Include         ctermfg=25
hi Define          ctermfg=25
hi Structure       ctermfg=25
hi Special         ctermfg=25

hi Tag             ctermfg=162
hi Debug           ctermfg=63
hi Error           ctermfg=88

hi MatchParen      ctermfg=162
hi Folded          ctermfg=8    ctermbg=0
hi Search                       ctermbg=22
hi TrailingSpaces               ctermbg=94

"------------------------------------------------------------------------------
" GUI Version
"------------------------------------------------------------------------------

hi ColorColumn                  guibg=#111111
hi Cursor                       guibg=#ffffff
hi CursorLine                   guibg=#111111
hi LineNr        guifg=#555555  guibg=#000000
hi CursorLineNr  guifg=#ffffff                 gui=bold
hi StatusLine    guifg=#ffffff  guibg=#111111  gui=bold

hi StatusLineNC  guifg=#101010  guibg=#000000
hi VertSplit                    guibg=#111111  gui=NONE
hi SLWarn        guifg=#A70035
hi Directory     guifg=#1060a0

hi ColorColumn                  guibg=#111111
hi Cursor                       guibg=#ffffff
hi CursorLine                   guibg=#111111
hi LineNr        guifg=#555555  guibg=#000000
hi CursorLineNr  guifg=#ffffff                 gui=bold
hi StatusLine    guifg=#ffffff  guibg=#111111  gui=bold

hi StatusLineNC  guifg=#101010  guibg=#000000
hi VertSplit                    guibg=#111111  gui=NONE
hi SLWarn        guifg=#A70035
hi Directory     guifg=#1060a0

hi Normal         guifg=#cccccc guibg=#000000
hi! link Constant Normal

hi Comment        guifg=#506070
hi CommentSpecial guifg=#6c71c4
hi CommentHeader  guifg=#8090b0 gui=bold
hi String         guifg=#8090b0
hi Number         guifg=#6c71c4
hi! link Float Number

hi Function       guifg=#44047E gui=bold
hi ClassName      guifg=#ff00f8 gui=bold
hi Identifier     guifg=#40a070
hi Type           guifg=#6c71c4 gui=NONE

hi Boolean        guifg=#5b3674
hi Keyword        guifg=#5b3674 gui=italic

hi Statement      guifg=#06287e gui=bold
hi Conditional    guifg=#06287e gui=bold
hi Repeat         guifg=#06287e gui=bold
hi Operator       guifg=#06287e
hi Exception      guifg=#06287e gui=bold

hi PreProc        guifg=#1060a0 gui=NONE
hi Include        guifg=#1060a0 gui=NONE
hi Define         guifg=#1060a0 gui=italic

hi Structure      guifg=#1060a0 gui=italic
hi Special        guifg=#1060a0 gui=italic

hi! link SpecialChar NONE

hi Tag            guifg=#ff00f8

hi Debug          guifg=#5b3674 gui=italic

hi Error          guifg=#A70035 gui=bold,underline
hi Todo           guifg=NONE    guibg=NONE    gui=italic,bold
hi Title          guifg=NONE    gui=bold
hi Underlined     guifg=NONE    gui=underline

hi MatchParen  guifg=#ff00f8 guibg=NONE    gui=bold
hi Folded      guifg=#a0a0a0 guibg=NONE    gui=italic
hi Search      guifg=NONE    guibg=#f8f3a9
hi TrailingSpaces            guibg=#fae6e6

hi DiffChange  guifg=NONE    guibg=NONE
hi DiffText    guifg=#06287e guibg=#e3faef gui=NONE
hi DiffAdd     guifg=#06287e guibg=#e3faef gui=NONE
hi DiffDelete  guifg=#fae6e6 guibg=#fae6e6 gui=italic
