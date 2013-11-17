
" django filter is more like a built in func, not an identifier
hi! link djangoFilter Keyword

" highlight block names
syn match djangoBlockName "\%(block\ \)\@<=\([a-z]\+\)" containedin=djangoTagBlock
hi link djangoBlockName ClassName

