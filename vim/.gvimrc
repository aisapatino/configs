" GUI-specific vim configuration

colorscheme aisa

" need this even though it's in .vimrc. see :help vb
set vb t_vb=

set guioptions='a'       " hide gui elements, enable autoselect for global c&p
set guiheadroom=0        " account for menu/toolbar being hidden

set columns=400
set lines=99

if has("win32")
  set guifont=Consolas:h12
elseif has("gui_macvim")
  set guifont=Menlo:h16
endif

set cursorline            " highlight current line
