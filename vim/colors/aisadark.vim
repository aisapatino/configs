" A dark background colorscheme for terminal

" xterm256 color codes used:
"   http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
"   https://upload.wikimedia.org/wikipedia/en/1/15/Xterm_256color_chart.svg
"
" note colors 0-15 are affected by terminal's settings - may use bright
" version of color

set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisadark"

" Basic screen components                              see :h highlight-groups
"------------------------------------------------------------------------------

hi Normal          ctermfg=252  ctermbg=233
hi NonText         ctermfg=235  ctermbg=NONE cterm=NONE

hi VertSplit                    ctermbg=235  cterm=NONE
hi SignColumn      ctermfg=255  ctermbg=235
hi! link FoldColumn SignColumn

hi LineNr          ctermfg=008  ctermbg=bg
hi Cursor          ctermfg=bg   ctermbg=195
hi CursorLine                   ctermbg=016   cterm=NONE
hi CursorLineNr    ctermfg=252                cterm=bold

hi ColorColumn                  ctermbg=NONE

" Syntax groups                                              see :h group-name
"------------------------------------------------------------------------------

hi Comment         ctermfg=067
hi CommentSpecial  ctermfg=026
hi CommentHeader   ctermfg=008    cterm=bold

hi! link Constant  Normal
hi String          ctermfg=248
hi Number          ctermfg=061
hi Boolean         ctermfg=097

hi Identifier      ctermfg=079   cterm=NONE
hi Function        ctermfg=093   cterm=bold

hi Statement       ctermfg=075   cterm=bold
hi Operator        ctermfg=246
hi Keyword         ctermfg=103

hi PreProc         ctermfg=025

hi Type            ctermfg=079

hi Special         ctermfg=025
hi Tag             ctermfg=162
hi Debug           ctermfg=248

hi Underlined      ctermfg=NONE  cterm=underline

hi Error           ctermfg=088   ctermbg=bg   cterm=bold
hi Todo            ctermfg=NONE  ctermbg=NONE cterm=bold

hi! link htmlItalic Comment

" Custom syntax groups
"----------------------

hi BoldUnderlined  ctermfg=231               cterm=bold,underline
hi Code            ctermfg=255   ctermbg=235
hi ClassName       ctermfg=162               cterm=bold
hi WebLink         ctermfg=025                cterm=underline

" Text states (dynamic highlights)
"------------------------------------------------------------------------------

hi! link Conceal   Statement

hi MatchParen      ctermfg=162  ctermbg=NONE
hi Folded          ctermfg=240  ctermbg=bg
hi Search          ctermfg=NONE ctermbg=162

hi DiffAdd         ctermfg=029  ctermbg=NONE  cterm=inverse
hi DiffDelete      ctermfg=NONE ctermbg=052   cterm=NONE
hi DiffChange      ctermfg=NONE ctermbg=NONE
hi! link DiffText  DiffAdd

" Statusline / Tabline
"------------------------------------------------------------------------------

hi StatusLine      ctermfg=075  ctermbg=235  cterm=NONE
hi StatusLineNC    ctermfg=252  ctermbg=235  cterm=NONE
hi User1           ctermfg=075  ctermbg=235  cterm=bold

hi! link TabLineFill StatusLine
hi! link TabLine     TablineFill

" Other components
"------------------------------------------------------------------------------

" Netrw / location list / quickfix

hi! link Directory Statement

" Command line

hi WarningMsg      ctermfg=208  ctermbg=bg   cterm=bold
hi WildMenu        ctermfg=bg   ctermbg=036
hi! link Title     Function
