cd ~/Projects

" Vim settings
"------------------------------------------------------------------------------

"- General
"----------

set t_Co=256                   " 256-color terminal
if !has('gui_running')
  colorscheme aisadark         " gui scheme will be set in .gvimrc
endif

set vb t_vb=                   " don't beep or flash on error
set shell=bash                 " default to bash instead of sh for !commands
set lazyredraw                 " don't redraw during background/auto commands

set number                     " show line numbers
set relativenumber             " show line numbers relative to cursor
set colorcolumn=80             " vertical line to show where the 80th col is

set conceallevel=2             " by default allow conceal & conceal chars
set concealcursor=nc           " conceal in cursor line too, in normal or cmd

set wildmenu wildchar=<tab>    " autocomplete for commands
set showcmd                    " show commands as you type
set shortmess=ilmnxOI          " shorter messages, don't show intro screen

set formatoptions+=j           " remove comment chars when joining
set list                       " display things like tabs, spaces, eol, etc.
set listchars=trail:▫︎,tab:▷-,extends:›,precedes:‹
set fillchars=fold:\ ,diff:\ ,vert:\ 
set diffopt=filler,context:3,vertical,foldcolumn:0

"- Indent & wrap
"----------------

set expandtab                  " insert spaces instead of tabs
set tabstop=2                  " how many columns wide a tab is visually
set shiftwidth=2               " how many columns to indent with >>
set autoindent                 " take indent for new line from previous line

set nowrap                     " don't wrap lines by default
if exists('+breakindent')
  set breakindent              " maintain indent when wrapping
endif
set linebreak                  " only break between words when wrapping
set showbreak=↳                " indicate start of wrapped lines

"- Movement
"-----------

" typical backspace behavior (not default on windows or in terminal)
set backspace=indent,eol,start
set scrolloff=3                " minimum lines above/below cursor
set sidescrolloff=3            " minimum columns between cursor and edge

"- Search
"---------

set gdefault                   " default global (multiple matches per line)
set ignorecase                 " case-insensitive search by default
set smartcase                  " case-sensitive if pattern has uppercase letter
set incsearch                  " show matches as you type
set hlsearch                   " highlight search matches

"- Folds
"--------

set nofoldenable               " start with all folds open
set foldmethod=indent
set foldtext=GetFoldText()

"- Statusline, tabline, title
"-----------------------------

set laststatus=2                           " always show status line

set statusline=%1*                         " use User1 highlight group
set statusline+=\ %{SL_file()}%*           " buffer number or special ft
set statusline+=\ %#SLWarn#%{SL_mod()}%*   " modified/nomodifiable flag
set statusline+=\ %{SL_branch_indent()}    " git branch, indentation
set statusline+=%=                         " end of left side
set statusline+=\ \ \ %<%{SL_dir()}        " short-format path relative to cwd
set statusline+=\ %4L,%v                   " total lines in file, cursor column

set showtabline=2                          " always show tabline
set tabline=%!Alpw_Tabline()

set titlestring=%{Alpw_CWD()}              " show cwd in titlestring

"- Files, sessions
"------------------

set encoding=utf-8
set fileformats=unix
set wildignore+=*.pyc,.DS_Store
set sessionoptions-=blank,help,options,tabpages

set autoread                " auto-update when file is changed from the outside
set nowritebackup nobackup  " no backup file when overwriting something
set noswapfile              " no temp file to store changes since save

" always include tags from Notes
set tags+=~/Drive/Notes/.tags

"- Netrw
"--------

let g:netrw_timefmt = '%Y %b %d %H:%M'

" Custom maps, commands, abbreviations
"------------------------------------------------------------------------------

"- Basics
"---------

let mapleader = ' '

noremap ; :
noremap : ;

"- Movement
"-----------

" navigate window splits with less keypresses
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

nnoremap <Leader>t :tabnext<CR>
cabbrev tc tabclose

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

"- File navigation
"------------------

" open netrw in vsplit
cabbrev ve Vexplore

" easy access to ~/Drive/Notes md files
com! -nargs=? Note call Alpw_note(<q-args>)

"- Misc
"-------

cabbrev hc    helpclose
cabbrev vres  vertical resize
cabbrev dt    diffthis
cabbrev dg    diffget
cabbrev dp    diffput
cabbrev doff  diffoff

