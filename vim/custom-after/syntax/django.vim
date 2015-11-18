" Django filter is more like a built in function, not an identifier
hi! link djangoFilter Keyword

" Highlight block names
syn match djangoBlockName "\%(block\ \)\@<=\([a-z_\-]\+\)" containedin=djangoTagBlock
hi! link djangoBlockName ClassName
