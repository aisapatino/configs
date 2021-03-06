set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisa"

" Basic screen components                               see :h highlight-groups
"------------------------------------------------------------------------------

hi Normal         guifg=#404850  guibg=#f0efec
hi NonText        guifg=#a0b0c0

hi VertSplit      guifg=#3f5472  guibg=#3f5472
hi SignColumn     guifg=#ffffff  guibg=NONE
hi WarningSign    guifg=#ff8800  guibg=NONE
hi NeomakeWarningDefault gui=undercurl  guisp=#ff8800
hi ErrorSign      guifg=#990033  guibg=NONE
hi! link NeomakeErrorDefault SpellBad
hi! link FoldColumn SignColumn

hi LineNr         guifg=#a0b0c0
hi Cursor         guifg=#e0f0e0  guibg=#303042
hi CursorLine                    guibg=#f3f3f3
hi CursorLineNr   guifg=#3f5472  guibg=#f3f3f3

hi ColorColumn                   guibg=#f3f3f3

" Syntax groups                                               see :h group-name
"------------------------------------------------------------------------------

hi Comment        guifg=#8090b0
hi CommentHeader  guifg=#8090b0  gui=bold
hi CommentSpecial guifg=#1158a1  gui=italic

hi Constant       guifg=#38057f
hi String         guifg=#506070
hi Number         guifg=#38057f
hi Boolean        guifg=#38057f

hi Identifier     guifg=#1f798a
hi Function       guifg=#440899  gui=bold
hi SpecialFunc    guifg=#1158a1  gui=bold

hi Statement      guifg=#093092  gui=bold
hi Operator       guifg=#093092
hi Keyword        guifg=#5b40a6  gui=NONE

hi PreProc        guifg=#1158a1  gui=NONE
hi Define         guifg=#1158a1  gui=italic

hi Type           guifg=#1f798a  gui=NONE

hi Special        guifg=#1158a1  gui=italic
hi Tag            guifg=#c600bd
hi Debug          guifg=#38057f  gui=italic
hi! link SpecialChar NONE
hi! link SpecialKey  Comment

hi Underlined     guifg=NONE     gui=underline

hi Error          guifg=#990033  guibg=NONE     gui=bold
hi Todo           guifg=NONE     guibg=NONE     gui=italic,bold

" Custom syntax groups
"---------------------

hi BoldUnderlined guifg=NONE     gui=bold,underline
hi ClassName      guifg=#c600bd                 gui=bold
hi Code           guifg=#38057f  guibg=#f6f6f6
hi WebLink        guifg=#1158a1                 gui=underline

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

hi SpellBad                     guisp=#990033
hi SpellLocal    gui=underline  guisp=#ff8800
hi SpellCap      gui=italic

" Statusline / Tabline
"------------------------------------------------------------------------------

hi StatusLine     guifg=#ffffff  guibg=#3f5472  gui=NONE
hi StatusLineNC   guifg=#a0b0c0  guibg=#3f5472  gui=NONE
hi User1          guifg=#ffffff  guibg=#3f5472  gui=bold
hi SLWarn         guifg=#990033

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

hi WarningMsg     guifg=#990033  guibg=NONE     gui=bold
hi ErrorMsg       guifg=#ffffff  guibg=#990033
hi Title          guifg=NONE                    gui=bold

hi WildMenu       guifg=#ffffff  guibg=#1f798a
hi ModeMsg        guifg=#c600bd
