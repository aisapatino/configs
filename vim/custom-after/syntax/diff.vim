" See $VIMRUNTIME/syntax/diff.vim
" Syntax
"--------

" Default doesn't match git diff output. Clear and start over
syn clear diffFile
syn clear diffOldFile
syn clear diffNewFile

syn match diffFileInfo "^index .*"
syn match diffFileInfo "^deleted file mode .*"
syn match diffFileInfo "^new file mode .*"
syn match diffFileInfo "^diff .*" contains=diffHide
syn match diffHide "^diff --git " contained conceal
syn match diffFile "^--- .*"
syn match diffFile "^+++ .*"

" Highlight
"-----------

" link diff ft-specific to the common global groups
hi! link diffFile      Statement
hi! link diffFileInfo  Folded
" diffLine = @@ -22,9 +22,8 @@
" diffSubname = text before diff starts, right after diffLine