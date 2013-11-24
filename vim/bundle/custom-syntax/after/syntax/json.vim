syn match jsonModelName "\%(model\":\s\"\)\@<=\([a-z.]\+\)"
hi link jsonModelName Statement

syn region jsonFields start="fields" end="}" matchgroup=Normal contains=jsonFieldName

syn match jsonFieldName /"[a-z0-9_]\+\":/hs=s+1,he=e-2 contained
hi link jsonFieldName Identifier

syn match jsonPK "\(\"pk\":\s\)\@<=\([0-9]\+\)"
hi link jsonPK Number

