set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisadark"

" fix whiteout of location list
hi! link qfLineNr NONE

" http://vim.wikia.com/wiki/Xterm256_color_names_for_console_Vim
" shows xterm256 color codes used

"------------------------------------------------------------------------------
" Window/screen components
"------------------------------------------------------------------------------

hi ColorColumn                  guibg=#111111  ctermbg=233
hi Cursor                       guibg=#ffffff  ctermbg=white
hi CursorLine                   guibg=#111111  ctermbg=black
hi LineNr        guifg=#555555  guibg=#000000  ctermfg=8     ctermbg=0
hi CursorLineNr  guifg=#ffffff  gui=bold ctermfg=white  cterm=bold
hi StatusLine    guifg=#ffffff  guibg=#111111  gui=bold ctermfg=black  ctermbg=234 cterm=bold
hi StatusLineNC  guifg=#101010  guibg=#000000  ctermfg=black  ctermbg=234
hi VertSplit                    guibg=#111111  gui=NONE ctermbg=23
hi SLWarn        guifg=#A70035
hi Directory     guifg=#1060a0

"------------------------------------------------------------------------------
" Types of text
"------------------------------------------------------------------------------

hi Normal         guifg=#cccccc guibg=#000000 ctermfg=7 ctermbg=0
hi! link Constant Normal

hi Comment        guifg=#506070            ctermfg=8
hi CommentSpecial guifg=#6c71c4            ctermfg=57
hi CommentHeader  guifg=#8090b0 gui=bold   ctermfg=8    cterm=bold

hi String         guifg=#8090b0            ctermfg=242
hi Number         guifg=#6c71c4            ctermfg=62
hi! link Float Number

hi Function       guifg=#44047E gui=bold   ctermfg=129  cterm=bold
hi ClassName      guifg=#ff00f8 gui=bold   ctermfg=162  cterm=bold
hi Identifier     guifg=#40a070            ctermfg=22
hi Type           guifg=#6c71c4 gui=NONE   ctermfg=57

hi Boolean        guifg=#5b3674            ctermfg=135
hi Keyword        guifg=#5b3674 gui=italic ctermfg=135
" Keyword is for built-in functions; other reserved words should go into the
" appropriate sub-group

hi Statement      guifg=#06287e gui=bold  ctermfg=24  cterm=bold
hi Conditional    guifg=#06287e gui=bold  ctermfg=25  cterm=bold
hi Repeat         guifg=#06287e gui=bold  ctermfg=25  cterm=bold
hi Operator       guifg=#06287e ctermfg=25
hi Exception      guifg=#06287e gui=bold  ctermfg=25  cterm=bold
" hi Label  " case, default, etc.

hi PreProc        guifg=#1060a0 gui=NONE ctermfg=25
hi Include        guifg=#1060a0 gui=NONE ctermfg=25
hi Define         guifg=#1060a0 gui=italic ctermfg=25

hi Structure      guifg=#1060a0 gui=italic ctermfg=25
hi Special        guifg=#1060a0 gui=italic ctermfg=25

hi! link SpecialChar NONE

hi Tag            guifg=#ff00f8 ctermfg=162

" hi Delimiter  " character that needs attention
hi Debug          guifg=#5b3674 gui=italic ctermfg=63

hi Error          guifg=#A70035 gui=bold,underline ctermfg=88
hi Todo           guifg=NONE    guibg=NONE    gui=italic,bold
hi Title          guifg=NONE    gui=bold
hi Underlined     guifg=NONE    gui=underline

"------------------------------------------------------------------------------
" Text states
"------------------------------------------------------------------------------

hi MatchParen  guifg=#ff00f8 guibg=NONE    gui=bold ctermfg=162
hi Folded      guifg=#a0a0a0 guibg=NONE    gui=italic ctermfg=8
hi Search      guifg=NONE    guibg=#f8f3a9 ctermbg=22
hi TrailingSpaces            guibg=#fae6e6 ctermbg=94

hi DiffChange  guifg=NONE    guibg=NONE
hi DiffText    guifg=#06287e guibg=#e3faef gui=NONE
hi DiffAdd     guifg=#06287e guibg=#e3faef gui=NONE
hi DiffDelete  guifg=#fae6e6 guibg=#fae6e6 gui=italic
