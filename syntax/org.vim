" Vim syntax file
" Language:	Org

syn case ignore

syn match oMetaValue ".*" contained
syn match oMeta /^ *#+[^: ]*:/ nextgroup=oMetaValue
hi link oMetaValue String
hi link oMeta Type

"syn match oLinkHead "^\[\[((?:[^\[\]\\]|\\.)*)(?:\]\[((?:[^\[\]\\]|\\.)*))?\]\]"
syn match oLinkHead /\[/ nextgroup=oLinkUrl
syn match oLinkUrl /\[[^\]]*\]/ contained nextgroup=oLinkAlt
syn match oLinkAlt /\(\[[^\]]*\]\)\?/ contained nextgroup=oLinkEnd
syn match oLinkEnd /\]/ contained
hi link oLinkHead Keyword
hi link oLinkEnd Keyword
hi oLinkUrl gui=italic,underline cterm=italic,underline
hi link oLinkAlt Type

hi link markdownCodeBlock String
hi markdownBold gui=bold cterm=bold
hi markdownItalic gui=italic cterm=italic
hi markdownStrike gui=strikethrough cterm=strikethrough
hi orgUnderline gui=underline cterm=underline
