cd ~/Projects

"------------------------------------------------------------------------------
" Plugins & runtime path
"------------------------------------------------------------------------------

" Plugins via vim-plug
"----------------------

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'd11wtq/ctrlp_bdelete.vim'
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'editorconfig/editorconfig-vim'
Plug 'aisapatino/hex-highlight'
Plug 'tpope/vim-vinegar'
Plug 'ludovicchabant/vim-gutentags'
Plug 'xolox/vim-notes' | Plug 'xolox/vim-misc'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-surround'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-jade'
Plug 'groenewege/vim-less'
Plug 'mustache/vim-mustache-handlebars'

call plug#end()

" Custom syntax & ftplugins
"---------------------------
set rtp+=~/.vim/custom-after/

"------------------------------------------------------------------------------
" Vim settings
"------------------------------------------------------------------------------

" Basics
"--------

colorscheme aisadark             " may be overridden in .gvimrc
set t_Co=256                     " 256-color if running in terminal
set encoding=utf-8
set number                       " show line numbers
set colorcolumn=80               " vertical line to show where the 80th col is
set conceallevel=1               " by default allow conceal chars
set lazyredraw                   " don't redraw during background/auto commands

" disable error noises/flashes
set vb t_vb=

set wildmenu wildchar=<tab>      " autocomplete for commands
set showcmd                      " show commands as you type
set shortmess=ilmnrxOI           " shorter messages

set nowrap                       " don't wrap lines by default
set breakindent                  " maintain indent when wrapping
set linebreak                    " only break between words when wrapping
set showbreak=↳                  " indicate start of wrapped lines

set formatoptions+=j             " remove comment chars when joining

set fillchars=fold:\ ,diff:\ ,vert:\ 
set diffopt=filler,context:2,vertical,foldcolumn:1
set listchars=trail:⨯,tab:▷-,extends:›,precedes:‹
set list

" Indentation
"-------------

set expandtab        " use spaces instead of tabs
set tabstop=2        " how many columns wide a tab is visually
set shiftwidth=2     " how many columns to indent with >>
set smarttab         " use shiftwidth # spaces when inserting <tab> at start of line
set autoindent       " take indent for new line from previous line
set smartindent      " more intelligent indent for new lines

" Movement
"----------

" Typical backspace behavior (not default on windows or in terminal)
set backspace=indent,eol,start

set scrolloff=3           " minimum lines above/below cursor
set sidescrolloff=3       " minimum columns between cursor and edge

" Search
"--------

set gdefault               " add g flag to searches by default
set ignorecase smartcase   " case-insensitive unless search has uppercase letter
set incsearch              " show matches as you type
set hlsearch               " highlight search matches

" Folds
"-------

set nofoldenable           " start with all folds open
set foldmethod=indent
set foldtext=GetFoldText()

" Statusline
"------------

set laststatus=2                             " always show status line

set statusline=%1*\ %n         " buf nr (%1* = minwidth 1 & use User1 hi group)
set statusline+=%{SLModifiable()}            " indicate help files or nowriteable
set statusline+=\ %t\ %*                     " file name, then restore normal hi
set statusline+=%{ShortBranch()}             " git branch
set statusline+=\ %#SLWarn#%{SLModified()}%* " modified flag
set statusline+=\ %{IndentDisplay()}         " indent size & flag for tabs
set statusline+=%=                           " end of left side
set statusline+=\ \ \ %<%{ShPath(0)}         " shortened path
set statusline+=%6L,%v                       " total lines in file, cursor column

" Titlestring, tabline
"----------------------

" Show cwd in titlestring (windowed) and tabline (fullscreen)
set titlestring=%{ShPath(1)}
set tabline=%=%{ShPath(1)}\ 


" Files, sessions
"-----------------

set autoread                " auto-update when file is changed from the outside
set nowritebackup nobackup  " no backup file when overwriting something
set noswapfile              " no temp file to store changes since save

set sessionoptions=buffers,curdir,folds,resize,winsize

"------------------------------------------------------------------------------
" Custom maps, commands, abbreviations
"------------------------------------------------------------------------------

" Basics
"--------

let mapleader=' '

noremap ; :
noremap : ;

" Movement
"----------

" Go between splits using Ctrl + direction keys
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Easier keybinding for first non-whitespace char
nnoremap 0 ^
nnoremap ^ 0

" Navigate location list & quickfix
nnoremap <Leader>l :lnext<CR>
nnoremap <Leader>L :lprev<CR>
nnoremap <Leader>q :cnext<CR>
nnoremap <Leader>Q :cprev<CR>

" Jump to conflict markers
nnoremap <Leader>c /\(<<<<<<\\|======\\|>>>>>>\)<CR>

" Misc mappings
"---------------

" Clear search highlighting (Was bound to <Esc>, but had side effects)
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>

