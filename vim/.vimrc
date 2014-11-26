cd ~/Projects

"  Set up plugins with Vundle
" -----------------------------------------------------------------------------
set nocompatible
filetype off

set rtp+=~/.vim/custom-syntax/after/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" Main plugins
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'aisapatino/bufline'
Plugin 'tpope/vim-fugitive'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/syntastic'

" Occasional use
Plugin 'rking/ag.vim'
Plugin 'mattn/emmet-vim'
Plugin 'aisapatino/hex-highlight'
Plugin 'lambdalisue/vim-gista'

" Syntax highlighting for non-default languages
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on

"  Basics
" -----------------------------------------------------------------------------

" typical backspace behavior (not default on windows & terminal)
set backspace=indent,eol,start

" don't make error noises
set vb

"  Appearance
" -----------------------------------------------------------------------------

colorscheme aisadark      " overridden in .gvimrc
set t_Co=256              " 256-color if running in terminal

if &diff
  syntax off              " syntax hightlighting off when diffing
else
  syntax enable           " enable syntax, don't override colors
endif

set nowrap                " don't wrap lines by default
let &showbreak='・'       " indicate start of wrapped
set number                " show line numbers
set colorcolumn=80        " show where the 80-char line is
set scrolloff=3           " minimum lines above/below cursor
set shortmess=ilmnrxO     " shorter messages
set showcmd               " show commands in gutter as you type
set fillchars='vert:\|,fold:\ -,diff:\ -'

"  Search
" -----------------------------------------------------------------------------

set ignorecase      " case-insensitive search
set smartcase       " if uppercase letter, search case sensitive
set incsearch       " show matches as you type
set hlsearch        " highlight search matches

" escape to clear search highlighting
nnoremap <esc> :noh<return><esc>

"  Indentation
" -----------------------------------------------------------------------------

" These will be overridden by editorconfig as needed
set expandtab        " use spaces instead of tabs
set tabstop=2        " how many columns wide a tab is visually
set shiftwidth=2     " how many columns to indent with >>
set smarttab         " uses shiftwidth # spaces when inserting <tab>
set autoindent       " take indent for new line from previous line
set smartindent      " more intelligent indent for new lines

"  Folding
" -----------------------------------------------------------------------------

set foldmethod=indent
set nofoldenable           " start with all folds open
set foldtext=GetFoldText()
function! GetFoldText()
  let num_lines = v:foldend - v:foldstart + 1
  return (repeat("- ", 35) . num_lines . " lines")
endfunction

"  Status line, title
" -----------------------------------------------------------------------------

set laststatus=2                           " always show status line

set statusline=\ %n                        " buffer number
set statusline+=\ %t                       " file name
set statusline+=%{ShortBranch()}           " git branch
set statusline+=\ %#SLWarn#%m%*            " modified flag
set statusline+=\ %{IndentDisplay()}       " tab size & flag for tabs
set statusline+=%=                         " end of left side
set statusline+=\ \ \ %.35(%{ShPath()}%)   " shortened path
set statusline+=\ %5L,%v                   " total lines in file, cursor column

function! IndentDisplay()
  let display = &shiftwidth
  if (&expandtab == 'noexpandtab')
    let display = display . 't'
  endif
  return display
endfunction

function! ShPath()
  let path = expand('%:~:h')
  let path = substitute(path, 'Projects', 'P', '')
  let path = substitute(path, 'formidable', 'f', '')
  return path
endfunction

" Get rid of excess chars in default [Git(branch)] format
function! ShortBranch()
  let br = fugitive#statusline()
  let br = substitute(br, '[Git', ' ', '')
  let br = substitute(br, ']', '', '')
  return br
endfunction

" Set vim's title based on current session. Expects .vim filename
function! SessionTitle()
  return matchstr(v:this_session, '[a-zA-Z0-9]\+\(\.vim\)\@=')
endfunction
au SessionLoadPost * set titlestring=%{SessionTitle()}

"  Files, sessions
" -----------------------------------------------------------------------------

set autoread                " auto-update when file is changed from the outside
set nobackup                " don't create backup/swap files
set nowb
set noswapfile
set sessionoptions=buffers,folds,resize,winsize,curdir

" Store sessions in one place
nnoremap ;so :so ~/Projects/vim-sessions/
nnoremap ;mks :mks! ~/Projects/vim-sessions/

"  Diffs
" -----------------------------------------------------------------------------

set diffopt=filler,context:2,vertical,foldcolumn:1

"  Keybindings, shortcuts, custom functions
" -----------------------------------------------------------------------------

map ; :

"let mapleader="-"

" Go between splits using Ctrl + direction keys
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Go between location list items
map [l :lprev<Cr>
map ]l :lnext<Cr>

" list buffers
map <Leader>b :buffers<Cr>

" Cycle through buffers
"map <Leader>h :bp<Cr>
"map <Leader>l :bn<Cr>

" Search for conflict markers
map <Leader>g :Conflict<cr>n
command! Conflict /\(<<<<<<\|======\|>>>>>>\)

