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
set lines=41 columns=169  " maximize (this appears to do nothing?)
set guiheadroom=0         " account for menu/toolbar being hidden

if &diff
  syntax off
else
  set list                " show non-chars
  syntax on
endif

set wrap                  " soft wrap
let &showbreak='> '       " indicate start of wrapped
set number                " show line numbers
set cursorline            " highlight current line
set colorcolumn=80        " show where the 80-char line is
set listchars=tab:>.,trail:.,extends:# " tabs, trailing spaces, off-screen
set scrolloff=3           " minimum lines above/below cursor
set shortmess=ilmnrxO     " shorter messages
set showcmd               " show commands as you're typing

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

" Trim trailing spaces
map ;trail :%s/\s\+$

" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase " case-insensitive search
set smartcase  " if uppercase letter, search case sensitive
set incsearch  " show matches as you type

" Indentation & folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=2    " how many columns wide a tab is visually
set shiftwidth=2 " how many columns to indent with >>
set smarttab     " uses shiftwidth # spaces when inserting <tab>
set expandtab    " hitting tab inserts spaces instead of <tab>
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
set statusline+=%{ShPath()}  " shortened path
set statusline+=\ %5L        " total lines in file (padded)

function! ShPath()
  let path = expand('%:h')                            " path sans file
  let path = substitute(path, '/home/aisa', '~', '')  " shorten home to ~
  let path = substitute(path, '\Users\aisa', '~', '') " windows version
  let path = substitute(path, 'Devel', 'D', '')       " shorten main Devel dir
  return path
endfunction

" Files, sessions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*.pyc,__init__.py
set autoread " when file is changed from the outside
set nobackup
set nowb
set noswapfile
set sessionoptions="buffers,folds,resize,tabpages,winsize" " don't save opts

" Diffs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
set diffopt=filler,context:2,vertical,foldcolumn:1

" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" let g:syntastic_mode_map['mode']='passive'
" let g:syntastic_check_on_open=1
" let g:syntastic_enable_highlighting = 1
" let g:syntastic_python_checker = 'pylint'

let Tlist_Show_One_File = 1 " Only show focused file
let Tlist_Enable_Fold_Column=0

let g:ctrlp_custom_ignore = {'dir':  'pytz$'}
let g:ctrlp_by_filename = 1 " Search by filename, not dir

" Language-specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Debugging
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set verbose=13
" set verbosefile=~/.vim/vimlog.vim

