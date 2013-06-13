execute pathogen#infect()

" Debugging
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set verbose=13
" set verbosefile=~/.vim/vimlog.vim

" GUI / text appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme aisa " My modified version of pyte
set lines=41 columns=169
set guioptions="ai" " Hide menu, toolbar

set wrap " soft wrap
set number " Show line numbers
set cursorline " Highlight current line
set colorcolumn=80 " Show where the 80-char line is
let &showbreak='> ' " Indicate start of wrapped
set list " Show non-chars
set listchars=tab:>.,trail:.,extends:# " Show tabs, trailing spaces, off-screen
set scrolloff=3 " Minimum lines above/below cursor
set shortmess="ilmnrxO" " Shorter messages
set showcmd " Show commands as you're typing

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

set ignorecase " Case-insensitive search
set smartcase " If uppercase letter, search case sensitive
set incsearch " Show matches as you type

" Indentation & folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set tabstop=2
set shiftwidth=2 " auto indent width
set smarttab " uses shiftwidth # spaces when inserting <tab>
set autoindent " take indent for new line from previous line
set expandtab " Use spaces instead of tabs
set smartindent "Smart indent

set foldmethod=indent
set nofoldenable " All open at start
set foldtext=GetFoldText() " would like maybe just num of lines?
function! GetFoldText()
  let num_lines = v:foldend - v:foldstart + 1
  return (repeat("~", 15) . num_lines . " lines")
endfunction
" also would like to not highlight line num of folded?

" Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2 " Always show

set statusline=[%n]            " Buffer number
set statusline+=\ %t         " File name
set statusline+=%m%=         " Modified indic, end of left side
set statusline+=%{ShortBufferPath()}
set statusline+=\ %5L         " Total lines in file (padded)

function! ShortBufferPath()
  let path = bufname('')
  let path = substitute(path, '/home/aisa', '~', '') " shorten home to ~
  let path = substitute(path, 'Devel', 'D', '') " shorten main Devel dir
"   let path = substitute(path, '/.\{-2,}$', '/', '') " remove file name
  return path
endfunction

" Files, sessions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

cd ~/Devel/sjfnw/
set wildignore+=*.pyc,__init__.py
set autoread " when file is changed from the outside
set nobackup
set nowb
set noswapfile
set sessionoptions = "buffers,folds,resize,tabpages,winsize"

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

