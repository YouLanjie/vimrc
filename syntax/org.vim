" Vim syntax file
" Language:	Org

syn case ignore
syn match oSpecial "[*-]"
syn match oComment /# .*/
syn match oHead /#+[^:]*:/ contained
syn match oHeadStr /#+[^:]*:.*/ contains=oHead
syn match oTitle /[*]\+ .*/ contains=oSpecial


hi link oTitle String
hi link oSpecial Special
hi link oComment Comment
hi link oHeadStr String
hi link oHead Type

