cd ~/Projects

"------------------------------------------------------------------------------
" Plugins (managed by Vundle)
" -----------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/custom-syntax/after/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" Main plugins
"--------------

Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'aisapatino/bufline'
Plugin 'tpope/vim-fugitive'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'

" Occasional use
"----------------

Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'aisapatino/hex-highlight'

" Syntax highlighting
"---------------------

Plugin 'digitaltoad/vim-jade'
Plugin 'groenewege/vim-less'

call vundle#end()
filetype plugin indent on

"------------------------------------------------------------------------------
" Basics
"------------------------------------------------------------------------------

" typical backspace behavior (not default on windows & terminal)
set backspace=indent,eol,start

" don't make error noises/flashing
set vb t_vb=

"------------------------------------------------------------------------------
" Appearance
"------------------------------------------------------------------------------

colorscheme aisadark      " overridden in .gvimrc
set t_Co=256              " 256-color if running in terminal

if &diff
  syntax off              " syntax hightlighting off when diffing
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
set fillchars=fold:\ ,vert:\

"------------------------------------------------------------------------------
" Search
"-----------------------------------------------------------------------------

set ignorecase      " case-insensitive search
set smartcase       " if uppercase letter, search case sensitive
set incsearch       " show matches as you type
set hlsearch        " highlight search matches

" escape to clear search highlighting
nnoremap <esc> :noh<return><esc>

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
  return (repeat("- ", 36) . num_lines . " lines")
endfunction

"------------------------------------------------------------------------------
" Status line
"------------------------------------------------------------------------------

set laststatus=2                           " always show status line

set statusline=%1*\ %n     " buffer number (%1* = midwidth 1, use User1 hi group)
set statusline+=\ %t\ %*                   " file name (then restore normal hi)
set statusline+=%{ShortBranch()}           " git branch
set statusline+=\ %#SLWarn#%m%*            " modified flag
set statusline+=\ %{IndentDisplay()}       " tab size & flag for tabs
set statusline+=%=                         " end of left side
set statusline+=\ \ \ %<%{ShPath()}        " shortened path
set statusline+=\ %5L,%v                   " total lines in file, cursor column

func! IndentDisplay()
  let display = &shiftwidth
  if (&expandtab == 'noexpandtab')
    let display = display . 't'
  endif
  return display
endf

func! ShPath()
  let path = expand('%')
  let path = substitute(path, '\/Users\/aisa', '~', '')
  let path = substitute(path, 'Projects', 'P', '')
  let path = substitute(path, 'formidable', 'f', '')
  return path
endf

" Get rid of excess chars in default [Git(branch)] format
func! ShortBranch()
  let br = fugitive#statusline()
  let br = substitute(br, '[Git', '', '')
  let br = substitute(br, ']', '', '')
  return br
endf

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

" TODO this causes vim to open in terminal with 95;c in commandline
map ; :

let mapleader=','

" Go between splits using Ctrl + direction keys
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Go between location list items
map [l :lprev<Cr>
map ]l :lnext<Cr>

" List buffers
map <Leader>b :buffers<Cr>

" Search for conflict markers
map <Leader>g :Conflict<cr>
com! Conflict /\(<<<<<<\|======\|>>>>>>\)

" Copy all to global register
map <C-a> :%y+<CR>

" Change working dir to current file's dir
com! Current exec "cd %:h"

com! Reload exec 'so ~/.vimrc | so ~/.gvimrc'

" Trim trailing spaces
com! Trail :%s/\s\+$

" Only trim full lines of spaces (for jade, which needs other trailing spaces)
com! LineTrail :%s/^\s\+$

com! PrettyJson :%!python -m json.tool

"------------------------------------------------------------------------------
" Plugin config
"------------------------------------------------------------------------------

" CtrlP
"-------

let g:ctrlp_show_hidden = 1               " show hidden files
let g:ctrlp_custom_ignore = {'dir': '\v(\.git|node_modules|\.coverage-html|coverage)$', 'file': '\.pyc$'}
let g:ctrlp_open_multiple_files = '1vjr'  " open 1st in cur window, rest hidden
let g:ctrlp_status_func = {'main': 'CtrlPStatus'}

func! CtrlPStatus(focus, byfname, regex, prev, item, next, marked)
  let statustext = '  ' . a:byfname
  if a:regex
    let statustext .= ' (regex)'
  endif
  let statustext .= '        ' . a:item . '%=%{getcwd()}'

  return statustext
endf

nnoremap ;fa :CtrlPMixed<Cr>
nnoremap ;ff :CtrlP<Cr>
nnoremap ;fr :CtrlPMRU<Cr>
nnoremap ;fb :CtrlPBuffer<Cr>

" HexHighlight TODO move to plugin
"-------------

com! Highlight exec "call HexHighlight()"

" SuperTab
"-----------

let g:SuperTabMappingBackward = '<c-tab>'

" Syntastic
"-----------

"let g:syntastic_debug = 3
let g:syntastic_mode_map = { 'mode': 'active' }
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--load-plugins pylint_django --rcfile=/home/aisa/Projects/sjfnw/.pylintrc'
let g:syntastic_python_pep8_args = '--max-line-length=100'
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_lua_checkers = ['luac']

let g:syntastic_always_populate_loc_list = 1 " show errors in location list
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_balloons = 0          " don't do mouseover balloons
let g:syntastic_auto_loc_list = 1            " automatically show/hide loc list
let g:syntastic_error_symbol = '»'
let g:syntastic_warning_symbol = '›'

func! UpdateSyntasticJavascriptCheckers()
  " get checkers based on configs present in working directory
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
  endif
  let g:syntastic_javascript_checkers = checkers
endf

com! UpdateJavascriptCheckers exec "call UpdateSyntasticJavascriptCheckers()"

" Ultisnips
"-----------

let g:UltiSnipsExpandTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<s-tab>'
let g:UltiSnipsSnippetsDir='~/.vim/custom-snippets'   " dir for :UltiSnipsEdit
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['custom-snippets'] " don't include default dir

"------------------------------------------------------------------------------
" Language-specific
"------------------------------------------------------------------------------

au BufRead,BufNewFile *.md set filetype=markdown | setlocal wrap
au BufRead,BufNewFile *.json set filetype=json

" better htmldjango detection
augroup filetypedetect
  " removes current htmldjango detection located at $VIMRUNTIME/filetype.vim
  au! BufNewFile,BufRead *.html
  au  BufNewFile,BufRead *.html call FThtml()

  func! FThtml()
    set colorcolumn=100
    let n = 1
    while n < 10 && n < line("$")
      if getline(n) =~ '\<DTD\s\+XHTML\s'
        setf xhtml
        return
      endif
      if getline(n) =~ '{%\|{{\|{#'
        setf htmldjango
        return
      endif
      let n = n + 1
    endwhile
    setf html
  endf
augroup END

"------------------------------------------------------------------------------
" OS-specific
"------------------------------------------------------------------------------

if has("win32")
  set fileformats=unix,dos
else
  set shell=bash\ -i
  if has("gui_macvim") || has('mac')
    cd formidable
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
"   set verbose=9
"   set verbosefile=~/.vim/vimlog.vim
