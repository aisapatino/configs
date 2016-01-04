cd ~/Projects

"------------------------------------------------------------------------------
" Vim settings
"------------------------------------------------------------------------------

" General {{{1
"---------

if !has('gui')
  colorscheme aisadark           " gui scheme will be set in .gvimrc
endif
set t_Co=256                     " 256-color terminal

set vb t_vb=
set shell=bash                   " default to bash instead of sh for !commands
set lazyredraw                   " don't redraw during background/auto commands

set number                       " show line numbers
set relativenumber               " show line numbers relative to cursor
set colorcolumn=80               " vertical line to show where the 80th col is

set conceallevel=2               " by default allow conceal & conceal chars
set concealcursor=nc             " conceal in cursor line except in insert & visual

set wildmenu wildchar=<tab>      " autocomplete for commands
set showcmd                      " show commands as you type
set shortmess=ilmnxOI            " shorter messages, don't show intro screen

set formatoptions+=j             " remove comment chars when joining
set list                         " display things like tabs, spaces, eol, etc.
set listchars=trail:▫︎,tab:▷-,extends:›,precedes:‹
set fillchars=fold:\ ,diff:\ ,vert:\ 
set diffopt=filler,context:0,vertical,foldcolumn:1

" Indent & wrap {{{1
"---------------

set expandtab        " insert spaces instead of tabs
set tabstop=2        " how many columns wide a tab is visually
set shiftwidth=2     " how many columns to indent with >>
set autoindent       " take indent for new line from previous line

set nowrap                       " don't wrap lines by default
if exists('+breakindent')
  set breakindent                " maintain indent when wrapping
endif
set linebreak                    " only break between words when wrapping
set showbreak=↳                  " indicate start of wrapped lines

" Movement {{{1
"----------

" Typical backspace behavior (not default on windows or in terminal)
set backspace=indent,eol,start

set scrolloff=3           " minimum lines above/below cursor
set sidescrolloff=3       " minimum columns between cursor and edge

" Search {{{1
"--------

set gdefault               " default global (multiple matches per line)
set ignorecase             " case-insensitive search by default
set smartcase              " case-sensitive if pattern has uppercase letter
set incsearch              " show matches as you type
set hlsearch               " highlight search matches

" Folds {{{1
"-------

set nofoldenable           " start with all folds open
set foldmethod=indent
set foldtext=GetFoldText()

" Statusline {{{1
"------------

set laststatus=2                           " always show status line

set statusline=%1*                         " minwidth 1 & use User1 hi group
set statusline+=\ %{SL_file()}%*           " buffer number or special ft
set statusline+=\ %#SLWarn#%{SL_mod()}%*   " modified/nomodifiable flag
set statusline+=\ %{SL_branch_indent()}    " git branch, indentation
set statusline+=%=                         " end of left side
set statusline+=\ \ \ %<%{ShPath(0)}       " shortened path
set statusline+=\ %4L,%v                   " total lines in file, cursor column
set statusline+=\ \|\ %{winnr()}\          " window number

" Show cwd in titlestring
set titlestring=%{ShPath(1)}

" Files, sessions {{{1
"-----------------

set encoding=utf-8
set fileformats=unix
set wildignore+=*.pyc,.DS_Store
set sessionoptions-=blank,help,options,tabpages

set autoread                " auto-update when file is changed from the outside
set nowritebackup nobackup  " no backup file when overwriting something
set noswapfile              " no temp file to store changes since save

" Persist undo history even after buffer is unloaded
set undofile undodir=~/tmp/vim-undo
"}}}
set tags+=~/Drive/Notes/.tags

"------------------------------------------------------------------------------
" Plugins & runtime path
"------------------------------------------------------------------------------

" Custom syntax & ftplugins
set runtimepath+=~/.vim/custom-after/

" Plugins via vim-plug {{{1
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
Plug 'tpope/vim-vinegar'

