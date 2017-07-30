let s:notes_dir = '~/Drive/Notes/'

function! alpw#commands#Note(title) abort
  " browse notes dir, edit existing file or create a new one
  if a:title == ''
    Vexplore ~/Drive/Notes
  else
    exec 'edit ' . s:notes_dir . fnameescape(a:title) . '.md'
  endif
endfunction

function! alpw#commands#UseTabs()
  setlocal noexpandtab
  setlocal nolist
endfunction

function! alpw#commands#UpdateTags()
  exec ':!ctags ' . getcwd()
endfunction

function! alpw#commands#ShowHighlightGroup()
  " show highlight group for item at cursor
  let l:id = synID(line('.'), col('.'), 1)
  let l:name = synIDattr(l:id, 'name')
  " follow links to get syn group that is actually highlighting this item
  let l:linked = synIDattr(synIDtrans(l:id), 'name')
  " transparent item
  let l:trans = synIDattr(synIDtrans(synID(line('.'), col('.'), 0)), 'name')
  return 'name: ' . l:name . ', hi: ' . l:linked . ', trans: ' . l:trans
endfunction

