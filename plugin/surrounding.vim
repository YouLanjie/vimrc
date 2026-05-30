"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sourround 环绕
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pair_map={'(':')','[':']','{':'}','"':'"',"'":"'",'<':'>','`':'`',}
func! s:AddSourround()
	let s:ch=nr2char(getchar())|let s:col=col('.')|let pos=getcurpos()
	norm! gv"sy
	let s:str = @s
	for k in keys(g:pair_map)
		if s:ch==k||s:ch==g:pair_map[k]
			execute ":s/^\\(.\\{".(col('.')-1)."\\}\\)".escape(s:str, '~"\.^$[]*')."/\\1".k.s:str.g:pair_map[k]."/"
			call setpos('.', pos)
			return
		endif
	endfor
	echo s:ch.' unknow pair'
endfunc
func! s:DelSourround()
	let s:ch=nr2char(getchar())
	if getline('.')[col('.')-1]!=s:ch|echo 'not begin with'.s:ch|return|endif
	for k in keys(g:pair_map)
		if s:ch==k|execute 'normal! xf'.g:pair_map[k].'x'|return|endif
	endfor
endfunc
func! s:ChangeSourround()
	let s:ch=nr2char(getchar())|let s:two=nr2char(getchar())
	let pos=getcurpos()
	if getline('.')[col('.')-1]!=s:ch|echo 'not begin with'.s:ch|return|endif
	execute 'normal! r'.s:two.'f'.g:pair_map[s:ch].'r'.g:pair_map[s:two]
	call setpos('.',pos)
endfunc
xnoremap <silent>S  :<c-u>call <sid>AddSourround()<cr>
nnoremap <silent>ds :call <sid>DelSourround()<cr>
nnoremap <silent>cs :call <sid>ChangeSourround()<cr>
