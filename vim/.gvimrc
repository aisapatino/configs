" GUI specific configs
"------------------------------------------------------------------------------

colorscheme aisa

" need this even though it's in .vimrc. see :help vb
set vb t_vb=

set guioptions="ai"       " hide menu, toolbar
set guiheadroom=0         " account for menu/toolbar being hidden

" maximize
set columns=400
set lines=99

if has("win32")
  set guifont=Consolas:h12
elseif has("gui_macvim")
  set guifont=Menlo:h15
endif

set cursorline            " highlight current line
