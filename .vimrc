execute pathogen#infect()

" Computer-specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("win32")
  cd ~\Devel\
  set guifont=Consolas
else
  cd ~/Devel/sjfnw/
endif

" GUI / text appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme aisa          " modified version of pyte
set guioptions="ai"       " hide menu, toolbar
set lines=41 columns=169  " maximize
set guiheadroom=0         " account for menu/toolbar being hidden

if &diff
  syntax off
else
  syntax enable           " enable syntax, don't override colors
endif

set nowrap                " don't wrap lines by default
let &showbreak='> '       " indicate start of wrapped
set number                " show line numbers
set cursorline            " highlight current line
set colorcolumn=80        " show where the 80-char line is
set scrolloff=3           " minimum lines above/below cursor
set shortmess=ilmnrxO     " shorter messages
set showcmd               " show commands as you're typing
set fillchars="vert:\|,fold:\ -,diff:\ -"
match TrailingSpaces /\s\+$/
filetype plugin indent on

" Custom keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map ; :

" Go between splits more easily
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Shorter tag window toggle
nnoremap ;tt :TlistToggle

" Shorter file searches (find all, find files, find recent, find buffer)
nnoremap ;fa :CtrlPMixed<Cr>
nnoremap ;ff :CtrlP<Cr>
nnoremap ;fr :CtrlPMRU<Cr>
nnoremap ;fb :CtrlPBuffer<Cr>

" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase " case-insensitive search
set smartcase  " if uppercase letter, search case sensitive
set incsearch  " show matches as you type

" Indentation & folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4    " how many columns wide a tab is visually
set shiftwidth=4 " how many columns to indent with >>
set smarttab     " uses shiftwidth # spaces when inserting <tab>
set autoindent   " take indent for new line from previous line
set smartindent  " use shiftwidth value when inserting <tab> TODO same as st?

set foldmethod=indent
set nofoldenable           " all open at start
set foldtext=GetFoldText() " would like maybe just num of lines?
function! GetFoldText()
  let num_lines = v:foldend - v:foldstart + 1
  return (repeat("- ", 35) . num_lines . " lines")
endfunction
" also would like to not highlight line num of folded?

" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2 " Always show

set statusline=[%n]          " buffer number
set statusline+=\ %t         " file name
set statusline+=%m%=         " modified indic, end of left side
set statusline+=%{ShPath(expand('%:h'))}  " shortened path
set statusline+=\ %5L        " total lines in file (padded)

function! ShPath(path)
  let path = a:path
  let path = substitute(path, '/home/aisa', '~', '')  " shorten home to ~
  let path = substitute(path, '\Users\aisa', '~', '') " windows version
  let path = substitute(path, 'Devel', 'D', '')       " shorten main Devel dir
  return path
endfunction

" Files, sessions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*.pyc,__init__.py,*/tmp/*,*/pytz/*
set autoread " when file is changed from the outside
set nobackup
set nowb
set noswapfile
set sessionoptions="buffers,curdir,folds,resize,tabpages,winsize"

" Diffs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
set diffopt=filler,context:2,vertical,foldcolumn:1

" Custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use !command to run a shell command without dropping into shell

" Store sessions in one place
nnoremap ;so :so ~/Devel/vim-sessions/

" Trim trailing spaces
map ;trail :%s/\s\+$

" Format django's debug=True lists of queries 
command FormatQLogs execute "%s/\(SELECT\|WHERE\|FROM\|\)/\r\t\1/gc | %s/`//gc"

" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:did_minibufexplorer_syntax_inits = 1 " tell minibuf not to set its own hi
let g:miniBufExplHideWhenDiff = 1          " don't show in diff mode
let g:miniBufExplStatusLineText = '%=cwd\ %{ShPath(getcwd())}'

let Tlist_Show_One_File = 1     " only show focused file
let Tlist_Enable_Fold_Column = 0

let g:ctrlp_by_filename = 1  " search by filename, not dir
let g:ctrlp_use_caching = 1  " preserve cache between sessions

let g:EasyGrepCommand = 1      " use :grep instead of :vimgrep
let g:EasyGrepEveryMatch = 1   " show all matches on a line
let g:EasyGrepRecursive = 1    " search subfolders
let g:EasyGrepMode = 2         " use file associations
let g:EasyGrepAllOptionsInExplorer = 1
let g:EasyGrepFileAssociations = "/home/aisa/.vim/bundle/CustomGrepFileAssoc"
let g:EasyGrepFilesToExclude = 'pytz,djangoappengine' " ignore these dirs

" let g:syntastic_mode_map['mode']='passive'
" let g:syntastic_check_on_open=1
" let g:syntastic_enable_highlighting = 1
" let g:syntastic_python_checker = 'pylint'

" Language-specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au Filetype python set tabstop=2 |set shiftwidth=2 | set expandtab
au Filetype lua    set tabstop=2 |set shiftwidth=2 | set expandtab

" Debugging
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set verbose=13
" set verbosefile=~/.vim/vimlog.vim

