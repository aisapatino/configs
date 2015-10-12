" Used for diff sections in git diffs via :Gitv

" style added lines the same as in vimdiffs
hi! link diffAdded DiffAdd

" --- a/file.js ("diffNewFile")
" +++ b/file.js ("diffOldFile")
hi! link diffNewFile Normal
hi! link diffOldFile ClassName

" diff a/file.js b/file.js
hi! link diffFile Function

" @@ -22,9 +22,8 @@
hi! link diffLine Comment
" text before diff starts, right after diffline
hi! link diffSubname Comment