" Copy all to global register
map <C-a> :%y+<CR>

" Change working dir to current file's dir
command! Current execute "cd %:h"

command! Reload :so %

" Trim trailing spaces
command! Trail :%s/\s\+$
" Only trim full lines of spaces (for jade, which needs other trailing spaces)
command! LineTrail :%s/^\s\+$

" Convert file to unix
command! DosToUnix execute "update | e ++ff=dos | setlocal ff=unix | w"

" Fix django template style
command! DjangoTemplateStyle :%s/{{\(\S\)/{{\ \1/g|:%s/\(\S\)}}/\1\ }}/g

" Toggle tab-style indentation
command! UseTabs execute "set noexpandtab | set tabstop=4 | set shiftwidth=4 | set nosmarttab | 2match none | 2match WrongIndent /\ \ /"
command! UseSpaces execute "set expandtab | set tabstop=2 | set shiftwidth=2 | set smarttab | 2match none | 2match WrongIndent /\t/"

command! SpacesToTabs :%s/\ \ /\t/gc
command! SpacesToTabs4 :%s/\ \ \ \ /\t/gc

func! HtmlToJade()
  :%s/<\/\w\+>//gc
  :%s/<div\s//gc
  :%s/class="/\./gc
  :%s/id="/#/gc
  :%s/->/\./gc
  :%s/<//gc
  :%s/>$//gc
  :%s/>/\ /gc
  :%s/a\s/a(/gc
  :%s/\n\n/\r/gc
endfunc

command! HtmlToJade exec HtmlToJade()


"  Plugin config
" -----------------------------------------------------------------------------

" BufLine

let g:bufline_modified_sign='+'

" CtrlP

let g:ctrlp_show_hidden = 1               " show hidden files
let g:ctrlp_custom_ignore = {'dir': '\v(\.git|node_modules)$', 'file': '\.pyc$'}
let g:ctrlp_open_multiple_files = '1vjr'  " open 1st in cur window, rest hidden

nnoremap ;fa :CtrlPMixed<Cr>
nnoremap ;ff :CtrlP<Cr>
nnoremap ;fr :CtrlPMRU<Cr>
nnoremap ;fb :CtrlPBuffer<Cr>

" Emmet

let g:user_emmet_leader_key='<Leader>'
let g:user_emmet_mode='a'

" Gista

let g:gista#github_user='aisapatino'
let g:gista#close_list_after_open=1          " hide list after opening one
let g:gista#update_on_write=1                " update with :w

command! Gistl :Gista --list

" HexHighlight
command! Highlight exec "call HexHighlight()"

" SuperTab

let g:SuperTabMappingBackward = '<c-tab>'

" Syntastic

let g:syntastic_mode_map = {'mode': 'passive', 'active_filetypes': ['javascript']}
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_lua_checkers = ['luac']
let g:syntastic_python_checkers = ['pylint']

let g:syntastic_always_populate_loc_list = 1 " show errors in location list
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_balloons = 0          " don't do mouseover balloons
let g:syntastic_auto_loc_list = 1            " automatically show/hide loc list
let g:syntastic_error_symbol = '»'
let g:syntastic_warning_symbol = '›'

" Ultisnips

let g:UltiSnipsExpandTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<s-tab>'
let g:UltiSnipsSnippetsDir='~/.vim/custom-snippets'   " dir for :UltiSnipsEdit
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=['custom-snippets'] " don't include default dir

"  Language-specific
" -----------------------------------------------------------------------------

au BufRead,BufNewFile *.md set filetype=markdown
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
  endfunc
augroup END

"  OS-specific
" -----------------------------------------------------------------------------

if has("win32")
  let g:EasyGrepFileAssociations = "C:\\Users\\aisa\\vimfiles\\bundle\\CustomGrepFileAssoc.vim"
  set fileformats=unix,dos
else
  set shell=bash\ -i
  let g:EasyGrepCommand = 1      " use :grep instead of :vimgrep
  let g:EasyGrepFileAssociations = "/Users/aisa/.vim/CustomGrepFileAssoc"
  if has("gui_macvim") || has('mac')
    cd formidable
  endif
endif

"  Debugging
" -----------------------------------------------------------------------------
"set verbose=9
"set verbosefile=~/.vim/vimlog.vim

" Show highlight group for item at cursor
function! ShowHighlightGroup()
  let l:synid = synID(line('.'), col('.'), 1)
  let l:synname = synIDattr(l:synid, 'name')
  " what syn group is actually highlighting this item (follows links)
  let l:synlinked = synIDattr(synIDtrans(l:synid), 'name')
  " transparent item
  let l:syntrans = synIDattr(synIDtrans(synID(line('.'), col('.'), 0)), 'name')
  
  return 'hi<' . l:synname . '> linked<' . l:synlinked . '> transparent<' .  l:syntrans . '>'
endfunction

command! ShowHighlightGroup echo ShowHighlightGroup()

