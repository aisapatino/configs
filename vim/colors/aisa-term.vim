set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisa"

"------------------------------------------------------------------------------
" Colors
"------------------------------------------------------------------------------

" Screen components
" -----------------
" 15  #f6f6f6  #f0f0f0  32  8  0
"
" Text
" ----
" #404850  #506070  24  30  17  25
"
" 55  57  89  52

"------------------------------------------------------------------------------
" Basic screen components
"------------------------------------------------------------------------------

hi Normal         ctermfg=234  ctermbg=254
hi NonText        ctermfg=32  ctermbg=254  term=italic

hi VertSplit      ctermfg=8  ctermbg=8
hi SignColumn     ctermfg=15  ctermbg=8
hi LineNr         ctermfg=240  ctermbg=NONE

hi Cursor         ctermfg=122  ctermbg=0
hi CursorLine                    ctermbg=15
hi CursorLineNr   ctermfg=8  ctermbg=15

hi ColorColumn                   ctermbg=15
hi FoldColumn     ctermfg=15  ctermbg=8

"------------------------------------------------------------------------------
" Statusline
"------------------------------------------------------------------------------

hi StatusLine     ctermfg=15  ctermbg=8  cterm=NONE
hi StatusLineNC   ctermfg=245  ctermbg=8  cterm=NONE

" statusline custom highlights (see :h User1)
hi User1          ctermfg=15  ctermbg=8  term=bold
hi SLWarn         ctermfg=52

"------------------------------------------------------------------------------
" Syntax groups                          see :h highlight-groups, :h group-name
"------------------------------------------------------------------------------

hi Comment        ctermfg=24
hi CommentHeader  ctermfg=24  term=bold

hi String         ctermfg=238
hi Number         ctermfg=55
hi Float          ctermfg=55
hi Boolean        ctermfg=57

hi Keyword        ctermfg=57  term=italic
hi Debug          ctermfg=57  term=italic
hi Identifier     ctermfg=30
hi Type           ctermfg=30  term=NONE

hi Function       ctermfg=55  term=bold

hi Operator       ctermfg=17
hi Statement      ctermfg=17  term=bold
hi Conditional    ctermfg=17  term=bold
hi Repeat         ctermfg=17  term=bold
hi Exception      ctermfg=17  term=bold

hi PreProc        ctermfg=25  term=NONE
hi Include        ctermfg=25  term=NONE

hi Define         ctermfg=25  term=italic
hi Structure      ctermfg=25  term=italic
hi Special        ctermfg=25  term=italic
hi SpecialKey     ctermfg=52

hi Tag            ctermfg=89

hi Title          ctermfg=NONE     term=bold
hi Underlined     ctermfg=NONE     term=underline

hi Todo           ctermfg=NONE     ctermbg=NONE    term=italic,bold

hi! link Constant    Normal
hi! link SpecialChar NONE

" Custom syntax groups
"---------------------

hi CommentSpecial ctermfg=57
hi ClassName      ctermfg=89  term=bold

"------------------------------------------------------------------------------
" Text states (dynamic highlights)
"------------------------------------------------------------------------------

hi Error          ctermfg=52  ctermbg=NONE    term=bold
hi MatchParen     ctermfg=89  ctermbg=NONE    term=bold
hi Folded         ctermfg=249  ctermbg=NONE    term=italic
hi Search         ctermfg=NONE     ctermbg=122

hi DiffAdd        ctermfg=17  ctermbg=123 term=NONE
hi DiffDelete     ctermfg=225  ctermbg=225 term=italic
hi DiffChange     ctermfg=NONE     ctermbg=NONE
hi DiffText       ctermfg=17  ctermbg=123

"------------------------------------------------------------------------------
" Quickfix / location list / netrw
"------------------------------------------------------------------------------

hi Directory     ctermfg=25

" fix whiteout of location list
hi! link qfLineNr    Directory
hi! link qfSeparator NonText

hi WildMenu      ctermfg=15   ctermbg=30

hi WarningMsg     ctermfg=52  ctermbg=NONE    term=bold
hi ErrorMsg       ctermfg=15  ctermbg=52

"------------------------------------------------------------------------------
" Popup menu
"------------------------------------------------------------------------------

hi Pmenu          ctermfg=15  ctermbg=32
hi PmenuSel       ctermfg=15  ctermbg=8
hi PmenuSBar                     ctermbg=32
hi PmenuThumb                    ctermbg=15

"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------

hi! link SyntasticWarningSign NONE
hi! link SyntasticErrorSign   NONE
hi SyntasticWarningSign       ctermfg=130  ctermbg=130
hi SyntasticErrorSign         ctermfg=52  ctermbg=52 term=bold
