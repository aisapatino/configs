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
" #ffffff  #f6f6f6  #f0f0f0  #a0b0c0  #3f5472  #303042
"
" Text
" ----
" #404850  #506070  #8090b0  #3a9281  #06287e  #1158a1
"
" #44047e  #5b40a6  #c600bd  #a70035

"------------------------------------------------------------------------------
" Basic screen components
"------------------------------------------------------------------------------

hi Normal         guifg=#404850  guibg=#f0f0f0
hi NonText        guifg=#f0f0f0  guibg=#f0f0f0

hi VertSplit      guifg=#3f5472  guibg=#3f5472
hi SignColumn     guifg=#ffffff  guibg=#3f5472
hi LineNr         guifg=#a0b0c0  guibg=NONE

hi Cursor         guifg=#f8f3a9  guibg=#303042
hi CursorLine                    guibg=#f6f6f6
hi CursorLineNr   guifg=#3f5472  guibg=#f6f6f6

hi ColorColumn                   guibg=#f6f6f6
hi FoldColumn     guifg=#ffffff  guibg=#3f5472

"------------------------------------------------------------------------------
" Statusline
"------------------------------------------------------------------------------

hi StatusLine     guifg=#ffffff  guibg=#3f5472  gui=NONE
hi StatusLineNC   guifg=#a0b0c0  guibg=#3f5472  gui=NONE

" statusline custom highlights (see :h User1)
hi User1          guifg=#ffffff  guibg=#3f5472  gui=bold
hi SLWarn         guifg=#a70035

"------------------------------------------------------------------------------
" Syntax groups                          see :h highlight-groups, :h group-name
"------------------------------------------------------------------------------

hi Comment        guifg=#8090b0
hi CommentHeader  guifg=#8090b0  gui=bold

hi String         guifg=#506070
hi Number         guifg=#44047e
hi Float          guifg=#44047e
hi Boolean        guifg=#5b40a6

hi Keyword        guifg=#5b40a6  gui=italic
hi Debug          guifg=#5b40a6  gui=italic
hi Identifier     guifg=#3a9281
hi Type           guifg=#3a9281  gui=NONE

hi Function       guifg=#44047e  gui=bold

hi Operator       guifg=#06287e
hi Statement      guifg=#06287e  gui=bold
hi Conditional    guifg=#06287e  gui=bold
hi Repeat         guifg=#06287e  gui=bold
hi Exception      guifg=#06287e  gui=bold

hi PreProc        guifg=#1158a1  gui=NONE
hi Include        guifg=#1158a1  gui=NONE

hi Define         guifg=#1158a1  gui=italic
hi Structure      guifg=#1158a1  gui=italic
hi Special        guifg=#1158a1  gui=italic

hi Tag            guifg=#c600bd

hi Title          guifg=NONE     gui=bold
hi Underlined     guifg=NONE     gui=underline

hi Todo           guifg=NONE     guibg=NONE    gui=italic,bold

hi! link Constant    Normal
hi! link SpecialChar NONE

" Custom syntax groups
"---------------------

hi CommentSpecial guifg=#5b40a6
hi ClassName      guifg=#c600bd  gui=bold

"------------------------------------------------------------------------------
" Text states (dynamic highlights)
"------------------------------------------------------------------------------

hi Error          guifg=#a70035  guibg=NONE    gui=bold
hi MatchParen     guifg=#c600bd  guibg=NONE    gui=bold
hi Folded         guifg=#bbbbbb  guibg=NONE    gui=italic
hi Search         guifg=NONE     guibg=#f8f3a9

hi DiffAdd        guifg=#06287e  guibg=#dff0e6 gui=NONE
hi DiffDelete     guifg=#f5e9ed  guibg=#f5e9ed gui=italic
hi DiffChange     guifg=NONE     guibg=NONE
hi DiffText       guifg=#06287e  guibg=#dff0e6

"------------------------------------------------------------------------------
" Quickfix / location list / netrw
"------------------------------------------------------------------------------

hi Directory     guifg=#1158a1

" fix whiteout of location list
hi! link qfLineNr    Directory
hi! link qfSeparator NonText

hi WildMenu      guifg=#ffffff   guibg=#3a9281

hi WarningMsg     guifg=#a70035  guibg=NONE    gui=bold
hi ErrorMsg       guifg=#ffffff  guibg=#a70035

"------------------------------------------------------------------------------
" Popup menu
"------------------------------------------------------------------------------

hi Pmenu          guifg=#ffffff  guibg=#a0b0c0
hi PmenuSel       guifg=#ffffff  guibg=#3f5472
hi PmenuSBar                     guibg=#a0b0c0
hi PmenuThumb                    guibg=#ffffff

"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------

hi! link SyntasticWarningSign NONE
hi! link SyntasticErrorSign   NONE
hi SyntasticWarningSign       guifg=#ff8800  guibg=#ff8800
hi SyntasticErrorSign         guifg=#a70035  guibg=#a70035 gui=bold
