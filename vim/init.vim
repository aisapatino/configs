" Vim options
"------------------------------------------------------------------------------

"- General
"----------

if has('gui_running') || has('termguicolors')
  set termguicolors
  colorscheme aisa
else
  colorscheme aisadark
endif

set t_Co=256                   " 256-color terminal

set vb t_vb=                   " don't beep or flash on error
set shell=bash                 " default to bash instead of sh for !commands
set lazyredraw                 " don't redraw during background/auto commands

set number                     " show line numbers
set relativenumber             " show line numbers relative to cursor
set colorcolumn=80             " vertical line to show where the 80th col is

set conceallevel=2             " by default allow conceal & conceal chars
set concealcursor=nc           " conceal in cursor line too, in normal or cmd

set wildchar=<tab>             " autocomplete for commands
set shortmess=ilmnxOtI         " shorter messages, don't show intro screen

set list                       " display things like tabs, spaces, eol, etc.
set listchars=trail:◦,tab:▷-,extends:›,precedes:‹
set fillchars=fold:\ ,diff:\ ,vert:\ 
set diffopt=filler,context:3,vertical,foldcolumn:0

"- Indent & wrap
"----------------

set expandtab                  " insert spaces instead of tabs
set tabstop=2                  " how many columns wide a tab is visually
set shiftwidth=2               " how many columns to indent with >>

set nowrap                     " don't wrap lines by default
set breakindent                " maintain indent when wrapping
set linebreak                  " only break between words when wrapping
set showbreak=↳                " indicate start of wrapped lines

"- Movement
"-----------

set scrolloff=3                " minimum lines above/below cursor
set sidescrolloff=3            " minimum columns between cursor and edge

"- Search
"---------

set gdefault                   " default global (multiple matches per line)
set ignorecase                 " case-insensitive search by default
set smartcase                  " case-sensitive if pattern has uppercase letter

"- Folds
"--------

set nofoldenable               " start with all folds open
set foldmethod=indent
set foldtext=alpw#main#GetFoldText()

"- Statusline, tabline, title
"-----------------------------