" clear search highlighting
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>

" copy all to global register
noremap <C-a> :%y+<CR>

" change working dir to current file's dir
com! Current cd %:h

" trim trailing spaces
com! Trail %s/\s\+$

com! PrettyJson %!python -m json.tool

com! DeleteAnsiCodes :%s/\e.\{-}m//

" command shortcuts for functions
com! AlignRight       call AlignRight()
com! UpdateJSCheckers call s:UpdateSyntasticJavascriptCheckers()
com! UseTabs          call UseTabs()
com! WMSetEslint      call s:WMSetEslint()
com! ListWindows      call ListWindows()

"- Debugging
"------------

" go to help for word under cursor
nnoremap gh :call Alpw_SearchHelp()<CR>

" reload vimrc/gvimrc without losing working directory
nnoremap <Leader>re :call ReloadVimrc()<CR>

com! ShowHighlightGroup echo s:ShowHighlightGroup()

" show test highlight page with current colors
com! TestHi :source $VIMRUNTIME/syntax/hitest.vim

" Plugins & runtime path
"------------------------------------------------------------------------------

" custom syntax & ftplugins
set runtimepath+=~/.vim/custom-after/

"- Plugins via vim-plug
"-----------------------

call plug#begin('~/.vim/plugged')

Plug 'aisapatino/ctrlp.vim'
Plug 'ervandew/supertab'
Plug 'sirver/ultisnips'
Plug 'scrooloose/syntastic'
Plug 'rking/ag.vim'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-vinegar'

Plug 'aisapatino/hex-highlight'
Plug 'tpope/vim-surround'
Plug 'jeetsukumaran/vim-indentwise'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-jade'
Plug 'mustache/vim-mustache-handlebars'
Plug 'aisapatino/vim-markdown'
Plug 'aisapatino/vim-stylus'

call plug#end()

"- Plugin config
"----------------

cabbrev ag Ag!

let g:ctrlp_extensions = ['tag']           " enable searching of tags
let g:ctrlp_follow_symlinks = 1            " follow symlinks unless they loop
let g:ctrlp_open_multiple_files = '1vjr'   " open 1st in current window, rest hidden
let g:ctrlp_reuse_window = 'netrw\|help'   " open in help or netrw windows (not qf)
let g:ctrlp_show_hidden = 1                " show hidden files by default
let g:ctrlp_switch_buffer = 0              " open buffer in current window even if it's open elsewhere
let g:ctrlp_tilde_homedir = 1              " save mru paths with ~ for $HOME
let g:ctrlp_working_path_mode = 'rw'       " search within repo/cwd (not current file's dir)
let g:ctrlp_status_func = {'main': 'CtrlPStatus', 'prog': 'CtrlPProgress'}
let g:ctrlp_custom_ignore = {
\  'dir': '\v(\.git|node_modules|libs|\.coverage-html|coverage|build|dist|dist-.*|gen)$',
\  'file': '\v\.(min.*|map|fugitiveblame)$'
\}
" replace F-key binding, which doesn't work well on mac keyboard
let g:ctrlp_prompt_mappings = {
\  'PrtDeleteEnt()':  ['<c-@>']
\}

" quick shortcuts: find all, files, recent, buffers, tags
nnoremap <Leader>fa :CtrlPMixed<CR>
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>
nnoremap <Leader>b  :CtrlPBuffer<CR>
nnoremap <Leader>ft :CtrlPTag<CR>

let g:fugitive_github_domains = ['https://gecgithub01.walmart.com']  " for :Gbrowse

cabbrev blame Gblame
cabbrev gs    Gstatus
cabbrev gf    Gfetch
cabbrev gk    GV

let g:javascript_conceal_function = 'ƒ'

let g:SuperTabMappingBackward = '<c-tab>'

let g:syntastic_always_populate_loc_list = 1 " show errors in location list
let g:syntastic_auto_loc_list = 1            " automatically show/hide loc list
let g:syntastic_enable_balloons = 0          " no mouseover balloons
let g:syntastic_enable_highlighting = 0      " no ~~~ under errors
let g:syntastic_check_on_wq = 0              " ignore save check when quitting
let g:syntastic_cursor_column = 0            " perf: only echo first err on line
let g:syntastic_loc_list_height = 5          " keep location list short
let g:syntastic_error_symbol = '»'
let g:syntastic_warning_symbol = '›'
let g:syntastic_debug_file = '~/.syntastic.log'
" let g:syntastic_debug = 3

