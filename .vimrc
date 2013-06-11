execute pathogen#infect()

" Debugging
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set verbose=13
" set verbosefile=~/.vim/vimlog.vim

" Appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme aisa
set lines=41 columns=169
set guioptions="ai" " Hide menu, toolbar
set number " Show line numbers
set cursorline " Highlight current line
set colorcolumn=80
set list " Show non-chars
set listchars=tab:>.,trail:.,extends:#

" Custom shortcuts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map ; :

" Go between splits more easily
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Shorter tag window toggle
nnoremap ;tt :TlistToggle

" Shorter searches (find all, find files, find recent)
nnoremap ;fa :CtrlPMixed<Cr>
nnoremap ;ff :CtrlP<Cr>
nnoremap ;fr :CtrlPMRU<Cr>

" General functionality
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set showcmd " Show commands as you're typing
set hlsearch " when searching, highlight all matches
set ignorecase " Case-insensitive search
set smartcase " If uppercase letter, search case sensitive
set incsearch " Show matches as you type
set scrolloff=3 " Minimum lines above/below cursor

" Indentation & folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=4
set shiftwidth=4
set autoindent
set nofoldenable " All open at start
set expandtab " Use spaces instead of tabs
set smarttab
set si "Smart indent

" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2 " Always show
set statusline=%n\ %t%m%=%<%f\ %L

" Files, sessions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

cd ~/Devel/sjfnw/
set wildignore+=*.pyc,__init__.py
set autoread " when file is changed from the outside
set nobackup
set nowb
set noswapfile
set sessionoptions = "buffers,folds,resize,tabpages,winsize"

" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:syntastic_check_on_open=1
let g:syntastic_enable_highlighting = 1
let g:syntastic_python_checker = 'pylint'

let Tlist_Show_One_File = 1 " Only show focused file
let Tlist_Enable_Fold_Column=0

let g:ctrlp_custom_ignore = {'dir':  'pytz$'}
let g:ctrlp_by_filename = 1 " Search by filename, not dir

