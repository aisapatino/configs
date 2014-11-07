cd ~\Projects

" Set up plugins with Vundle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off                  " will change once vundle is done

set rtp+=~/.vim/custom-syntax/after/
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle (required)
Plugin 'gmarik/Vundle.vim'

" Main plugins
Plugin 'kien/ctrlp.vim'
Plugin 'ervandew/supertab'
Plugin 'SirVer/ultisnips'
Plugin 'vim-scripts/BufLine'
Plugin 'tpope/vim-fugitive'
Plugin 'editorconfig/editorconfig-vim'

" Occassionally used for replace all within directory
Plugin 'dkprice/vim-easygrep'
" Used when working with html
"Plugin 'mattn/emmet-vim'
" Working on themes/css
Plugin 'vim-scripts/hexHighlight.vim'
Plugin 'lambdalisue/vim-gista'

" Linting
Plugin 'scrooloose/syntastic'

" Syntax highlighting for non-default languages
Plugin 'digitaltoad/vim-jade'
Plugin 'wavded/vim-stylus'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()
filetype plugin indent on

" OS-specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("win32")
  set guifont=Consolas:h12
  set backspace=indent,eol,start
  let g:EasyGrepFileAssociations = "C:\\Users\\aisa\\vimfiles\\bundle\\CustomGrepFileAssoc.vim"
  set fileformats=unix,dos
else
  set shell=bash\ -i
  let g:EasyGrepCommand = 1      " use :grep instead of :vimgrep
  if has("gui_macvim") || has('mac')
    let g:EasyGrepFileAssociations = "/Users/aisa/.vim/CustomGrepFileAssoc"
    set guifont=Menlo:h14
    cd formidable
  else
    let g:EasyGrepFileAssociations = "/home/aisa/.vim/CustomGrepFileAssoc"
  endif
endif

" GUI / text appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('gui_running')
  colorscheme aisa
else
  colorscheme aisadark "TODO needs a lot of work
end

set guioptions="ai"       " hide menu, toolbar
set guiheadroom=0         " account for menu/toolbar being hidden
"set lines=999 columns=999 " maximize
set t_Co=256              " 256-color if running in terminal

if &diff
  syntax off              " syntax hightlighting off when diffing
else
  syntax enable           " enable syntax, don't override colors
endif

set nowrap                " don't wrap lines by default
let &showbreak=' '        " indicate start of wrapped
set number                " show line numbers
set cursorline            " highlight current line
set colorcolumn=80        " show where the 80-char line is
set scrolloff=3           " minimum lines above/below cursor
set shortmess=ilmnrxO     " shorter messages
set showcmd               " show commands as you type
set fillchars="vert:\|,fold:\ -,diff:\ -"
match TrailingSpaces /\s\+$/


" Custom keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map ; :

" Go between splits more easily
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Shorter keybindings for ctrlp (find all, files, recent, buffer)
nnoremap ;fa :CtrlPMixed<Cr>
nnoremap ;ff :CtrlP<Cr>
nnoremap ;fr :CtrlPMRU<Cr>
nnoremap ;fb :CtrlPBuffer<Cr>

" Go between location list items
map [l :lprev<Cr>
map ]l :lnext<Cr>

" Cycle through buffers
map <Leader>h :bp<Cr>
map <Leader>l :bn<Cr>

" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase " case-insensitive search
set smartcase  " if uppercase letter, search case sensitive
set incsearch  " show matches as you type
set hlsearch   " highlight search matches
" escape to clear search highlighting
nnoremap <esc> :noh<return><esc>

" Indentation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" These will be overridden by editorconfig as needed
set expandtab    " use spaces instead of tabs
set tabstop=2    " how many columns wide a tab is visually
set shiftwidth=2 " how many columns to indent with >>
set smarttab     " uses shiftwidth # spaces when inserting <tab>
set autoindent   " take indent for new line from previous line
set smartindent  " more intelligent indent for new lines

" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=indent
set nofoldenable           " start with all folds open
set foldtext=GetFoldText()
function! GetFoldText()
  let num_lines = v:foldend - v:foldstart + 1
  return (repeat("- ", 35) . num_lines . " lines")