let g:syntastic_mode_map = {
\ 'mode': 'active',
\ 'passive_filetypes': ['html']
\}

let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_args = '--rcfile=~/Projects/personal/sjfnw/.pylintrc'

" let g:syntastic_javascript_exec = './node_modules/.bin/eslint'
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_lua_checkers = ['luac']

let g:UltiSnipsExpandTrigger = '<s-tab>'
let g:UltiSnipsJumpForwardTrigger = '<s-tab>'
let g:UltiSnipsJumpBackwardTrigger = '<c-tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '~/.vim/custom-snippets'   " for :UltiSnipsEdit
let g:UltiSnipsSnippetDirectories = ['custom-snippets'] " don't include defaults

" Functions
"------------------------------------------------------------------------------

"- Helpers
"----------

func! s:expect_readonly(ft)
  " return true if given filetype is expected to be readonly; else false
  return (a:ft == 'help') || (a:ft == 'netrw') || (a:ft == 'fugitiveblame')
endf

func! s:ShortPath(p)
  let l:path = substitute(a:p, $HOME, '~', '')
  let l:path = substitute(l:path, 'Projects', 'P', '')
  let l:path = substitute(l:path, $VIMRUNTIME, 'VIMRUNTIME', '')
  return l:path
endf

func! Alpw_CWD()
  " get shortened format CWD
  return s:ShortPath(getcwd())
endf

"- Folds & statusline
"---------------------

func! GetFoldText()
  " get fold text: text of next line + fold line count
  let l:num_lines = v:foldend - v:foldstart + 1
  let l:line = getline(v:foldstart)
  let l:pad_right = 75 - strlen(l:line)
  if l:pad_right % 2
    let l:line .= ' '
  endif
  let l:line .= repeat(' ⋅', l:pad_right/2)
  return l:line . printf('%4d', l:num_lines)
endf

func! SL_file()
  " return file identifier for status line
  " depending on filetype, may be buffer number, filetype, directory and/or filename
  let l:ft = getbufvar('%', '&filetype')
  let l:result = s:expect_readonly(l:ft) ? '[' . l:ft . ']' : bufnr('%')
  let l:result .= ' '
  let l:result .= (l:ft == 'netrw') ? s:ShortPath(getbufvar('%', 'netrw_curdir')) : expand('%:t')
  return l:result
endf

func! SL_mod()
  " return modified/nomodifiable indicator for statusline
  if s:expect_readonly(getbufvar('%', '&filetype'))
    return ''
  elseif getbufvar('%', '&modified')
    return '[+]'
  elseif getbufvar('%', '&modifiable') == 0
    return '[-]'
  endif
  return ''
endf

func! SL_branch_indent()
  " return indent level and branch name display for statusline
  if s:expect_readonly(getbufvar('%', '&filetype'))
    return ''
  endif

  let l:branch = fugitive#statusline()
  let l:branch = substitute(branch, '[Git', '', '')
  let l:branch = substitute(branch, ']', '', '')

  let l:width = &tabstop
  if (&expandtab == 'noexpandtab')
    let l:width .= 't'
  elseif l:width == 2
    let l:width = ''
  endif

  return l:branch . ' ' . l:width
endf

func! SL_dir()
  " return shortened path for current buffer
  " skip netrw since it displays path in file spot
  if getbufvar('%', '&filetype') == 'netrw'
    return ''
  endif
  return s:ShortPath(expand('%:h'))
endf

"- Tabline
"----------

func! Alpw_Tabline()
  " tab numbers on left, cwd on right
  let s = ''
  if tabpagenr('$') > 1
    for i in range(1, tabpagenr('$'))
      if i == tabpagenr()
        let s .= '%#TabLineSel#'
      else
        let s .= '%#TabLine#'
      endif
      let s .= ' ' . i . ' '
    endfor
    let s .= '%#TabLineFill#'
  endif
  let s .= '%=%#StatusLineNC#cwd: %*%{Alpw_CWD()} '
  return s
endf

"- Misc utility
"---------------

