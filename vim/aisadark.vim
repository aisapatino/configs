set background=dark
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisadark"

" fix whiteout of location list
hi! link qfLineNr NONE

" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #404850   #506070
" normal    sline, strings
"
" #06287e        #1060a0   #a0b0c0
" bold keywords  *         linenr, status
"
" #40a070   #8090b0
" numbers   comments
"
" #ff00f8     #44047E
" class name  func name

" #5b3674  #6c71c4  " not distinct from normal/comment unless italic/bold
"
" backgrounds:
"
" #f0f0f0  #f6f6f6                #fae6e6   #e3faef
" bg       colorcol, cursorline   diffs
"
" #A70035 error
" colors maybe     #00804C  #005332

" Types of text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Normal         guifg=#f0f0f0 guibg=#111  ctermbg=black  ctermfg=white
hi! link Constant Normal

hi Comment        guifg=#8090b0
hi CommentSpecial guifg=#6c71c4
hi CommentHeader  guifg=#8090b0 gui=bold

hi String         guifg=#506070
hi Number         guifg=#6c71c4
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

hi MatchParen  guifg=#ff00f8 guibg=NONE    gui=bold
hi Folded      guifg=#a0a0a0 guibg=NONE    gui=italic
hi Search      guifg=NONE    guibg=#f8f3a9
hi TrailingSpaces            guibg=#fae6e6

hi DiffChange  guifg=NONE    guibg=NONE
hi DiffText    guifg=#06287e guibg=#e3faef gui=NONE
hi DiffAdd     guifg=#06287e guibg=#e3faef gui=NONE
hi DiffDelete  guifg=#fae6e6 guibg=#fae6e6 gui=italic

" Window/screen components
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi ColorColumn                 guibg=#111111
hi Cursor        guibg=#ffffff
hi CursorLine    guibg=#000000
hi LineNr        guifg=#ffffff guibg=#333333 ctermfg=white ctermbg=32
hi CursorLineNr  guifg=#333333 guibg=#f6f6f6
hi StatusLine    guifg=#ffffff guibg=#333333 gui=bold ctermbg=grey ctermfg=black
hi StatusLineNC  guifg=#555555 guibg=#000000 ctermbg=grey ctermfg=black
hi VertSplit                   guibg=#000000 gui=NONE ctermbg=black  ctermfg=grey
hi SLWarn        guifg=#A70035
hi Directory     guifg=#1060a0

hi MBENormal               guifg=#a0b0c0            gui=italic
hi MBEChanged              guifg=#A70035
hi MBEVisibleNormal        guifg=#06287e            gui=NONE
hi MBEVisibleChanged       guifg=#A70035 guibg=NONE gui=NONE
hi MBEVisibleActiveNormal  guifg=#1060a0 guibg=NONE gui=bold
hi MBEVisibleActiveChanged guifg=#A70035 guibg=NONE gui=bold


"   TagListTagName  - Used for tag names
"   TagListTagScope - Used for tag scope
"   TagListTitle    - Used for tag titles
"   TagListComment  - Used for comments
"   TagListFileName - Used for filenames
