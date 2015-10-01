cd ~/Projects

"------------------------------------------------------------------------------
" Plugins & runtime path
"------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')          " vim-plug for managing plugins

Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
Plug 'aisapatino/hex-highlight'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-vinegar'
Plug 'ludovicchabant/vim-gutentags'

" Languages
" ---------
Plug 'pangloss/vim-javascript'             " required for jsx plugin
Plug 'mxw/vim-jsx'
Plug 'mustache/vim-mustache-handlebars'
Plug 'sheerun/vim-json'
Plug 'digitaltoad/vim-jade'
Plug 'groenewege/vim-less'

" Seldom-used
" -----------
Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'tpope/vim-surround', { 'on': 'PlugSurround' }

call plug#end()

" Load built-in plugin matchit.vim, if a newer version isn't already installed
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) != ''
  runtime! macros/matchit.vim
endif

" Load custom syntax overrides
set rtp+=~/.vim/custom-syntax/after/

"------------------------------------------------------------------------------
" Basic display & behavior
"------------------------------------------------------------------------------

set encoding=utf-8

colorscheme aisadark             " overridden in .gvimrc
set t_Co=256                     " 256-color if running in terminal

set lazyredraw                   " don't redraw during background/auto commands

" disable error noises/flashes
set vb t_vb=

set wildmenu wildchar=<tab>      " autocomplete for commands
set showcmd                      " show commands as you type
set shortmess=ilmnrxOI           " shorter messages

set nowrap                       " don't wrap lines by default
set linebreak                    " when wrapping, only at word breaks
set showbreak=↳                  " indicate start of wrapped lines
set number                       " show line numbers
set colorcolumn=80               " show where the 80-char line is
set formatoptions+=j             " remove comment char(s) when joining

set diffopt=filler,context:2,vertical,foldcolumn:1
set listchars=trail:⨯,extends:›,precedes:‹,tab:▷⎯
set list

"------------------------------------------------------------------------------
" Keybinding
"------------------------------------------------------------------------------

let mapleader=','

noremap ; :
noremap : ;

"------------------------------------------------------------------------------
" Indentation
"------------------------------------------------------------------------------

set expandtab        " use spaces instead of tabs
set tabstop=2        " how many columns wide a tab is visually
set shiftwidth=2     " how many columns to indent with >>
set smarttab         " use shiftwidth # spaces when inserting <tab>
set autoindent       " take indent for new line from previous line
set smartindent      " more intelligent indent for new lines

func! UseTabs()
  setlocal noexpandtab
  setlocal tabstop=4
  setlocal shiftwidth=4
  setlocal nolist
endf

com! UseTabs :call UseTabs()

"------------------------------------------------------------------------------
" Movement
"------------------------------------------------------------------------------

" Typical backspace behavior (not default on windows & terminal)
set backspace=indent,eol,start

set scrolloff=3           " minimum lines above/below cursor
set sidescrolloff=3       " minimum columns between cursor and edge

" Go between location list items
nmap [l ;lprev<Cr>
nmap ]l ;lnext<Cr>

" Fallback jump if nothing language-specific is defined
func! Jump()
  nmap <silent> [[ ;call search('^\S', 'bW')<Cr>
  nmap <silent> ]] ;call search('^\S', 'W')<Cr>
endf
com! Jump ;call Jump()
"------------------------------------------------------------------------------
" Search
"------------------------------------------------------------------------------

set ignorecase smartcase   " case-insensitive unless search has uppercase letter
set incsearch              " show matches as you type
set hlsearch               " highlight search matches

" Clear search highlighting (Was bound to <Esc>, but had side effects)
map <Leader><Leader> ;noh<return>

"------------------------------------------------------------------------------
" Folds
"------------------------------------------------------------------------------

set foldmethod=indent
set nofoldenable           " start with all folds open
set foldtext=GetFoldText()
func! GetFoldText()
  let num_lines = v:foldend - v:foldstart + 1
  return (' ' . repeat('- ', 38) . num_lines)
endf
set fillchars=fold:\ 

"------------------------------------------------------------------------------
" Statusline, titlestring
"------------------------------------------------------------------------------

set laststatus=2                             " always show status line

set statusline=%1*\ %n         " buf nr (%1* = minwidth 1 & use User1 hi group)
set statusline+=%{SLModifiable()}            " flag if not writeable
set statusline+=\ %t\ %*                     " file name, then restore normal hi
set statusline+=%{ShortBranch()}             " git branch
set statusline+=\ %#SLWarn#%{SLModified()}%* " modified flag
set statusline+=\ %{IndentDisplay()}         " indent size & flag for tabs
set statusline+=%=                           " end of left side
set statusline+=\ \ \ %<%{ShPath(0)}         " shortened path
set statusline+=%6L,%v                       " total lines in file, cursor column

func! SLModified()
  return getbufvar('%', '&modified') ? '[+]' : ''
endf

func! SLModifiable()
  return getbufvar('%', '&modifiable') ? '' : ' [-]'
endf

func! IndentDisplay()
  let display = &shiftwidth
  if (&expandtab == 'noexpandtab')
    let display = display . 't'
  endif
  return display
endf

" Get rid of excess chars in default [Git(branch)] format
func! ShortBranch()
  let branch = fugitive#statusline()
  let branch = substitute(branch, '[Git', '', '')
  let branch = substitute(branch, ']', '', '')
  return branch
endf

" Shortened path. Defaults to path of current buffer, optionally use cwd instead
func! ShPath(cwd)
  let path = a:cwd ? getcwd() : expand('%:h')
  let path = substitute(path, $HOME, '~', '')
  let path = substitute(path, 'Projects', 'P', '')
  let path = substitute(path, 'flabs', 'f', '')
  return path