cabbrev hc helpclose

" Open netrw in vsplit
nnoremap <Leader>e :Vexplore<CR>
" Copy all to global register
noremap <C-a> exec '%y+'

" Commands
"----------

com! UseTabs call UseTabs()

" Change working dir to current file's dir
com! Current cd %:h

" Trim trailing spaces
com! Trail %s/\s\+$

com! PrettyJson %!python -m json.tool

"------------------------------------------------------------------------------
" Plugin config
"------------------------------------------------------------------------------

" CtrlP
"-------

let g:ctrlp_working_path_mode = 'rw'       " search within repo, or cwd
let g:ctrlp_open_multiple_files = '1vjr'   " open 1st in current window, rest hidden
let g:ctrlp_status_func = {'main': 'CtrlPStatus', 'prog': 'CtrlPProgress'}
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v(\.git|node_modules|libs|\.coverage-html|coverage|build|dist|gen|dist-.*)$',
  \ 'file': '\v\.(pyc|min.*|map|DS_Store)$'
\ }

" Quick shortcuts: find all, files, recent, buffers
nnoremap <Leader>fa :CtrlPMixed<CR>
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>
nnoremap <Leader>fb :CtrlPBuffer<CR>

" Enable CtrlPDelete plugin for deleting buffers
call ctrlp_bdelete#init()

" Fugitive
"----------

let g:fugitive_github_domains = ['https://gecgithub01.walmart.com']

" Gitv
"------

let g:Gitv_CommitStep = 30           " Less commits at a time to make it faster
let g:Gitv_WipeAllOnClose = 1        " Wipe buffers after use
let g:Gitv_DoNotMapCtrlKey = 1       " Don't set ctrl mappings

nnoremap <Leader>gk :Gitv --all<CR>

" Gutentags
"-----------

let g:gutentags_tagfile = '.tags'

" Javascript
"------------

let g:javascript_conceal_function = 'ƒ'

" Notes
"-------

let g:notes_directories = ['~/Notes']
let g:notes_suffix = '.md'
let g:notes_title_sync = 'change_title'
let g:notes_tab_indents = 0  " don't use tab to indent - it breaks autocomplete

" Sneak
"-------

let g:sneak#s_next = 1        " let 's' go to next match
let g:sneak#use_ic_scs = 1    " use ignorecaase/smartcase settings

" SuperTab
"-----------

let g:SuperTabMappingBackward = '<c-tab>'

" Syntastic
"-----------

let g:syntastic_mode_map = {
  \ 'mode': 'passive',
  \ 'active_filetypes': ['python', 'javascript', 'json', 'css', 'lua']
\ }
let g:syntastic_always_populate_loc_list = 1 " show errors in location list
let g:syntastic_auto_loc_list = 1            " automatically show/hide loc list
let g:syntastic_enable_balloons = 0          " no mouseover balloons
let g:syntastic_loc_list_height = 5
let g:syntastic_error_symbol = '»'
let g:syntastic_warning_symbol = '›'

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--quiet'   " only errors, no warnings

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--rcfile=/home/aisa/Projects/sjfnw/.pylintrc'
let g:syntastic_python_pep8_args = '--max-line-length=100'

