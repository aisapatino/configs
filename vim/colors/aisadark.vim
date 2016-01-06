" A dark background colorscheme for terminal

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisadark"

" xterm256 color codes used:
"   http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"   https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
"
" Note colors 0-15 are affected by terminal's setting for showing bold in bright
" version of color

"------------------------------------------------------------------------------
" Basic screen components                              see :h highlight-groups
"------------------------------------------------------------------------------

hi Normal          ctermfg=250  ctermbg=233
hi NonText         ctermfg=235  ctermbg=bg   cterm=NONE

hi VertSplit                    ctermbg=235  cterm=NONE

hi LineNr          ctermfg=8    ctermbg=bg
hi Cursor                       ctermbg=255
hi CursorLine                   ctermbg=16   cterm=NONE
hi CursorLineNr    ctermfg=252               cterm=bold

hi ColorColumn                  ctermbg=bg

hi StatusLine      ctermfg=75   ctermbg=235  cterm=NONE
hi StatusLineNC    ctermfg=252  ctermbg=235  cterm=NONE
hi User1           ctermfg=75   ctermbg=235  cterm=bold

"------------------------------------------------------------------------------
" Syntax groups                                              see :h group-name
"------------------------------------------------------------------------------

hi Comment         ctermfg=8
hi CommentSpecial  ctermfg=26
hi CommentHeader   ctermfg=8    cterm=bold

hi! link Constant  Normal
hi String          ctermfg=246
hi Number          ctermfg=61
hi Boolean         ctermfg=97

hi Identifier      ctermfg=79   cterm=NONE
hi Function        ctermfg=93   cterm=bold

hi Statement       ctermfg=75   cterm=bold
hi Operator        ctermfg=75
hi Keyword         ctermfg=97

hi Type            ctermfg=62

hi PreProc         ctermfg=25

hi Special         ctermfg=25
hi Tag             ctermfg=162
hi Debug           ctermfg=248

hi Todo            ctermfg=fg   cterm=bold

hi! link Title Function
hi! link htmlItalic Comment

" Custom syntax groups
"----------------------

hi BoldUnderlined  ctermfg=231               cterm=bold,underline
hi Code            ctermfg=81   ctermbg=235
hi ClassName       ctermfg=162               cterm=bold

"------------------------------------------------------------------------------
" Text states (dynamic highlights)
"------------------------------------------------------------------------------

hi! link Conceal Statement
hi MatchParen      ctermfg=162
hi Folded          ctermfg=240  ctermbg=bg
hi Search                       ctermbg=230

hi DiffAdd                      ctermbg=22
hi DiffDelete     ctermfg=fg    ctermbg=88   cterm=NONE
hi DiffChange     ctermfg=NONE  ctermbg=NONE
hi! link DiffText DiffAdd

"------------------------------------------------------------------------------
" Other components
"------------------------------------------------------------------------------

" Netrw / location list / quickfix

hi! link Directory Statement

" Command line

hi Error           ctermfg=88   ctermbg=bg   cterm=bold
hi WarningMsg      ctermfg=208  ctermbg=bg   cterm=bold
hi WildMenu        ctermfg=bg   ctermbg=36