endf

" Set titlestring to cwd (it will auto update)
set titlestring=%{ShPath(1)}
" Set tabline (for fullscreen/terminal)
set tabline=%=%{ShPath(1)}\ 

"------------------------------------------------------------------------------
" Files, sessions
"------------------------------------------------------------------------------

set autoread                " auto-update when file is changed from the outside

set nowritebackup nobackup  " don't create backup file when overwriting something
set noswapfile              " no temp files that store changes since save

set sessionoptions=buffers,curdir,folds,resize,winsize

" Store sessions in one place
nnoremap ;so :so ~/Projects/vim-sessions/
nnoremap ;mks :mks! ~/Projects/vim-sessions/

" Set vim's title based on current session. Expects .vim filename
func! SessionTitle()
  return matchstr(v:this_session, '[a-zA-Z0-9]\+\(\.vim\)\@=')
endf
au SessionLoadPost * set titlestring=%{SessionTitle()}

"------------------------------------------------------------------------------
" Custom keybindings & commands
"------------------------------------------------------------------------------

" Open netrw in vsplit
nmap ;ex ;Vexplore<CR>

" Go between splits using Ctrl + direction keys
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Search for conflict markers
map <Leader>g /\(<<<<<<\\|======\\|>>>>>>\)<Cr>

" Copy all to global register
map <C-a> exec '%y+'

" Change working dir to current file's dir
com! Current cd %:h

" Reload vim configs
com! Reload so ~/.vimrc|so ~/.gvimrc

" Trim trailing spaces
com! Trail %s/\s\+$

com! PrettyJson %!python -m json.tool

func! BufferList()
  let msg = ''
  for b in range(1, bufnr('$'))
    let l:name = bufname(b)
    let msg .= b . '  ' . fnamemodify(l:name, ':t') . '     ' . l:name . "\n"
  endfor
  echo msg
endfunc

nmap tt ;echo strftime(' %b %d %H:%M')<Cr>

"------------------------------------------------------------------------------
" Plugin config
"------------------------------------------------------------------------------

" CtrlP
"-------
let g:ctrlp_working_path_mode = 'rw'       " search within repo, or cwd
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v(\.git|node_modules|libs|\.coverage-html|coverage|build|dist|gen|dist-.*)$',
  \ 'file': '\v\.(pyc|min.*|map|DS_Store)$'
\ }
let g:ctrlp_show_hidden = 1               " show hidden files
let g:ctrlp_open_multiple_files = '1vjr'  " open 1st in current window, rest hidden
let g:ctrlp_status_func = {'main': 'CtrlPStatus', 'prog': 'CtrlPProgress'}

func! CtrlPStatus(focus, byfname, regex, prev, item, next, marked)
  let statustext = '  ' . a:byfname
  if a:regex
    let statustext .= ' (regex)'
  endif
  let statustext .= '        ' . a:item . '%=%{getcwd()}'

  return statustext
endf

func! CtrlPProgress(str)
  return a:str . ' files scanned...'
endf

" Quick shortcuts: find all, files, recent, buffers
nnoremap ;fa :CtrlPMixed<Cr>
nnoremap ;ff :CtrlP<Cr>
nnoremap ;fr :CtrlPMRU<Cr>
nnoremap ;fb :CtrlPBuffer<Cr>

" Gitv
"------
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1

nmap gv ;Gitv --all<Cr>

" Gutentags
"-----------

let g:gutentags_tagfile = '.tags'

" Sneak
"------
let g:sneak#s_next = 1

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
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_balloons = 0          " don't do mouseover balloons
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
com! UpdateJavascriptCheckers call s:UpdateSyntasticJavascriptCheckers()

" Ultisnips
"-----------
let g:UltiSnipsExpandTrigger = '<s-tab>'
let g:UltiSnipsJumpForwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '~/.vim/custom-snippets'   " when using :UltiSnipsEdit
let g:UltiSnipsSnippetDirectories = ['custom-snippets'] " don't include defaults

"------------------------------------------------------------------------------
" Language/filetype-specific autocommands
"------------------------------------------------------------------------------

au FileType git setlocal nonumber
au BufRead,BufNewFile *.md set filetype=markdown | setlocal wrap | setlocal nolist
au BufRead,BufNewFile *.json set filetype=json | setlocal wrap

" better htmldjango detection
augroup filetypedetect
  " remove current htmldjango detection located at $VIMRUNTIME/filetype.vim
  au! BufNewFile,BufRead *.html
  au  BufNewFile,BufRead *.html call s:DetectDjangoTemplate()
  " check for django template tag in first ten lines
  func! s:DetectDjangoTemplate()
    for n in range(10, line('$') - 1)
      if getline(n) =~ '{%\|{{\|{#'
        setfiletype htmldjango
        break
      endif
    endfor
    setfiletype html
  endf
augroup END

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

" Show highlight group for item at cursor
func! s:ShowHighlightGroup()
  let l:synid = synID(line('.'), col('.'), 1)
  let l:synname = synIDattr(l:synid, 'name')

  " what syn group is actually highlighting this item (follows links)
  let l:synlinked = synIDattr(synIDtrans(l:synid), 'name')

  " transparent item
  let l:syntrans = synIDattr(synIDtrans(synID(line('.'), col('.'), 0)), 'name')

  return 'name<' . l:synname . '> hi<' . l:synlinked . '> trans<' . l:syntrans . '>'
endf
com! ShowHighlightGroup echo s:ShowHighlightGroup()

" Enable this to get verbose vim logs (troubleshooting a plugin/setting)
"set verbose=9
"set verbosefile=~/.vim/vimlog.vim
