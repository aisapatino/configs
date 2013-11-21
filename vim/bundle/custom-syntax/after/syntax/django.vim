" TODO
" highlight spaces around = in template tags (in include for example they
" break it)

" django filter is more like a built in func, not an identifier
hi! link djangoFilter Keyword

" highlight block names
syn match djangoBlockName "\%(block\ \)\@<=\([a-z_]\+\)" containedin=djangoTagBlock
hi link djangoBlockName ClassName