let g:syntastic_css_checkers = ['csslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_lua_checkers = ['luac']

com! UpdateJavascriptCheckers call s:UpdateSyntasticJavascriptCheckers()

" Ultisnips
"-----------

let g:UltiSnipsExpandTrigger = '<s-tab>'
let g:UltiSnipsJumpForwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '~/.vim/custom-snippets'   " for :UltiSnipsEdit
let g:UltiSnipsSnippetDirectories = ['custom-snippets'] " don't include defaults


"------------------------------------------------------------------------------
" OS-specific
"------------------------------------------------------------------------------

if has("win32")
  set fileformats=unix,dos
else
  if &diff
    set shell=bash
  else
    set shell=bash\ -i
  endif
  if has("gui_macvim") || has('mac')
    cd flabs
  else
    cd sjfnw
  endif
endif

"------------------------------------------------------------------------------
" Debugging
"------------------------------------------------------------------------------

" Reload vimrc/gvimrc without losing working directory
nnoremap ;vr :call ReloadVimrc()<CR>

" Show highlight group for item at cursor
func! s:ShowHighlightGroup()
  let l:synid = synID(line('.'), col('.'), 1)
  let l:synname = synIDattr(l:synid, 'name')
  " what syn group is actually highlighting this item (follows links)
  let l:synlinked = synIDattr(synIDtrans(l:synid), 'name')
  " transparent item
  let l:syntrans = synIDattr(synIDtrans(synID(line('.'), col('.'), 0)), 'name')
  return 'name: ' . l:synname . ', hi: ' . l:synlinked . ', trans: ' . l:syntrans
endf
com! ShowHighlightGroup echo s:ShowHighlightGroup()

" Show test highlight page with current colors
com! TestHi :so $VIMRUNTIME/syntax/hitest.vim

"------------------------------------------------------------------------------
" Functions
"------------------------------------------------------------------------------

" Options
"---------

func! GetFoldText()
  let l:num_lines = v:foldend - v:foldstart + 1
  return (' ' . repeat('- ', 38) . l:num_lines)
endf

func! SLModified()
  return getbufvar('%', '&modified') ? '[+]' : ''
endf

func! SLModifiable()
  if getbufvar('%', 'current_syntax') == 'help'
    return ' [help]'
  endif
  return getbufvar('%', '&modifiable') ? '' : ' [-]'
endf

func! IndentDisplay()
  let l:width = &tabstop
  if (&expandtab == 'noexpandtab')
    let l:width .= 't'
  endif
  return l:width
endf

" Get rid of excess chars in default [Git(branch)] format
func! ShortBranch()
  if getbufvar('%', 'current_syntax') == 'help'
    return ''
  else
    let l:branch = fugitive#statusline()
    let l:branch = substitute(branch, '[Git', '', '')
    let l:branch = substitute(branch, ']', '', '')
    return l:branch
  endif
endf

" Shortened path. Defaults to path of current buffer, optionally use cwd instead
func! ShPath(use_cwd)
  let l:path = a:use_cwd ? getcwd() : expand('%:h')
  let l:path = substitute(path, $HOME, '~', '')
  let l:path = substitute(path, 'Projects', 'P', '')
  let l:path = substitute(path, 'flabs', 'f', '')
  let l:path = substitute(path, $VIMRUNTIME, 'VIMRUNTIME', '')
  return l:path
endf

" Commands
"----------

func! UseTabs()
  setlocal noexpandtab
  setlocal tabstop=4
  setlocal shiftwidth=4
  setlocal nolist
endf


" Reload vim configs and retain working directory
" Wrapped because otherwise it will try to redefine the function while it's being executed
if !exists('*ReloadVimrc')
  func ReloadVimrc()
    let l:cwd = getcwd()
    source ~/.vimrc
    source ~/.gvimrc
    exec 'cd ' .l:cwd
  endfunc
endif

" In progress - cleaner buffer list
func! BufferList()
  let l:bufs = {}
  for b in range(1, bufnr('$'))
    if buflisted(b)
      let l:name = bufname(b)
      let l:bufs[b] = {'name': fnamemodify(l:name, ':t'), 'full_name': l:name}
    endif
  endfor
  for k in keys(l:bufs)
    echom k . '  ' . l:bufs[k].name
  endfor
endfunc

" Base jump function based on Python_jump.
" Used to set jump shortcuts for specific file types. Example:
"   nnoremap <silent> <buffer> ]] :call Alpw_Jump('/=====\n\d\+\.', 'e')<CR>
func! Alpw_Jump(pattern, flags) range
  let l:count = v:count1        " if triggered with number in front
  let l:save = @/               " save last search pattern
  mark '                        " mark starting spot so you can go back
  while l:count > 0
    exe search(a:pattern, 'W' . a:flags)
    let l:count -= 1
  endwhile
  call histdel('/', -1)         " remove this from search history
  let @/ = l:save               " restore last search pattern
endf

" Set fallback jump if nothing language-specific is defined
func! Jump()
  nnoremap <silent> [[ :call Alpw_Jump('^\S', 'bW')<CR>
  nnoremap <silent> ]] :call Alpw_Jump('^\S', 'W')<CR>
endf

" Plugins
"---------

func! CtrlPStatus(focus, byfname, regex, prev, item, next, marked)
  let statustext = ' ' . a:item . '        ' . a:byfname
  let statustext .= '     ' . substitute(a:marked, '\(<\|>\)', '', 'g')
  if a:regex
    let statustext .= '        (regex)'
  endif
  return statustext . '%=%{getcwd()}'
endf

func! CtrlPProgress(str)
  return a:str . ' files scanned...'
endf

" Get checkers based on configs present in working directory
func! s:UpdateSyntasticJavascriptCheckers()
  echom "getting js checkers"
  let cwd = getcwd()
  let checkers = []
  if filereadable(cwd . '/.jshintrc')
    call add(checkers, 'jshint')
  endif
  if filereadable(cwd . '/.jscsrc')
    call add(checkers, 'jscs')
  endif
  if filereadable(cwd . '/.eslintrc')
    call add(checkers, 'eslint')
  elseif filereadable(cwd . '/.eslintrc-client')
    call add(checkers, 'eslint')
    let g:syntastic_javascript_eslint_args='--config .eslintrc-client'
  endif
  echom "checkers: " . join(checkers, ', ')
  let g:syntastic_javascript_checkers = checkers
endf
