" django filter is more like a built in function, not an identifier
hi! link djangoFilter Keyword

" highlight block names
syn match djangoBlockName "\%(block\ \)\@<=\([a-z_\-]\+\)" containedin=djangoTagBlock
hi! link djangoBlockName ClassName
