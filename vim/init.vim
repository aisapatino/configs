cd ~/Projects

" Vim settings
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
set listchars=trail:▫︎,tab:▷-,extends:›,precedes:‹
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
set foldtext=GetFoldText()

"- Statusline, tabline, title
"-----------------------------

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
com! PrettyJson %!python -m json.tool

" command shortcuts for functions
com! UpdateTags           call s:UpdateTags()
com! UseTabs              call s:UseTabs()
com! -nargs=? SetTabTitle call s:SetTabTitle(<q-args>)
com! -nargs=? Note        call Alpw_Note(<q-args>)

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
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'

if has('nvim')
  Plug 'neomake/neomake'
else
  Plug 'scrooloose/syntastic'
endif

Plug 'junegunn/gv.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'aisapatino/hex-highlight'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'shime/vim-livedown'

Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'aisapatino/vim-markdown'
Plug 'aisapatino/vim-stylus'
Plug 'nikvdp/ejs-syntax'

call plug#end()

"- Plugin config
"----------------

cabbrev ag Ack!
let g:ackprg = 'ag --hidden --vimgrep'
let g:ackhighlight = 1

let g:ctrlp_extensions = ['tag']           " enable searching of tags
let g:ctrlp_follow_symlinks = 1            " follow symlinks unless they loop
let g:ctrlp_open_multiple_files = '1vjr'   " open 1st in current window, rest hidden
let g:ctrlp_reuse_window = 'netrw\|help'   " open in help or netrw windows (not qf)
let g:ctrlp_show_hidden = 1                " show hidden files by default
let g:ctrlp_switch_buffer = 0              " open buffer in current window even if it's open elsewhere
let g:ctrlp_tilde_homedir = 1              " save mru paths with ~ for $HOME
let g:ctrlp_status_func = {'main': 'CtrlPStatus', 'prog': 'CtrlPProgress'}
let g:ctrlp_custom_ignore = {
\  'dir': '\v(\.git|node_modules|libs|\.coverage-html|coverage|build|dist|dist-.*|gen)$',
\  'file': '\v\.(min.*|map|fugitiveblame)$'
\}
" replace F-key binding, which doesn't work well on mac keyboard
let g:ctrlp_prompt_mappings = { 'PrtDeleteEnt()':  ['<c-@>'] }

" quick shortcuts: find all, files, recent, buffers, tags
nnoremap <Leader>fa :CtrlPMixed<CR>
nnoremap <Leader>ff :CtrlP<CR>
nnoremap <Leader>fr :CtrlPMRU<CR>
nnoremap <Leader>b  :CtrlPBuffer<CR>
nnoremap <Leader>ft :CtrlPTag<CR>

cabbrev gk    GV --format=%cd\ %h%d\ %s

let g:javascript_conceal_function = 'ƒ'
let g:javascript_plugin_jsdoc = 1

let g:jsx_ext_required = 0              " support jsx syntax in .js files

let g:livedown_browser = "'/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome'"

let g:SuperTabMappingBackward = '<c-tab>'

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

func! s:ExpectReadonly(ft)
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
  let l:result = s:ExpectReadonly(l:ft) ? '[' . l:ft . ']' : bufnr('%')
  let l:result .= ' '
  let l:result .= (l:ft == 'netrw') ? s:ShortPath(getbufvar('%', 'netrw_curdir')) : expand('%:t')
  return l:result
endf

func! SL_mod()
  " return modified/nomodifiable indicator for statusline
  if s:ExpectReadonly(getbufvar('%', '&filetype'))
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
  if s:ExpectReadonly(getbufvar('%', '&filetype'))
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
  " skip for netrw since it displays path in file spot
  if getbufvar('%', '&filetype') == 'netrw'
    return ''
  endif
  return s:ShortPath(expand('%:h'))
endf

"- Tabline
"----------

func! Alpw_Tabline()
  " tab numbers/titles on left, cwd on right
  let s = ''
  if tabpagenr('$') > 1
    for i in range(1, tabpagenr('$'))
      let s .= i == tabpagenr() ? '%#TabLineSel#' : '%#TabLine#'
      let s .= ' ' . i . ' '
      if exists('g:tabtitle_' . i)
        let s .= ' ' . eval('g:tabtitle_' . i)
      endif
      let s .= ' '
    endfor
    let s .= '%#TabLineFill#'
  endif
  let s .= '%=%#StatusLineNC#cwd: %*%{Alpw_CWD()} '
  return s
endf

func! s:SetTabTitle(title) abort
  " set global variable used by Alpw_Tabline to display current tab's title
  let g:['tabtitle_' . tabpagenr()] = a:title
endfunc

"- Misc utility
"---------------

function! s:UpdateTags()
  exec ':!ctags ' . getcwd()
endfunction

if !exists('*ReloadVimrc')
  " reload vim config(s) and retain working directory
  " wrapped to avoid trying to redefine function as it's being executed
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

func! Alpw_Note(title) abort
  " browse notes dir, edit existing file or create a new one
  if a:title == ''
    Vexplore ~/Drive/Notes
  else
    exec 'edit ' . s:notes_dir . fnameescape(a:title) . '.md'
  endif
endf

func! Alpw_Jump(pattern, flags) range
  " base jump function based on Python_jump. can be used for ft-specific jumps
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

func! s:ShowHighlightGroup()
  " show highlight group for item at cursor
  let l:id = synID(line('.'), col('.'), 1)
  let l:name = synIDattr(l:id, 'name')
  " follow links to get syn group that is actually highlighting this item
  let l:linked = synIDattr(synIDtrans(l:id), 'name')
  " transparent item
  let l:trans = synIDattr(synIDtrans(synID(line('.'), col('.'), 0)), 'name')
  return 'name: ' . l:name . ', hi: ' . l:linked . ', trans: ' . l:trans
endf

"- Modify settings/mappings
"---------------------------

func! s:UseTabs()
  setlocal noexpandtab
  setlocal nolist
endf

func! Alpw_SetJump(pattern)
  " set basic jump mappings - useful if nothing language-specific is defined
  " maps [[ ]] to go to non-whitespace at col 0
  let b:jump_pattern = a:pattern
  nnoremap <Leader>k :call Alpw_Jump(b:jump_pattern, 'bW')<CR>
  nnoremap <Leader>j :call Alpw_Jump(b:jump_pattern, 'W')<CR>
endf

"- Plugins
"---------

func! CtrlPStatus(focus, byfname, regex, prev, item, next, marked)
  " sets statusline in ctrlp window - see help for g:ctrlp_status_func
  let statustext = ' ' . a:item . '        ' . a:byfname
  let statustext .= '     ' . substitute(a:marked, '\(<\|>\|-\)', '', 'g')
  if a:regex
    let statustext .= '     (regex)'
  endif
  return statustext . '%=%{Alpw_CWD()}'
endf

func! CtrlPProgress(str)
  return a:str . ' files scanned...'
endf