Plug 'ludovicchabant/vim-gutentags'
Plug 'aisapatino/hex-highlight'
Plug 'tpope/vim-surround'
Plug 'jeetsukumaran/vim-indentwise'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-jade'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-markdown'
Plug 'aisapatino/vim-stylus'

call plug#end()

" Plugin config {{{1
"---------------

call ctrlp_bdelete#init()                  " enable plugin for deleting buffers

let g:ctrlp_working_path_mode = 'rw'       " search within repo/cwd (not current file's dir)
let g:ctrlp_show_hidden = 1                " show hidden files by default
let g:ctrlp_follow_symlinks = 1            " follow symlinks unless they loop
let g:ctrlp_switch_buffer = 0              " open buffer in current window even if it's open elsewhere
let g:ctrlp_reuse_window = 'netrw\|help'   " open in help or netrw windows (not qf)
let g:ctrlp_lazy_update = 50               " wait after typing to start search
let g:ctrlp_open_multiple_files = '1vjr'   " open 1st in current window, rest hidden
let g:ctrlp_status_func = {'main': 'CtrlPStatus', 'prog': 'CtrlPProgress'}
let g:ctrlp_extensions = ['tag']           " enable searching of tags
let g:ctrlp_custom_ignore = {
\  'dir': '\v(\.git|node_modules|libs|\.coverage-html|coverage|build|dist|dist-.*|gen)$',
\  'file': '\v\.(min.*|map|fugitiveblame)$'
\}

let g:fugitive_github_domains = ['https://gecgithub01.walmart.com']  " for :Gbrowse

let g:Gitv_CommitStep = 30           " less commits at a time, faster
let g:Gitv_WipeAllOnClose = 1        " wipe buffers after use
let g:Gitv_DoNotMapCtrlKey = 1       " don't set ctrl mappings
let g:Gitv_TruncateCommitSubjects = 1

let g:gutentags_tagfile = '.tags'

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

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_lua_checkers = ['luac']

let g:UltiSnipsExpandTrigger = '<s-tab>'
let g:UltiSnipsJumpForwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit = 'vertical'
let g:UltiSnipsSnippetsDir = '~/.vim/custom-snippets'   " for :UltiSnipsEdit
let g:UltiSnipsSnippetDirectories = ['custom-snippets'] " don't include defaults
"}}}

"------------------------------------------------------------------------------
" Custom maps, commands, abbreviations
"------------------------------------------------------------------------------

" Basics {{{1
"--------

let mapleader=' '

noremap ; :
noremap : ;

" Movement {{{1
"----------

" Navigate window splits
noremap <C-h> <C-w>h
noremap <C-l> <C-w>l
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Easier keybinding for first non-whitespace char
nnoremap 0 ^
nnoremap ^ 0

