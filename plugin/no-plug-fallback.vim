" 这里放没有安装插件时的fallback配置(因为懒得改成lua了)（平时用不到）

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 状态栏 (未安装lualine的备用方案）
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set statusline {{{
function! GetMode()
	let m = mode()|let s:str=''|let s:color='#9ECE6A'
	if m == 'R'|let s:color='#F7768E'|let s:str= 'Replace '
	elseif m == 'v'|let s:color='#F7768E'|let s:str= 'Visual '
	elseif m == 'i'|let s:color='#7AA2F7'|let s:str= 'Insert '
	elseif m == 't'|let s:color='#7AA2F7'|let s:str= 'Terminal '
	else|let s:color='#9ECE6A'|let s:str= 'Normal '
	endif
	exec 'highlight User3 font=#000000 guifg=#1a1b26 guibg='.s:color
	exec 'highlight User4 font=#000000 guifg='.s:color.' guibg=#232433'
	redraw|return s:str
endfunction

let g:status_git_branch=""
if has('nvim')
	let g:status_git_branch=' nvim'.' |'
endif
func! GitBranchShow(chan,msg)
	let g:status_git_branch=" ".a:msg." |"
endfunc
if g:status_git_branch==""
	call job_start("git rev-parse --abbrev-ref HEAD",{"out_cb":"GitBranchShow"})
endif

set statusline=%3*\ %{GetMode()}
set statusline+=%4*\ %{g:status_git_branch}\ %F\ \|%m%r%h%w%=
set statusline+=%3*\ %Y\ |
set statusline+=%3*¦%{\"\".(\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\"+\":\"\").\"\"}¦
set statusline+=%5*☰\ %l/%-L¦%3p%%¦:%v\ ¦
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:tab_after=""
func! TabLine(direct)
	let s:tab_result=""|let flag=0
	if a:direct|return s:tab_after!=""?s:tab_after."|":"\ "|else|let s:tab_after=""|endif
	for buf in getbufinfo({'buflisted':1})
		let s:name=buf.name
		if strridx(buf.name,"/")!=-1|let s:name=strpart(buf.name,strridx(buf.name,"/")+1)|endif
		if buf.name!=expand('%:p')
			if flag==0|let s:tab_result=s:tab_result."\ ".s:name."\ "|else|let s:tab_after=s:tab_after."\ ".s:name."\ "|endif
		else|let flag=1|endif
	endfor
	redrawt
	return s:tab_result
endfunc
func! TabLineSet()
	if len(gettabinfo())>1|return "%5* Tab %2*%=%1* buffer"|endif
	if &modified|let tab="%2* %0.32(%{TabLine(0)}%)%5*\ %t\ %6*%2*%<%{TabLine(1)}%r%h%w%=%6*\ %5* buffer"
	else|let tab="%2* %0.32(%{TabLine(0)}%)%1*\ %t\ %2*%2*%<%{TabLine(1)}%r%h%w%=%2*\ %1* buffer"
	endif
	return tab
endfunc
set tabline=%!TabLineSet()
set showtabline=2