set statusline=%{alpw#statusline#FileId()}           " buffer number or special ft
set statusline+=\ %#SLWarn#%{alpw#statusline#Modified()}%*   " modified/nomodifiable flag
set statusline+=\ %{alpw#statusline#BranchIndent()}    " git branch, indentation
if has('nvim')
  set statusline+=\ %#ErrorMsg#%{neomake#statusline#LoclistStatus('')}%*
endif
set statusline+=%=                         " end of left side
set statusline+=\ \ \ %<%{alpw#statusline#Dir()}        " short-format path relative to cwd
set statusline+=\ %4L,%v                   " total lines in file, cursor column

set showtabline=2                          " always show tabline
set tabline=%!alpw#main#Tabline()

set titlestring=%{alpw#utils#CWD()}              " show cwd in titlestring

"- Files, sessions
"------------------

set fileformats=unix
set wildignore+=*.pyc,.DS_Store
set sessionoptions-=blank,help,tabpages

set nowritebackup nobackup  " no backup file when overwriting something
set noswapfile              " no temp file to store changes since save

" persist undo history even after buffer is unloaded
set undofile undodir=~/tmp/vim-undo

set tags+=./.tags,~/Drive/Notes/.tags  " always include tags from cwd and Notes
set cpoptions+=d  "    make ./ in tags option relative to cwd, not current file

"- Built-in plugin / filetype options
"------------------------------------

let g:netrw_timefmt = '%Y %b %d %H:%M'
let g:netrw_preview = 1

let g:java_highlight_all = 1

" Custom maps, commands, abbreviations
"------------------------------------------------------------------------------

"- Basics
"---------

let mapleader = ' '

noremap ; :
noremap : ;

"- Movement/navigation
"----------------------

" navigate splits (less keypresses than defaults)
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" go to next tab
nnoremap <Leader>t :tabnext<CR>

" easier keybinding for first non-whitespace char
nnoremap 0 ^
nnoremap ^ 0

" navigate location list & quickfix
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

" jump to conflict markers
nnoremap <Leader>c /\(<<<<<<\\|======\\|>>>>>>\)<CR>

" open netrw in vsplit
cabbrev ve Vexplore

"- Misc
"-------

cabbrev hc    helpclose
cabbrev vres  vertical resize
cabbrev dt    diffthis
cabbrev dg    diffget
cabbrev dp    diffput
cabbrev dup   diffupdate
cabbrev doff  diffoff!

" clear search highlighting
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>

" copy all to global register
noremap <C-y> :%y+<CR>

" change working dir to current file's dir
com! Current cd %:h

com! TrimTrailing %s/\s\+$
com! PrettyJson %!jq '.'
com! Prettier silent !prettier --write %

" command shortcuts for functions
com! UpdateTags           call alpw#commands#UpdateTags()
com! UseTabs              call alpw#commands#UseTabs()
com! -nargs=? Note        call alpw#commands#Note(<q-args>)
com! Highlight            call alpw#commands#ToggleHighlight()

"- Debugging
"------------

com! ShowHighlightGroup echo alpw#commands#ShowHighlightGroup()

" show test highlight page with current colors
com! TestHi :source $VIMRUNTIME/syntax/hitest.vim

" Plugins & runtime path
"------------------------------------------------------------------------------

"- Plugins via vim-plug
"-----------------------

call plug#begin('~/.vim/plugged')

Plug 'aisapatino/ctrlp.vim'
Plug 'sirver/ultisnips', { 'for': ['javascript', 'snippets'] }
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'ervandew/supertab'

if has('nvim')
  Plug 'neomake/neomake'
else
  Plug 'scrooloose/syntastic'
endif

Plug 'junegunn/gv.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'shime/vim-livedown'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'aisapatino/vim-markdown'
Plug 'mustache/vim-mustache-handlebars'
Plug 'digitaltoad/vim-pug'
Plug 'stephpy/vim-yaml'

call plug#end()

"- Plugin config
"----------------

let g:python_host_prog = 'python3'

cabbrev ag Ack!
let g:ackprg = 'ag --hidden --vimgrep'
let g:ackhighlight = 1

let g:ctrlp_extensions = ['tag']           " enable searching of tags
let g:ctrlp_follow_symlinks = 1            " follow symlinks unless they loop
let g:ctrlp_open_multiple_files = '1vjr'   " open 1st in current window, rest hidden
let g:ctrlp_reuse_window = 'netrw\|help'   " open in help or netrw windows (not qf)
let g:ctrlp_show_hidden = 1                " show hidden files by default
let g:ctrlp_switch_buffer = 0              " open buffer in current window even if it's open elsewhere
let g:ctrlp_tilde_homedir = 1              " show mru paths with ~ for $HOME
let g:ctrlp_status_func = {'main': 'alpw#main#CtrlPStatus', 'prog': 'alpw#main#CtrlPProgress'}
let g:ctrlp_custom_ignore = {
\  'dir': '\v(\.git|node_modules|libs|\.coverage-html|coverage|build|dist|dist-.*|gen)$',
\  'file': '\v\.(min.*|map|fugitiveblame)$'
\}
" replace F-key binding, which doesn't work well on mac keyboard
let g:ctrlp_prompt_mappings = { 'PrtDeleteEnt()':  ['<c-2>'] }

" quick shortcuts: find all, files, recent, buffers, tags
nnoremap <Leader>fa :CtrlPMixed<CR>
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>
nnoremap <Leader>b  :CtrlPBuffer<CR>
nnoremap <Leader>ft :CtrlPTag<CR>

cabbrev gk    GV --format=%cd\ %h%d\ %s

let g:javascript_conceal_function = 'ƒ'
let g:javascript_plugin_jsdoc = 1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END

let g:livedown_browser = "'/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome'"

if has('nvim')
  augroup alpwNeovim
    autocmd!
    " mimic gvim autoread behavior
    autocmd BufEnter * checktime
  augroup END
  " automatic 
  augroup alpwNeomake
    autocmd!
    autocmd BufWritePost *.js Neomake
    autocmd BufWritePost *.py Neomake
    autocmd BufWritePost *.sh Neomake
  augroup END
  let g:neomake_warning_sign = { 'text': '▶︎▶︎', 'texthl': 'WarningSign' }
  let g:neomake_error_sign = { 'text': '▶︎▶︎', 'texthl': 'ErrorSign' }
  let g:neomake_highlight_columns = 1
  let g:neomake_highlight_lines = 0
  let g:neomake_python_enabled_makers = ['pylint']
  let g:neomake_eslint_maker = {
    \ 'args': ['-f', 'compact'],
    \ 'errorformat': '%E%f: line %l\, col %c\, Error - %m,' .
    \   '%W%f: line %l\, col %c\, Warning - %m,%-G,%-G%*\d problems%#',
  \ }
  let g:neomake_javascript_enabled_makers = ['eslint']
  let g:neomake_yaml_enabled_makers = ['yamllint']
endif

let g:UltiSnipsExpandTrigger = '<s-tab>'
let g:UltiSnipsJumpForwardTrigger = '<s-tab>'
let g:UltiSnipsJumpBackwardTrigger = '<nul>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '~/.config/nvim/custom-snippets'   " for :UltiSnipsEdit
let g:UltiSnipsSnippetDirectories = ['custom-snippets'] " don't include defaults