endfunction

" Status line, title, tab labels
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2 " Always show status line

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
  let path = expand('%:p:h')
  let path = substitute(path, '/home/aisa', '~', '')  " shorten home to ~
  let path = substitute(path, '/Users/aisa', '~', '') " mac version
  let path = substitute(path, '\Users\aisa', '~', '') " windows version
  let path = substitute(path, 'Projects', 'P', '')    " shorten main Projects dir
  let path = substitute(path, 'formidable', 'f', '')    " shorten work dir
  return path
endfunction

" Get rid of excess chars in default [Git(branch)] format
function! ShortBranch()
  let br = fugitive#statusline()
  let br = substitute(br, '[Git', ' ', '')
  let br = substitute(br, ']', '', '')
  return br
endfunction

" Tab line
let g:bufline_modified_sign='+'

" Set gvim's title based on current session. Expects .vim filename
function! SessionTitle()
  return matchstr(v:this_session, '[a-zA-Z0-9]\+\(\.vim\)\@=')
endfunction
au SessionLoadPost * set titlestring=%{SessionTitle()}

" Files, sessions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*.pyc,__init__.py,*/tmp/*,*/pytz/*,*/node_modules/*,*/dist/*
set autoread                " auto-update when file is changed from the outside
set nobackup                " don't create backup/swap files
set nowb
set noswapfile
set sessionoptions=buffers,folds,resize,winsize,curdir

" Diffs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set diffopt=filler,context:2,vertical,foldcolumn:1

" Custom functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Store sessions in one place
nnoremap ;so :so ~/Projects/vim-sessions/
nnoremap ;mks :mks! ~/Projects/vim-sessions/

" Change working dir to current file's dir
command! Current execute "cd %:h"

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

" Copy all to global register
map <C-a> :%y+<CR>

command! Reload :so %

" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_show_hidden = 1               " show hidden files
let g:ctrlp_open_multiple_files = '1vjr'  " open 1st in cur window, rest hidden

let g:EasyGrepSearchCurrentBufferDir = 0  "don't search buffer dirs (redundant)
let g:EasyGrepEveryMatch = 1              " show all matches on a line (/g)
let g:EasyGrepRecursive = 1               " search subfolders
let g:EasyGrepMode = 2                    " use file associations
let g:EasyGrepFilesToExclude = 'libs,pytz,djangoappengine,migrations,node_modules' " ignore these dirs
let g:EasyGrepReplaceWindowMode = 2       " don't open new tabs/splits

let g:syntastic_mode_map = {'mode': 'active'}
" let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_lua_checkers = ['luac']
let g:syntastic_javascript_checkers = ['jshint']
" let g:syntastic_javascript_jshint_exec = '/usr/local/bin/jshint'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:SuperTabMappingBackward = '<c-tab>'

let g:UltiSnipsExpandTrigger='<s-tab>'
let g:UltiSnipsJumpForwardTrigger='<s-tab>'
" Which file opens with :UltiSnipsEdit
let g:UltiSnipsSnippetsDir='~/.vim/custom-snippets'
" Which files are searched for snippets (leaving default off since I don't use)
let g:UltiSnipsSnippetDirectories=['custom-snippets']
let g:UltiSnipsEditSplit="vertical"

let g:user_emmet_leader_key='<Leader>'
let g:user_emmet_mode='i'

let g:gista#github_user = 'aisapatino'
let g:gista#close_list_after_open = 1          " hide list after opening one
let g:gista#update_on_write = 1                " update with :w

" better shortcut for color
command! Highlight exec "call HexHighlight()"

" Language-specific
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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

" Debugging
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set verbose=13
" set verbosefile=~/.vim/vimlog.vim

"map <F10> :echo 'hi<' . synIDattr(synID(line('.'),col('.'),1),'name') . '> trans<'
"    \ . synIDattr(synID(line('.'),col('.'),0),'name') . '> lo<'
"    \ . synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name') . '>'<CR>

