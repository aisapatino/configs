cd ~/Projects

" Custom syntax overrides
set rtp+=~/.vim/custom-syntax/after/

"------------------------------------------------------------------------------
" Plugins (managed by vim-plug)
"------------------------------------------------------------------------------

call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/syntastic'
Plug 'editorconfig/editorconfig-vim'
Plug 'rking/ag.vim'
Plug 'aisapatino/hex-highlight'

Plug 'justinmk/vim-sneak'

" Languages
" ---------

Plug 'pangloss/vim-javascript'             " required for jsx plugin
Plug 'mustache/vim-mustache-handlebars'    " doesn't work well loaded on demand
Plug 'digitaltoad/vim-jade', { 'for': 'jade' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'mxw/vim-jsx', { 'for': 'jsx' }

" Seldom-used
" -----------

Plug 'gregsexton/gitv', { 'on': 'Gitv' }
Plug 'tpope/vim-surround', { 'on': 'PlugSurround' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

call plug#end()

"------------------------------------------------------------------------------
" Basics
"------------------------------------------------------------------------------

" don't redraw when executing background/auto commands
set lazyredraw

" typical backspace behavior (not default on windows & terminal)
set backspace=indent,eol,start

" don't make error noises/flashing
set vb t_vb=

" hit tab to show options in command mode
set wildchar=<tab>
set wildmenu

"------------------------------------------------------------------------------
" Appearance
"------------------------------------------------------------------------------

colorscheme aisadark      " overridden in .gvimrc
set t_Co=256              " 256-color if running in terminal

if &diff
  syntax off              " syntax highlighting off when diffing
else
  syntax enable           " enable syntax, don't override colors
endif

set nowrap                " don't wrap lines by default
set linebreak             " when wrapping, only at word breaks
set showbreak=>           " indicate start of wrapped (doesn't work due to NonText hi)
set number                " show line numbers
set colorcolumn=80        " show where the 80-char line is
set scrolloff=3           " minimum lines above/below cursor
set shortmess=ilmnrxO     " shorter messages
set showcmd               " show commands in gutter as you type
set fillchars=fold:\ ,vert:\|
set listchars=trail:@,extends:>,precedes:<,tab:>-

"------------------------------------------------------------------------------
" Search
"-----------------------------------------------------------------------------

set ignorecase      " case-insensitive search
set smartcase       " if uppercase letter, search case sensitive
set incsearch       " show matches as you type
set hlsearch        " highlight search matches

"------------------------------------------------------------------------------
" Indentation
"------------------------------------------------------------------------------

" These may be overridden by editorconfig as needed

set expandtab        " use spaces instead of tabs
set tabstop=2        " how many columns wide a tab is visually
set shiftwidth=2     " how many columns to indent with >>
set smarttab         " uses shiftwidth # spaces when inserting <tab>
set autoindent       " take indent for new line from previous line
set smartindent      " more intelligent indent for new lines

"------------------------------------------------------------------------------
" Folding
"------------------------------------------------------------------------------

set foldmethod=indent
set nofoldenable           " start with all folds open
set foldtext=GetFoldText()
function! GetFoldText()
  let num_lines = v:foldend - v:foldstart + 1
  return (' ' . repeat('- ', 38) . num_lines)
endfunction

"------------------------------------------------------------------------------
" Statusline and titlestring
"------------------------------------------------------------------------------

set laststatus=2                             " always show status line

set statusline=%1*\ %n         " buf nr (%1* = minwidth 1 & use User1 hi group)
set statusline+=%{SLModifiable()}            " flag if not writeable
set statusline+=\ %t\ %*                     " file name (then restore normal hi)
set statusline+=%{ShortBranch()}             " git branch
set statusline+=\ %#SLWarn#%{SLModified()}%* " modified flag
set statusline+=\ %{IndentDisplay()}         " tab size & flag for tabs
set statusline+=%=                           " end of left side
set statusline+=\ \ \ %<%{ShPath(0)}         " shortened path
set statusline+=%6L,%v                       " total lines in file, cursor column

func! SLModified()
  if getbufvar('%', '&modified')
    return '[+]'
  else
    return ''
  endif
endf

func! SLModifiable()
  if !getbufvar('%', '&modifiable')
    return ' [-]'
  else
    return ''
  endif
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
  let br = fugitive#statusline()
  let br = substitute(br, '[Git', '', '')
  let br = substitute(br, ']', '', '')
  return br
endf

" Shortened path. Defaults to path of current buffer, optionally use cwd instead
func! ShPath(cwd)
  if a:cwd
    let path = getcwd()
  else
    let path = expand('%:h')
  endif
  let path = substitute(path, $HOME, '~', '')
  let path = substitute(path, 'Projects', 'P', '')
  let path = substitute(path, 'flabs', 'f', '')
  return path
endf

" Set titlestring to cwd (it will auto update)
set titlestring=%{ShPath(1)}

"------------------------------------------------------------------------------
" Files, sessions
"------------------------------------------------------------------------------

set autoread                " auto-update when file is changed from the outside
set nobackup                " don't create backup/swap files
set nowb
set noswapfile
set sessionoptions=buffers,folds,resize,winsize,curdir

" Store sessions in one place
nnoremap ;so :so ~/Projects/vim-sessions/
nnoremap ;mks :mks! ~/Projects/vim-sessions/

" Set vim's title based on current session. Expects .vim filename
func! SessionTitle()
  return matchstr(v:this_session, '[a-zA-Z0-9]\+\(\.vim\)\@=')
endf
au SessionLoadPost * set titlestring=%{SessionTitle()}

"------------------------------------------------------------------------------
" Diffs
"------------------------------------------------------------------------------

set diffopt=filler,context:2,vertical,foldcolumn:1

"------------------------------------------------------------------------------
" Keybindings, shortcuts, custom functions
"------------------------------------------------------------------------------

let mapleader=','
noremap ; :
noremap : ;

" Clear search highlighting (Rebinding esc had side effects)
map <Leader><Leader> ;noh<return>

" Go between splits using Ctrl + direction keys
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Go between location list items
map [l ;lprev<Cr>
map ]l ;lnext<Cr>

" Search for conflict markers
com! Conflict /\(<<<<<<\|======\|>>>>>>\)
map <Leader>g ;Conflict<Cr>

" Copy all to global register
map <C-a> exec '%y+'

" Change working dir to current file's dir
com! Current exec 'cd %:h'

" Reload vim configs
com! Reload exec 'so ~/.vimrc | so ~/.gvimrc'

" Trim trailing spaces
com! Trail exec '%s/\s\+$'

com! PrettyJson exec '%!python -m json.tool'

func! BufferList()
  let msg = ''
  for b in range(1, bufnr('$'))
    let l:name = bufname(b)
    let msg .= b . '  ' . fnamemodify(l:name, ':t') . '     ' . l:name . "\n"
  endfor
  echo msg
endfunc

"------------------------------------------------------------------------------
" Plugin config
"------------------------------------------------------------------------------

" Gitv
"------

let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1

nmap gv ;Gitv --all<Cr>

" CtrlP
"-------

let g:ctrlp_working_path_mode = 'w'       " search from cwd
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v(\.git|node_modules|\.coverage-html|coverage)$',
  \ 'file': '\.pyc$'
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

" quick shortcuts: find all, files, recent, buffers
nnoremap ;fa :CtrlPMixed<Cr>
nnoremap ;ff :CtrlP<Cr>
nnoremap ;fr :CtrlPMRU<Cr>
nnoremap ;fb :CtrlPBuffer<Cr>

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

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_args = '--quiet'   " only errors, no warnings

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--load-plugins pylint_django --rcfile=/home/aisa/Projects/sjfnw/.pylintrc'
let g:syntastic_python_pep8_args = '--max-line-length=100'

let g:syntastic_css_checkers = ['csslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_lua_checkers = ['luac']

let g:syntastic_always_populate_loc_list = 1 " show errors in location list
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_balloons = 0          " don't do mouseover balloons
let g:syntastic_auto_loc_list = 1            " automatically show/hide loc list
let g:syntastic_error_symbol = '»'
let g:syntastic_warning_symbol = '›'

" get checkers based on configs present in working directory
func! UpdateSyntasticJavascriptCheckers()
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
"  elseif filereadable(cwd . '/.eslintrc-base')
"    call add(checkers, 'eslint')
"    echom "configuring to use .eslintrc-client"
"    let g:syntastic_javascript_eslint_args = '--ext .js,.jsx -c .eslintrc-client'
  endif
  echom "checkers: " . join(checkers, ', ')
  let g:syntastic_javascript_checkers = checkers
endf

com! UpdateJavascriptCheckers exec "call UpdateSyntasticJavascriptCheckers()"

" Ultisnips
"-----------

let g:UltiSnipsExpandTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<s-tab>'
let g:UltiSnipsSnippetsDir='~/.vim/custom-snippets'   " dir for :UltiSnipsEdit
let g:UltiSnipsEditSplit='vertical'
let g:UltiSnipsSnippetDirectories=['custom-snippets'] " don't include default dir

"------------------------------------------------------------------------------
" Language-specific
"------------------------------------------------------------------------------

au FileType git setlocal nonumber
au BufRead,BufNewFile *.md set filetype=markdown | setlocal wrap
au BufRead,BufNewFile *.json set filetype=json

" better htmldjango detection
augroup filetypedetect
  " removes current htmldjango detection located at $VIMRUNTIME/filetype.vim
  au! BufNewFile,BufRead *.html
  au  BufNewFile,BufRead *.html call s:DetectDjangoTemplate()

  " check for django template tag in first ten lines
  func! s:DetectDjangoTemplate()
    let n = 1
    while n < 10 && n < line('$')
      if getline(n) =~ '{%\|{{\|{#'
        set ft=htmldjango
        return
      endif
      let n = n + 1
    endwhile
    setf html
  endfunc
augroup END

"------------------------------------------------------------------------------
" OS-specific
"------------------------------------------------------------------------------

if has("win32")
  set fileformats=unix,dos
else
  set shell=bash\ -i
  if has("gui_macvim") || has('mac')
    cd flabs
  endif
endif

"------------------------------------------------------------------------------
" Debugging
"------------------------------------------------------------------------------

" Show highlight group for item at cursor
func! ShowHighlightGroup()
  let l:synid = synID(line('.'), col('.'), 1)
  let l:synname = synIDattr(l:synid, 'name')

  " what syn group is actually highlighting this item (follows links)
  let l:synlinked = synIDattr(synIDtrans(l:synid), 'name')

  " transparent item
  let l:syntrans = synIDattr(synIDtrans(synID(line('.'), col('.'), 0)), 'name')

  return 'name<'.l:synname.'> hi<'.l:synlinked.'> trans<'. l:syntrans.'>'
endf

com! ShowHighlightGroup echo ShowHighlightGroup()

" Enable this to get verbose vim logs (troubleshooting a plugin/setting)
"set verbose=9
"set verbosefile=~/.vim/vimlog.vim
