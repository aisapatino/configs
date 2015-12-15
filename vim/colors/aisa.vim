set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisa"

"------------------------------------------------------------------------------
" Basic screen components                               see :h highlight-groups
"------------------------------------------------------------------------------

hi Normal         guifg=#404850  guibg=#f0f0f0
hi NonText        guifg=#a0b0c0                 gui=italic

hi VertSplit      guifg=#3f5472  guibg=#3f5472
hi SignColumn     guifg=#ffffff  guibg=#3f5472
hi! link FoldColumn SignColumn

hi LineNr         guifg=#a0b0c0
hi Cursor         guifg=#f8f3a9  guibg=#303042
hi CursorLine                    guibg=#f6f6f6
hi CursorLineNr   guifg=#3f5472  guibg=#f6f6f6

hi ColorColumn                   guibg=#f6f6f6

"------------------------------------------------------------------------------
" Syntax groups                                               see :h group-name
"------------------------------------------------------------------------------

hi Comment        guifg=#8090b0
hi CommentHeader  guifg=#8090b0  gui=bold
hi CommentSpecial guifg=#1158a1  gui=italic

hi Constant       guifg=#44047e
hi String         guifg=#506070
hi Number         guifg=#44047e
hi Boolean        guifg=#44047e

hi Identifier     guifg=#3a9281
hi Function       guifg=#c600bd  gui=bold

hi Statement      guifg=#06287e  gui=bold
hi Operator       guifg=#06287e
hi Keyword        guifg=#5b40a6  gui=NONE

hi PreProc        guifg=#1158a1  gui=NONE
hi Define         guifg=#1158a1  gui=italic

hi Type           guifg=#3a9281  gui=NONE

hi Special        guifg=#1158a1  gui=italic
hi Tag            guifg=#c600bd
hi Debug          guifg=#44047e  gui=italic
hi! link SpecialChar NONE
hi! link SpecialKey  Comment

hi Underlined     guifg=NONE     gui=underline
hi Error          guifg=#a70035  guibg=NONE     gui=bold
hi Todo           guifg=NONE     guibg=NONE     gui=italic,bold

" Custom syntax groups
"---------------------

hi ClassName      guifg=#c600bd                 gui=bold
hi Code           guifg=#44047e  guibg=#ffffff

"------------------------------------------------------------------------------
" Text states (dynamic highlights)
"------------------------------------------------------------------------------

hi! link Conceal Statement

hi MatchParen     guifg=#c600bd  guibg=NONE     gui=bold
hi Folded         guifg=#a0b0c0  guibg=NONE     gui=italic
hi Search         guifg=NONE     guibg=#f8f3a9

hi DiffAdd                       guibg=#d6f4d6
hi DiffDelete     guifg=NONE     guibg=#f8d6d6  gui=NONE
hi DiffChange     guifg=NONE     guibg=NONE
hi! link DiffText DiffAdd

hi! SpellLocal    gui=underline  guisp=#ff8800
hi! SpellCap      gui=underline
"------------------------------------------------------------------------------
" Statusline / Tabline
"------------------------------------------------------------------------------

hi StatusLine     guifg=#ffffff  guibg=#3f5472  gui=NONE
hi StatusLineNC   guifg=#a0b0c0  guibg=#3f5472  gui=NONE
hi User1          guifg=#ffffff  guibg=#3f5472  gui=bold
hi SLWarn         guifg=#a70035

hi! link TabLineFill StatusLine

"------------------------------------------------------------------------------
" Other components
"------------------------------------------------------------------------------

" Netrw / location list / quickfix

hi! link Directory Statement

" Popup menu

hi Pmenu          guifg=#ffffff  guibg=#a0b0c0
hi PmenuSel       guifg=#ffffff  guibg=#3f5472
hi PmenuSBar                     guibg=#a0b0c0
hi PmenuThumb                    guibg=#ffffff

" Command line

hi WarningMsg     guifg=#a70035  guibg=NONE     gui=bold
hi ErrorMsg       guifg=#ffffff  guibg=#a70035
hi Title          guifg=NONE                    gui=bold

hi WildMenu       guifg=#ffffff  guibg=#3a9281

"------------------------------------------------------------------------------
" Plugins
"------------------------------------------------------------------------------

hi SyntasticWarningSign  guifg=#ff8800  guibg=#ff8800
hi SyntasticErrorSign    guifg=#a70035  guibg=#a70035
