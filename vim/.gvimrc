" GUI specific configs

colorscheme aisa

set guioptions="ai"       " hide menu, toolbar
set guiheadroom=0         " account for menu/toolbar being hidden


if has("win32")
  set guifont=Consolas:h12
elseif has("gui_macvim")
  set guifont=Menlo:h14

set cursorline            " highlight current line

