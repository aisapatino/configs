set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisa"

" Syntax groups
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Normal         guifg=#404850 guibg=#f0f0f0
hi! link Constant Normal

hi Comment        guifg=#8090b0
hi CommentSpecial guifg=#6c71c4
hi CommentHeader  guifg=#8090b0 gui=bold

hi String         guifg=#506070
hi Number         guifg=#5b3674
hi! link Float Number

hi Function       guifg=#44047E gui=bold
hi ClassName      guifg=#ff00f8 gui=bold
hi Identifier     guifg=#40a070
hi Type           guifg=#6c71c4 gui=NONE

hi Boolean        guifg=#5b3674
hi Keyword        guifg=#5b3674 gui=italic
" Keyword is for built-in functions; other reserved words should go into the
" appropriate sub-group

hi Statement      guifg=#06287e gui=bold
hi Conditional    guifg=#06287e gui=bold
hi Repeat         guifg=#06287e gui=bold
hi Operator       guifg=#06287e
hi Exception      guifg=#06287e gui=bold
" hi Label  " case, default, etc.

hi PreProc        guifg=#1060a0 gui=NONE
hi Include        guifg=#1060a0 gui=NONE
hi Define         guifg=#1060a0 gui=italic

hi Structure      guifg=#1060a0 gui=italic
hi Special        guifg=#1060a0 gui=italic
hi! link SpecialChar NONE

hi Tag            guifg=#ff00f8

" hi Delimiter  " character that needs attention
hi Debug          guifg=#5b3674 gui=italic

hi Error          guifg=#A70035               gui=bold,underline
hi Todo           guifg=NONE    guibg=NONE    gui=italic,bold
hi Title          guifg=NONE    gui=bold
hi Underlined     guifg=NONE    gui=underline

" Text states
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syn match TrailingSpaces "\s\+$"
hi MatchParen  guifg=#ff00f8 guibg=NONE    gui=bold
hi Folded      guifg=#a0a0a0 guibg=NONE    gui=italic
hi Search      guifg=NONE    guibg=#f8f3a9
hi TrailingSpaces            guibg=#fae6e6
hi WrongIndent               guibg=#faecd9
hi DiffChange  guifg=NONE    guibg=NONE
hi DiffText    guifg=#06287e guibg=#DFF0E6 gui=NONE
hi DiffAdd     guifg=#06287e guibg=#DFF0E6 gui=NONE
hi DiffDelete  guifg=#F5E9ED guibg=#F5E9ED gui=italic

" Window/screen components
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi ColorColumn                 guibg=#f6f6f6
hi Cursor        guifg=#ffffff guibg=#404850
hi CursorLine                  guibg=#f6f6f6
hi LineNr        guifg=#ffffff guibg=#a0b0c0
hi CursorLineNr  guifg=#a0b0c0 guibg=#f6f6f6
" uses fg of linenr

hi StatusLine    guifg=#ffffff guibg=#a0b0c0 gui=NONE
hi User1         guifg=#fffffe guibg=#a0b0c0 gui=bold
hi StatusLineNC  guifg=#a0b0c0 guibg=#506070 gui=NONE
hi SLWarn        guifg=#a70035

hi VertSplit     guifg=#506070 guibg=#506070 gui=NONE
hi SignColumn                  guibg=#506070
hi Directory     guifg=#1060a0
hi NonText       guifg=#f0f0f0 guibg=#f0f0f0

" fix whiteout of location list
hi! link qfLineNr Directory
hi! link qfSeparator NonText

" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi BufLineHidden             guifg=#a0b0c0            gui=NONE
hi BufLineInactive           guifg=#06287e            gui=NONE
hi BufLineActive             guifg=#1060a0 guibg=NONE gui=bold
hi BufLineHiddenModified     guifg=#A70035
hi BufLineInactiveModified   guifg=#A70035
hi BufLineActiveModified     guifg=#A70035 guibg=NONE gui=bold

hi! link SyntasticWarningSign NONE
hi! link SyntasticErrorSign NONE
hi SyntasticWarningSign guifg=#ffffff   guibg=#ff8800
hi SyntasticErrorSign   guifg=#ffffff   guibg=#ff1111 gui=bold
