syn match phpFuncName "\(function\s\)\@<=\([a-zA-Z0-9_]\+\)" containedin=phpRegion
hi link phpFuncName Function
