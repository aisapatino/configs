set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name = "aisa"

" Colors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" #404850  #506070  #f0f0f0  #f6f6f6
" normal   sline    bg       colorcol, cursorline
" #a0b0c0  #06287e  #1060a0
" *        *        *
" #40a070  #7fbf58
" numbers  comments
" #ff0000  #ff00f8 
"" errors   func/class    
" #5b3674  #6c71c4
"
" #fae6e6   #e3faef
" diffs

" colors maybe   #A70035  #00804C  #005332  #44047E
" Types of text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi Normal      guifg=#404850 guibg=#f0f0f0  ctermbg=15  ctermfg=black

hi Comment     guifg=#7fbf58 gui=italic
hi CommentHeader guifg=#7fbf58 gui=italic,bold
hi Constant    guifg=#44047E
hi String      guifg=#a0b0c0 ctermfg=black
hi Number      guifg=#40a070 ctermfg=black
hi Float       guifg=#40a070 ctermfg=black
" hi Character " character constant, 'c', '\n'
" hi Boolean

" Identifier = any variable name
hi Identifier  guifg=#5b3674 gui=italic
hi Function    guifg=#ff00f8 gui=bold

hi Statement   guifg=#06287e gui=bold
hi Conditional guifg=#06287e gui=bold
hi Repeat      guifg=#06287e gui=bold
hi Operator    guifg=#06287e gui=bold
" hi Keyword  " other keywords
" hi Exception  " try, catch, throw
" hi Label  " case, default, etc.

" PreProc is used for django tags in templates
hi PreProc     guifg=#1060a0 gui=NONE
" hi Include  " preprocessor #include
" Define = preprocessor #define
hi Define      guifg=#06287e gui=bold
" hi Macro  " same as Define
" hi PreCondit " preprocessor if else endif etc.

hi Type        guifg=#6c71c4 gui=NONE
" hi StorageClass " status, register, volatile, etc.
" Structure = struct, union, enum, etc.
hi Structure   guifg=#1060a0 gui=italic
" hi Typedef

hi Special     guifg=#1060a0 gui=italic
" hi SpecialChar  " special char in a constant
" hi Tag  " you can use CTRL-] on this
" hi Delimiter  " character that needs attention
" hi Debug  " debugging statements

hi Title       guifg=NONE    gui=bold
hi Underlined  guifg=NONE    gui=underline

" Text states
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi MatchParen  guifg=#40a070 guibg=NONE    gui=bold
hi Error       guifg=red     guibg=#ffffff gui=bold,underline
hi Todo        guifg=NONE    guibg=NONE    gui=italic,bold
hi Folded      guifg=#a0a0a0 guibg=#e8e8e8 gui=italic
hi Search      guifg=NONE    guibg=#f8f3cb
hi TrailingSpaces            guibg=#fae6e6

hi DiffChange  guifg=NONE    guibg=NONE
hi DiffText    guifg=#06287e guibg=#e3faef gui=NONE
hi DiffAdd     guifg=#06287e guibg=#e3faef gui=NONE
hi DiffDelete  guifg=#fae6e6 guibg=#fae6e6 gui=italic

" Window/screen components
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi ColorColumn                 guibg=#f6f6f6
hi Cursor        guifg=#ffffff guibg=#404850
hi CursorLine                  guibg=#f6f6f6
hi LineNr        guifg=#ffffff guibg=#a0b0c0 ctermfg=white ctermbg=32
hi CursorLineNr  guifg=#a0b0c0 guibg=#f6f6f6
hi StatusLine    guifg=#ffffff guibg=#a0b0c0 gui=bold ctermbg=grey ctermfg=black
hi StatusLineNC  guifg=#506070 guibg=#a0b0c0 ctermbg=grey ctermfg=black
hi VertSplit     guifg=#506070 guibg=#506070 gui=NONE ctermbg=black  ctermfg=grey

" Buffer list
hi MBENormal               guifg=#a0b0c0            gui=italic
hi MBEChanged              guifg=#ff0000
hi MBEVisibleNormal        guifg=#06287e            gui=NONE
hi MBEVisibleChanged       guifg=#ff0000 guibg=NONE gui=NONE
hi MBEVisibleActiveNormal  guifg=#1060a0 guibg=NONE gui=bold
hi MBEVisibleActiveChanged guifg=#ff0000 guibg=NONE gui=bold

hi Directory   guifg=#1060a0

"   TagListTagName  - Used for tag names
"   TagListTagScope - Used for tag scope
"   TagListTitle    - Used for tag titles
"   TagListComment  - Used for comments
"   TagListFileName - Used for filenames
