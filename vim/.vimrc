" Vim-specific options (obsolete in neovim)

" typical backspace behavior (not default on windows or in terminal)
set backspace=indent,eol,start
set encoding=utf-8
set showcmd                 " show commands as you type
set wildmenu                " use command autocompletion
set formatoptions+=j        " remove comment chars when joining
set autoindent              " take indent for new line from previous line
set incsearch               " show matches as you type
set hlsearch                " highlight search matches
set laststatus=2            " always show status line
set autoread                " auto-update when file is changed from the outside

" Load rest of (neo)vim config
source ~/Projects/configs/vim/init.vim

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
"let g:syntastic_python_checkers = []                                " too slow
let g:syntastic_sh_checkers = ['shellcheck']
let g:syntastic_python_prospector_args = '--profile=/Users/aisa/Projects/sjfnw/.landscape.yml'