" Navigate location list & quickfix
nnoremap ]l :lnext<CR>
nnoremap [l :lprev<CR>
nnoremap ]q :cnext<CR>
nnoremap [q :cprev<CR>

" Jump to conflict markers
nnoremap <Leader>c /\(<<<<<<\\|======\\|>>>>>>\)<CR>

" File navigation {{{1
"-----------------

" Open netrw in vsplit
cabbrev ve Vexplore

" Quick shortcuts: find all, files, recent, buffers, tags
nnoremap <Leader>fa :CtrlPMixed<CR>
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>
nnoremap <Leader>b  :CtrlPBuffer<CR>
nnoremap <Leader>ft :CtrlPTag<CR>

" Easy access to ~/Drive/Notes md files
com! -nargs=? Note call Alpw_note(<q-args>)

" Misc {{{1
"------

cabbrev ag    Ag!
cabbrev blame Gblame
cabbrev hc    helpclose
cabbrev vres  vertical resize
cabbrev dg    diffget
cabbrev dp    diffput
cabbrev gk    Gitv --all

" Print working directory
nnoremap <Leader>p :pwd<CR>

" Clear search highlighting
nnoremap <silent> <Leader><Leader> :nohlsearch<CR>

" Copy all to global register
noremap <C-a> :%y+<CR>

" Change working dir to current file's dir
com! Current cd %:h

" Trim trailing spaces
com! Trail %s/\s\+$

com! PrettyJson %!python -m json.tool

com! DeleteAnsiCodes :%s/\e.\{-}m//c

" Command shortcuts for functions
com! UseTabs call UseTabs()
com! UpdateJavascriptCheckers call s:UpdateSyntasticJavascriptCheckers()

" Debugging {{{1
"-----------

" Reload vimrc/gvimrc without losing working directory
nnoremap <Leader>re :call ReloadVimrc()<CR>

com! ShowHighlightGroup echo s:ShowHighlightGroup()

" Show test highlight page with current colors
com! TestHi :source $VIMRUNTIME/syntax/hitest.vim
"}}}
"------------------------------------------------------------------------------
" Functions
"------------------------------------------------------------------------------

" Folds & statusline {{{1
"--------------------

func! GetFoldText()
  " Get fold text: text of next line, fold markers removed + fold line count
  let l:num_lines = v:foldend - v:foldstart + 1
  let l:line = substitute(getline(v:foldstart), '\({{{\|}}}\)\d\?', '', '')
  let l:pad_right = 75 - strlen(l:line)
  if l:pad_right % 2
    let l:line .= ' '
  endif
  let l:line .= repeat(' ⋅', l:pad_right/2)
  return l:line . printf('%4d', l:num_lines)
endf

func! s:expect_readonly(ft)
  " Return true if given filetype is expected to be readonly; else false
  return (a:ft == 'help') || (a:ft == 'netrw') || (a:ft == 'fugitiveblame')
endf

func! SL_file()
  " Return file identifier for status line.
  " Depending on filetype, may be buffer number, filetype, directory and/or filename.
  let l:ft = getbufvar('%', '&filetype')
  let l:result = s:expect_readonly(l:ft) ? '[' . l:ft . ']' : bufnr('%')
  let l:result .= ' '
  let l:result .= (l:ft == 'netrw') ? expand('%') : expand('%:t')
  return l:result
endf

func! SL_mod()
  " Return modified/nomodifiable indicator for statusline
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
  " Return indent level and branch name display for statusline
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

func! ShPath(use_cwd)
  " Return shortened path for current buffer or cwd.
  " Defaults to path of current buffer unless `use_cwd` is true
  if !a:use_cwd && (getbufvar('%', '&filetype') == 'netrw')
    return ''
  endif
  let l:path = a:use_cwd ? getcwd() : expand('%:h')
  let l:path = substitute(path, $HOME, '~', '')
  let l:path = substitute(path, 'Projects', 'P', '')
  let l:path = substitute(path, 'flabs', 'f', '')
  let l:path = substitute(path, $VIMRUNTIME, 'VIMRUNTIME', '')
  return l:path
endf

" Commands {{{1
"----------

func! UseTabs()
  setlocal noexpandtab
  setlocal nolist
endf

" Reload vim config(s) and retain working directory
" Wrapped because otherwise it will try to redefine the function while it's being executed
if !exists('*ReloadVimrc')
  func ReloadVimrc()
    let l:cwd = getcwd()
    source ~/.vimrc
    if has('gui') == 1
      source ~/.gvimrc
    endif
    exec 'cd ' . l:cwd
  endfunc
endif

" Base jump function based on Python_jump. Can be used for ft-specific jumps
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

" Set fallback jump if nothing language-specific is defined
" Maps [[ ]] to go to non-whitespace at col 0
func! Jump()
  nnoremap <silent> [[ :call Alpw_Jump('^\S', 'bW')<CR>
  nnoremap <silent> ]] :call Alpw_Jump('^\S', 'W')<CR>
endf

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
  exec "normal " . (79 - endpos) . "i "
endf
com! AlignRight call AlignRight()

" CtrlP {{{1
"---------

func! CtrlPStatus(focus, byfname, regex, prev, item, next, marked)
  let statustext = ' ' . a:item . '        ' . a:byfname
  let statustext .= '     ' . substitute(a:marked, '\(<\|>\|-\)', '', 'g')
  if a:regex
    let statustext .= '        (regex)'
  endif
  return statustext . '%=%{getcwd()}'
endf

func! CtrlPProgress(str)
  return a:str . ' files scanned...'
endf

" Syntastic {{{1
"-----------
" attempts to work with varying checkers/configs within a filetype

let s:cxo_base_path = '~/Projects/flabs/wm/cart-checkout/'
let s:eslint_locations = {
\  'atlas-common/infra/webpack/test': {
\    'checker': 'eslint',
\    'config': 'atlas-common/infra/webpack/node_modules/repo-standards/configs/lint/eslintrc.test-browser',
\    'exec': 'atlas-common/infra/webpack/node_modules/.bin/eslint'
\  },
\  'atlas-common/infra/webpack/lib/client': {
\    'checker': 'eslint',
\    'config': 'atlas-common/infra/webpack/node_modules/repo-standards/configs/lint/eslintrc.react',
\    'exec': 'atlas-common/infra/webpack/node_modules/.bin/eslint'
\  },
\  'atlas-common/infra/webpack': {
\    'checker': 'eslint',
\    'config': 'atlas-common/infra/webpack/node_modules/repo-standards/configs/lint/eslintrc.node',
\    'exec': 'atlas-common/infra/webpack/node_modules/.bin/eslint'
\  },
\  'webpack': {
\    'checker': 'eslint',
\    'config': 'webpack/.eslintrc-server',
\    'exec': 'webpack/node_modules/.bin/eslint'
\  },
\  'webpack/client': {
\    'checker': 'eslint',
\    'config': 'webpack/.eslintrc-client',
\    'exec': 'webpack/node_modules/.bin/eslint'
\  },
\  'webpack/test/client': {
\    'checker': 'eslint',
\    'config': 'webpack/.eslintrc-test-client',
\    'exec': 'webpack/node_modules/.bin/eslint'
\  },
\  'atlas-common/frontend': {
\    'checker': 'jshint',
\    'config': 'atlas-common/frontend/.jshintrc.json',
\    'exec': 'atlas-common/frontend/node_modules/grunt-contrib-jshint/node_modules/.bin/jshint'
\  }
\}

func! s:WMSetEslint()
  let l:filepath = expand('%:p')
  let l:match = ''
  for l:path in keys(s:eslint_locations)
    if (l:filepath =~ l:path) && (strlen(l:path) > strlen(l:match))
      let l:match = l:path
    endif
  endfor
  if l:match != ''
    let l:result = s:eslint_locations[l:match]
    echom l:result['config']
    let b:syntastic_javascript_checkers = [l:result['checker']]
    let l:cmd = "let b:syntastic_javascript_" . l:result['checker'] . "_args = '--config " . s:cxo_base_path . l:result['config'] . "'"
    echom l:cmd
    exec l:cmd
    let l:cmd = "let b:syntastic_javascript_" . l:result['checker'] . "_eslint_exec = '" . s:cxo_base_path . l:result['exec'] . "'"
    echom l:cmd
    exec l:cmd
    echom 'Config updated.'
  else
    echom 'no eslint match found'
  endif
endf
com! WMSetEslint call s:WMSetEslint()

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
    let b:syntastic_javascript_eslint_args='--config .eslintrc-client'
  endif
  echom 'checkers: ' . join(checkers, ', ')
  let b:syntastic_javascript_checkers = checkers
endf

let s:notes_dir = '~/Drive/Notes/'

" Edit an existing md file or create a new one
func! Alpw_note(title) abort
  if a:title == ''
    echoerr 'Filename required.'
  else
    execute 'edit ' . s:notes_dir . fnameescape(a:title) . '.md'
  endif
endfunction

" vim: foldenable foldmethod=marker
