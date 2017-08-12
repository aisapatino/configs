syn match phpFuncName "\(function\s\)\@<=\([a-zA-Z0-9_]\+\)" containedin=phpRegion
syn match phpFuncCall "[a-zA-Z_]\+::[a-zA-Z_]\+" containedin=phpRegion
hi! link phpFuncName Function
hi! link phpFuncCall Special