" reload vim config(s) and retain working directory
" wrapped to avoid trying to redefine function as it's being executed
if !exists('*ReloadVimrc')
  func ReloadVimrc()
    let l:cwd = getcwd()
    source ~/.vimrc
    if has('gui_running') == 1
      source ~/.gvimrc
    endif
    exec 'cd ' . l:cwd
  endfunc
endif

let s:notes_dir = '~/Drive/Notes/'

" browse notes dir, edit existing file or create a new one
func! Alpw_note(title) abort
  if a:title == ''
    Vexplore ~/Drive/Notes
  else
    exec 'edit ' . s:notes_dir . fnameescape(a:title) . '.md'
  endif
endf

" base jump function based on Python_jump. can be used for ft-specific jumps
func! Alpw_Jump(pattern, flags) range
  let l:count = v:count1        " if triggered with number in front
  let l:save = @/               " save last search pattern for restoring later
  mark '                        " mark starting spot so you can go back
  while l:count > 0
    exe search(a:pattern, a:flags)
    let l:count -= 1
  endw
  call histdel('/', -1)         " remove this from search history
  let @/ = l:save               " restore last search pattern
endf

" show highlight group for item at cursor
func! s:ShowHighlightGroup()
  let l:id = synID(line('.'), col('.'), 1)
  let l:name = synIDattr(l:id, 'name')
  " follow links to get syn group that is actually highlighting this item
  let l:linked = synIDattr(synIDtrans(l:id), 'name')
  " transparent item
  let l:trans = synIDattr(synIDtrans(synID(line('.'), col('.'), 0)), 'name')
  return 'name: ' . l:name . ', hi: ' . l:linked . ', trans: ' . l:trans
endf

" align the right-most word of current line against 80-char column
func! AlignRight() abort
  let line = getline('.')
  let startpos = match(line, '\S\+$')
  if startpos == -1
    echom 'No match found'
    return
  endif
  let endpos = matchend(line, '\S\+$')
  if endpos >= 79
    echom 'Text found at max column'
    return
  endif
  echom startpos . ', ' . endpos
  call cursor(0, startpos)
  exec 'normal ' . (79 - endpos) . 'i '
endf

" list windows with corresponding buffer number & file
" (for buggy cases where you need to :close a window)
func! ListWindows()
  echom 'Window    Buffer'
  for wi in range(1, winnr('$'))
    let l:buf = winbufnr(wi)
    echom wi . '         ' . l:buf . '  ' . bufname(l:buf)
  endfor
endf

func! Alpw_SearchHelp()
  exec "help " . expand('<cWORD>')
endf

"- Modify settings/mappings
"---------------------------

func! UseTabs()
  setlocal noexpandtab
  setlocal nolist
endf

" set basic jump mappings - useful if nothing language-specific is defined
" maps [[ ]] to go to non-whitespace at col 0
func! Jump()
  nnoremap [[ :call Alpw_Jump('^\S', 'bW')<CR>
  nnoremap ]] :call Alpw_Jump('^\S', 'W')<CR>
endf

"- CtrlP
"--------

" see help for g:ctrlp_status_func
func! CtrlPStatus(focus, byfname, regex, prev, item, next, marked)
  let statustext = ' ' . a:item . '        ' . a:byfname
  let statustext .= '     ' . substitute(a:marked, '\(<\|>\|-\)', '', 'g')
  if a:regex
    let statustext .= '     (regex)'
  endif
  return statustext . '%=%{getcwd()}'
endf

func! CtrlPProgress(str)
  return a:str . ' files scanned...'
endf

"- Syntastic
"------------

" get checkers based on configs present in working directory
func! s:UpdateSyntasticJavascriptCheckers()
  echom "getting js checkers"
  let cwd = getcwd()
  let checkers = []
  if filereadable(cwd . '/.eslintrc')
    call add(checkers, 'eslint')
    let b:syntastic_javascript_eslint_exec = cwd . '/node_modules/.bin/eslint'
    echom 'syntastic_javascript_eslint_exec: ' . b:syntastic_javascript_eslint_exec
  elseif filereadable(cwd . '/.eslintrc-client')
    call add(checkers, 'eslint')
    let b:syntastic_javascript_eslint_args = '--config .eslintrc-client'
  endif
  echom 'checkers: ' . join(checkers, ', ')
  let b:syntastic_javascript_checkers = checkers
endf
