hi! link diffAdded DiffAdd
hi! link diffRemoved DiffDelete

" --- a/file.js ("diffNewFile")
" +++ b/file.js ("diffOldFile")
hi! link diffNewFile Normal
hi! link diffOldFile ClassName

" diff a/file.js b/file.js
hi! link diffFile Function

" @@ -22,9 +22,8 @@
hi! link diffLine Special
