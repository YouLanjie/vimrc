" Vim syntax file
" Language:	Org

syn case ignore
syn match oSpecial "[*-]"
syn match oComment /# .*/
syn match oHead /#+[^:]*:/ contained
syn match oHeadStr /#+[^:]*:.*/ contains=oHead
syn match oTitle /[*]\+ .*/ contains=oSpecial

syn match oLink "[\[\]]" contained
syn match oLinkAlt "\[\[.*\]\[" contained contains=oLink
syn match oLinkStr "\[.*\]" contains=oLink,oLinkAlt


hi link oTitle String
hi link oSpecial Special
hi link oComment Comment
hi link oHeadStr String
hi link oHead Type

hi link oLinkStr String
hi oLinkAlt gui=italic,underline cterm=italic,underline
hi link oLink Type

