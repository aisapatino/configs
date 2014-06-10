execute pathogen#infect()

cd ~\Projects

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
  let g:EasyGrepFileAssociations = "/home/aisa/.vim/bundle/CustomGrepFileAssoc"
endif

" GUI / text appearance
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

colorscheme aisa
set guioptions="ai"       " hide menu, toolbar
set lines=60 columns=238  " maximize
set guiheadroom=0         " account for menu/toolbar being hidden

if &diff
  syntax off
else
  syntax enable           " enable syntax, don't override colors
endif

set nowrap                " don't wrap lines by default
let &showbreak='> '       " indicate start of wrapped
set number                " show line numbers
set cursorline            " highlight current line
set colorcolumn=80        " show where the 80-char line is
set scrolloff=3           " minimum lines above/below cursor
set shortmess=ilmnrxO     " shorter messages
set showcmd               " show commands as you're typing
set fillchars="vert:\|,fold:\ -,diff:\ -"
filetype plugin indent on
match TrailingSpaces /\s\+$/

" Custom keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map ; :

" Go between splits more easily
map <C-h> <C-w>h
map <C-l> <C-w>l
map <C-j> <C-w>j
map <C-k> <C-w>k

" Shorter tag window toggle
nnoremap ;tt :TagbarToggle

" Shorter file searches (find all, find files, find recent, find buffer)
nnoremap ;fa :CtrlPMixed<Cr>
nnoremap ;ff :CtrlP<Cr>
nnoremap ;fr :CtrlPMRU<Cr>
nnoremap ;fb :CtrlPBuffer<Cr>

" Go between location list items
map [l :lprev<Cr>
map ]l :lnext<Cr>

" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set ignorecase " case-insensitive search
set smartcase  " if uppercase letter, search case sensitive
set incsearch  " show matches as you type
set hlsearch   " highlight search matches
" escape to clear search highlighting
nnoremap <esc> :noh<return><esc>

" Indentation & folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set expandtab    " tabs are annoying; use spaces
set tabstop=2    " how many columns wide a tab is visually
set shiftwidth=2 " how many columns to indent with >>
set smarttab     " uses shiftwidth # spaces when inserting <tab>
"set autoindent   " take indent for new line from previous line
set smartindent  " more intelligent indent for new lines

set foldmethod=indent
set nofoldenable           " all open at start
set foldtext=GetFoldText()
function! GetFoldText()
  let num_lines = v:foldend - v:foldstart + 1
  return (repeat("- ", 35) . num_lines . " lines")
endfunction

" Status line, title, tab labels
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set laststatus=2 " Always show

set statusline=[%n]                                     " buffer number
set statusline+=\ %t\                                   " file name
set statusline+=%{fugitive#statusline()}                " git branch
set statusline+=%#SLWarn#%m%*                   " warn if dos format
set statusline+=\ %#SLWarn#%{&ff!='unix'?'['.&ff.']':''}%*
set statusline+=\ %{&shiftwidth}                        " tab size
set statusline+=%{&expandtab==1?'':'%#SLWarn#T%*'} 
set statusline+=%=                                      " end of left side
set statusline+=\ %.30(\ \ %{ShPath(expand('%:p:h'))}%)   " shortened path
set statusline+=\ %5L                                   " total lines in file

" a: indicates arg
function! ShPath(path)
  let path = a:path
  let path = substitute(path, '/home/aisa', '~', '')  " shorten home to ~
  let path = substitute(path, '\Users\aisa', '~', '') " windows version
  let path = substitute(path, 'Projects', 'P', '')       " shorten main Projects dir
  return path
endfunction

function! SessionTitle()
  return matchstr(v:this_session, '[a-zA-Z0-9]\+\(\.vim\)\@=')
endfunction
au SessionLoadPost * set titlestring=%{SessionTitle()}

function! TabLabel()
  return ShPath(getcwd())
endfunction

set guitablabel=%{TabLabel()}

" Files, sessions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildignore+=*.pyc,__init__.py,*/tmp/*,*/pytz/*,*/node_modules/*,*/dist/*
set autoread " when file is changed from the outside
set nobackup
set nowb
set noswapfile
set sessionoptions=buffers,folds,resize,winsize,curdir
" auto reload vimrc when changed
au BufWritePost .vimrc source %

" Diffs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set t_Co=256
set diffopt=filler,context:2,vertical,foldcolumn:1

" Custom shortcuts/functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Store sessions in one place
nnoremap ;so :so ~/Projects/vim-sessions/
nnoremap ;mks :mks! ~/Projects/vim-sessions/

" Change working dir
command! Current execute "cd %:h"

" Trim trailing spaces
command! Trail :%s/\s\+$

" Resource vimrc
command! Reload execute "so %"

" Open scratch window
command! Scratch execute "e scratch | setlocal readonly"

" Convert file to unix
command! FormatUnix execute "update | e ++ff=dos | setlocal ff=unix | w"

" Format django's debug=True lists of queries
command! FormatQLogs execute "%s/\(SELECT\|WHERE\|FROM\|\)/\r\t\1/gc | %s/`//gc"

" Fix django template style
command! DjangoTemplateStyle :%s/{{\(\S\)/{{\ \1/g|:%s/\(\S\)}}/\1\ }}/g

" Copy all
map <C-a> :%y+<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:did_minibufexplorer_syntax_inits = 1 " tell minibuf not to set its own hi
let g:miniBufExplHideWhenDiff = 1          " don't show in diff mode
let g:miniBufExplStatusLineText = '%=cwd\ %{ShPath(getcwd())}'

let g:tagbar_left = 1
let g:tagbar_sort = 0           " order of appearance in file, not alphabetical
let g:tagbar_width = 30
let g:tagbar_show_visibility = 0  " don't show symbols for public/private
let g:tagbar_singleclick = 1      " single click to go to tag

"let g:ctrlp_by_filename = 1       " search by filename, not dir
let g:ctrlp_show_hidden = 1       " show hidden files
let g:ctrlp_open_multiple_files = '1vjr' " open first in curr window, rest hidden

let g:EasyGrepSearchCurrentBufferDir = 0 "don't search buffer dirs (redundant)
let g:EasyGrepEveryMatch = 1   " show all matches on a line
let g:EasyGrepRecursive = 1    " search subfolders
let g:EasyGrepMode = 2         " use file associations
let g:EasyGrepAllOptionsInExplorer = 1
let g:EasyGrepFilesToExclude = 'libs,pytz,djangoappengine,migrations,node_modules' " ignore these dirs
let g:EasyGrepReplaceWindowMode = 2    " don't open new tabs/splits

let g:syntastic_mode_map = {"mode": "active"}
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_lua_checkers = ['luac']
let g:syntastic_javascript_checkers = ['jshint']
"#, 'closurecompiler']
"let g:syntastic_javascript_closure_compiler_path = '~/Devel/google_closure/compiler.jar'
let g:syntastic_jshint_exec = '/home/aisa/.node/bin/jshint'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

let g:SuperTabMappingBackward = '<c-tab>'
let g:UltiSnipsExpandTrigger="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<s-tab>"
" Which file opens with :UltiSnipsEdit
let g:UltiSnipsSnippetsDir="~/.vim/bundle/custom-snippets"
" Which files are searched for snippets (leaving default off since I don't use)
let g:UltiSnipsSnippetDirectories=["bundle/custom-snippets"]

let g:user_emmet_leader_key='<C-e>'
let g:user_emmet_mode='i'

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

