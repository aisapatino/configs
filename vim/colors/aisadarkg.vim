set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisadarkg"

" Basic screen components                               see :h highlight-groups
"------------------------------------------------------------------------------

hi Normal         guifg=#f0ecea  guibg=#303840
hi NonText        guifg=#a0b0c0

hi VertSplit      guifg=#3f5472  guibg=#3f5472
hi SignColumn     guifg=#ffffff  guibg=#3f5472
hi! link FoldColumn SignColumn

hi LineNr         guifg=#a0b0c0
hi Cursor         guifg=#f8f3a9  guibg=#303042
hi CursorLine                    guibg=#333336
hi CursorLineNr   guifg=#f0f0f0  guibg=#253235

hi ColorColumn                   guibg=#253235

" Syntax groups                                               see :h group-name
"------------------------------------------------------------------------------

hi Comment        guifg=#8090b0
hi CommentHeader  guifg=#8090b0  gui=bold
hi CommentSpecial guifg=#367dc6  gui=italic

hi Constant       guifg=#9370d8
hi String         guifg=#506070
hi Number         guifg=#8865cf
hi Boolean        guifg=#8865cf

hi Identifier     guifg=#3fb9ba
hi Function       guifg=#8865cf  gui=bold

hi Statement      guifg=#89b0f2  gui=bold
hi Operator       guifg=#89b0f2
hi Keyword        guifg=#8865cf  gui=NONE

hi PreProc        guifg=#367dc6  gui=NONE
hi Define         guifg=#367dc6  gui=italic

hi Type           guifg=#3fb9ba  gui=NONE

hi Special        guifg=#367dc6  gui=italic
hi Tag            guifg=#c600bd
hi Debug          guifg=#8865cf  gui=italic
hi! link SpecialChar NONE
hi! link SpecialKey  Comment

hi Underlined     guifg=NONE     gui=underline

hi Error          guifg=#a70035  guibg=NONE     gui=bold
hi Todo           guifg=NONE     guibg=NONE     gui=italic,bold

" Custom syntax groups
"---------------------

hi BoldUnderlined guifg=NONE     gui=bold,underline
hi ClassName      guifg=#c600bd                 gui=bold
hi Code           guifg=#8865cf  guibg=#ffffff
hi WebLink        guifg=#367dc6                 gui=underline

" Text states (dynamic highlights)
"------------------------------------------------------------------------------

hi! link Conceal Statement

hi MatchParen     guifg=#c600bd  guibg=NONE     gui=bold
hi Folded         guifg=#a0b0c0  guibg=NONE     gui=italic
hi Search         guifg=NONE     guibg=#f1f1d0

hi DiffAdd                       guibg=#e0f0e0
hi DiffDelete     guifg=NONE     guibg=#f3e2e2  gui=NONE
hi DiffChange     guifg=NONE     guibg=NONE
hi! link DiffText DiffAdd

hi! SpellLocal    gui=underline  guisp=#ff8800
hi! SpellCap      gui=underline

" Statusline / Tabline
"------------------------------------------------------------------------------

hi StatusLine     guifg=#ffffff  guibg=#3f5472  gui=NONE
hi StatusLineNC   guifg=#a0b0c0  guibg=#3f5472  gui=NONE
hi User1          guifg=#ffffff  guibg=#3f5472  gui=bold
hi SLWarn         guifg=#a70035

hi TabLineFill     guifg=#ffffff  guibg=#3f5472  gui=NONE
hi! link TabLine TablineFill

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

hi WildMenu       guifg=#ffffff  guibg=#1f798a
hi ModeMsg        guifg=#c600bd

" Plugins
"------------------------------------------------------------------------------

hi SyntasticWarningSign  guifg=#ff8800  guibg=#ff8800
hi SyntasticErrorSign    guifg=#a70035  guibg=#a70035

