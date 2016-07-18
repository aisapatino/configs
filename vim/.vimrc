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

" persist undo history even after buffer is unloaded
set undofile undodir=~/tmp/vim-undo

" always include tags from cwd and Notes
set tags+=./.tags,~/Drive/Notes/.tags
set cpoptions+=d  " make ./ in tags option relative to cwd, not current file

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

"- Movement/navigation
"----------------------

" navigate window splits with less keypresses
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
cabbrev dup   diffup
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
com! AlignRight           call s:AlignRight()
com! UpdateJSCheckers     call s:UpdateSyntasticJavascriptCheckers()
com! UseArchetypeEslint   call s:UseArchetypeEslint()
com! UseTabs              call s:UseTabs()
com! WMSetEslint          call s:WMSetEslint()
com! -nargs=? SetTabTitle call s:SetTabTitle(<q-args>)
com! -nargs=? Note        call Alpw_note(<q-args>)

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
Plug 'shime/vim-livedown'

Plug 'pangloss/vim-javascript', {'branch': 'develop'}
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'
Plug 'digitaltoad/vim-jade'
Plug 'mustache/vim-mustache-handlebars'
Plug 'aisapatino/vim-markdown'
Plug 'aisapatino/vim-stylus'

Plug 'altercation/vim-colors-solarized'

call plug#end()

"- Plugin config
"----------------

let g:ag_highlight = 1                     " highlight matches in qf & windows
cabbrev ag Ag!

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
cabbrev gk    GV --format=%cd\ %h%d\ %s

let g:javascript_conceal_function = 'ƒ'
let g:javascript_plugin_jsdoc = 1

let g:livedown_browser = "'/Applications/Google\\ Chrome.app/Contents/MacOS/Google\\ Chrome'"

let g:SuperTabMappingBackward = '<c-tab>'

cabbrev syc  SyntasticCheck
cabbrev syre SyntasticReset
cabbrev syt  SyntasticToggle
cabbrev syi  SyntasticInfo

let g:syntastic_always_populate_loc_list = 1 " show errors in location list
let g:syntastic_auto_loc_list = 1            " automatically show/hide loc list
let g:syntastic_enable_balloons = 0          " no mouseover balloons
let g:syntastic_enable_highlighting = 0      " no ~~~ under errors
let g:syntastic_check_on_wq = 0              " ignore save check when quitting
let g:syntastic_cursor_column = 0            " perf: only echo first err on line
let g:syntastic_loc_list_height = 5          " keep location list short
let g:syntastic_error_symbol = '»'
let g:syntastic_warning_symbol = '›'
let g:syntastic_mode_map = {
\ 'mode': 'active',
\ 'passive_filetypes': ['html']
\}
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_lua_checkers = ['luac']
let g:syntastic_python_checkers = ['prospector']
"let g:syntastic_python_prospector_args = '--profile=/Users/aisa/Projects/personal/sjfnw/.landscape.yml'

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

func! Alpw_note(title) abort
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

func! s:AlignRight() abort
  " align the right-most word of current line against 80-char column
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

func! Alpw_SearchHelp()
  exec "help " . expand('<cword>')
endf

"- Modify settings/mappings
"---------------------------

func! s:UseTabs()
  setlocal noexpandtab
  setlocal nolist
endf

func! Alpw_SetJump(pattern)
  let b:jump_pattern = a:pattern
  " set basic jump mappings - useful if nothing language-specific is defined
  " maps [[ ]] to go to non-whitespace at col 0
  nnoremap <Leader>k :call Alpw_Jump(b:jump_pattern, 'bW')<CR>
  nnoremap <Leader>j :call Alpw_Jump(b:jump_pattern, 'W')<CR>
endf

"- Plugins
"---------

func! CtrlPStatus(focus, byfname, regex, prev, item, next, marked)
  " see help for g:ctrlp_status_func
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

func! s:UpdateSyntasticJavascriptCheckers()
  " get checkers based on configs present in working directory
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


" Syntastic
"au BufReadPost *.js,*.jsx call s:SetupSyntastic()
func! s:SetupSyntastic()
  if !exists('b:git_dir')
    echom "no git dir"
  else
    echom 'git_dir: ' . b:git_dir
  endif
endf

" Use archetype-compatible eslint checking for cwd
func! s:UseArchetypeEslint()
  echom 'Setting up eslint config for buffer; checking for archetype'

  let cwd = getcwd()
  let mid_path = cwd . '/node_modules/@walmart/'
  let arch_node =  'electrode-archetype-njs-module-dev'
  let arch_hapi =  'electrode-archetype-hapi-plugin-dev'
  let arch_react_app =  'electrode-archetype-react-app'

  if isdirectory(mid_path . arch_node)

    let g:syntastic_javascript_eslint_exec = cwd . '/node_modules/.bin/eslint'

    let conf_path = '--config ' . mid_path . arch_node . '/config/eslint/'

    if match(expand('%:'), '^test') > -1
      let b:syntastic_javascript_eslint_args = conf_path . '.eslintrc-test'
    else
      let b:syntastic_javascript_eslint_args = conf_path . '.eslintrc-node'
    endif
    echom 'updated: ' . b:syntastic_javascript_eslint_args
  else
    echom arch_node . ' not found. make sure cwd is root of repo'
  endif
endf

func! s:GetColors()
  let s:pattern = '#\(\x\x\x\)\{1,2}'
  let colors = {}
  for i in range(0, line('$'))
    let line = getline(i)
    let match_count = 1 " start by checking for 1st match
    let match = matchstr(line, s:pattern, 0, match_count)

    while match != ''
      let l:match_name = match

      if has_key(colors, match)
        " mark color done
        let colors[match] += 1
      else
        let colors[match] = 1
      endif

      let match_count += 1
      let match = matchstr(line, s:pattern, 0, match_count)
    endwhile
  endfor
  for key in keys(colors)
    echo key . '    ' . colors[key]
  endfor
endf

com! GetColors call s:GetColors()

func! s:FormatJS()
  :%s/{\(.\+\)/{\r\1/e
  :%s/\([^ ]\+\s*\)}/\1\r}/e
  :%s/\[\s*{/[\r{/e
  :%s/}\s*\]/}\r]/e
  :%s/\s\+$/e
  exec 'normal gg=G'
endf
