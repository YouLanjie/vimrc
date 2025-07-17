"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"     _           _   _                 _             
"    (_)  _ __   (_) | |_      __   __ (_)  _ __ ___  
"    | | | '_ \  | | | __|     \ \ / / | | | '_ ` _ \ 
"    | | | | | | | | | |_   _   \ V /  | | | | | | | |
"    |_| |_| |_| |_|  \__| (_)   \_/   |_| |_| |_| |_|
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neovim配置文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 通用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","      " 定义<leader>键
set nocompatible         " 关闭 vi 兼容模式
filetype on              " 检测文件类型
filetype plugin on       " 设置加载对应文件类型的插件
syntax enable            " 开启语法高亮功能
syntax on                " 自动语法高亮
set t_Co=256             " 开启256色支持
set cmdheight=1          " 设置命令行的高度
set showcmd              " select模式下显示选中的行数
set textwidth=0          " 设置禁止自动断行
set ruler                " 总是显示光标位置
set laststatus=2         " 总是显示状态栏
set number               " 开启行号显示
set relativenumber       " 展示相对行号
set cursorline           " 高亮显示当前行
set ttimeoutlen=0        " 设置<ESC>键响应时间
set noshowmode           " 设置不打开底部insert
set hidden               " 设置允许在未保存切换buffer
" set matchpairs+=<:>    " 设置%匹配<>
set background=dark      " 设置背景默认黑色
set autochdir            " 自动切换当前目录为当前文件所在的目录
set backspace=indent,eol,start    " 设置退格键特性
set mouse=n              " 设置鼠标
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码缩进和排版
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set autoindent           " 设置自动缩进
set cindent              " 设置使用C/C++语言的自动缩进方式
set cinoptions=g0,:0,N-s,(0    " 设置C/C++语言的具体缩进方式
set smartindent          " 智能的选择对其方式
filetype indent on       " 自适应不同语言的智能缩进
set noexpandtab          " 设置禁止空格替换tab,tab党
set tabstop=8            " 设置编辑时制表符占用空格数
set shiftwidth=8         " 设置格式化时制表符占用空格数
set softtabstop=8        " 设置8个空格为制表符
set smarttab             " 在行和段开始处使用制表符
set nowrap               " 禁止折行
set backspace=2          " 使用回车键正常处理indent,eol,start等
set sidescroll=1         " 设置向右滚动字符数
" set nofoldenable       " 禁用折叠代码
set foldmethod=manual    " 设置标记折叠
set list lcs=tab:¦\      " 设置默认开启对齐线
set scrolloff=3          " 设置底部距离

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 代码补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                             " vim自身命名行模式智能补全
set completeopt=menuone,preview,noselect " 补全时不显示窗口，只显示补全列表
set omnifunc=syntaxcomplete#Complete     " 设置全能补全
set shortmess+=c                         " 设置补全静默
set cpt+=kspell                          " 设置补全单词

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 搜索设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch            " 高亮显示搜索结果
set incsearch           " 开启实时搜索功能
set ignorecase          " 搜索时大小写不敏感
set smartcase           " 搜索智能匹配大小写

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 缓存设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup            " 设置不备份
set noswapfile          " 禁止生成临时文件
set autoread            " 文件在vim之外修改过，自动重新读入
set autowrite           " 设置自动保存
set confirm             " 在处理未保存或只读文件的时候，弹出确认
set backupcopy=yes      " 设置备份时的行为为覆盖
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 记忆文件Undo记录
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile                           " 保存Undo文件
let &undodir = fnamemodify($MYVIMRC, ":p:h")."/undo"
" 设置保存目录
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 编码设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set langmenu=zh_CN.UTF-8
set helplang=cn
" set termencoding=utf-8    " 在neovim 0.11.0-2中被移除
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动展开折叠
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufWinEnter * :normal zR
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 记忆文件上次打开位置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动切换中文输入法
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let fcitx5state=system("fcitx5-remote")
autocmd InsertLeave * :silent let fcitx5state=system("fcitx5-remote")[0] | silent !fcitx5-remote -c
autocmd InsertEnter * :silent if fcitx5state == 2 | call system("fcitx5-remote -o") | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自动切换到git根目录
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let git_dir = systemlist('git rev-parse --show-toplevel')[0]
if v:shell_error == 0
	set noautochdir
	execute "cd" fnameescape(git_dir)
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 主题设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
	"colorscheme tokyonight-night
	colorscheme monokai
catch
	colorscheme local-tokyonight
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 状态栏
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
" set tabline {{{
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
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight define,you can change self {{{
highlight User1 font=#000000 guifg=#1a1b26 guibg=#9ECE6A
highlight User2 font=#000000 guifg=#9ECE6A guibg=#232433
highlight User3 font=#000000 guifg=#1a1b26 guibg=#9ECE6A
highlight User4 font=#000000 guifg=#9ECE6A guibg=#232433
highlight User5 font=#000000 guifg=#1a1b26 guibg=#7AA2F7
highlight User6 font=#000000 guifg=#7AA2F7 guibg=#232433
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sourround
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim sourround {{{
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
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ctags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ctags config{{{
command! -nargs=? TagCreate call s:CreateTags(<q-args>,0)
command! -nargs=? TagPwd    call s:CreateTags(<q-args>,1)
command! -nargs=0 TagKind echo system("ctags --list-maps")
command! -nargs=1 -complete=tag  TagFind exec ":ts /".<q-args>
command! -nargs=1 -complete=file TagSave if exists("g:tag_file")&&filereadable(g:tag_file)|call system("cp ".g:tag_file." ".<q-args>)|endif
cab TagSave TagSave <c-r>=<sid>FindRoot()<cr>/tags
nnoremap <space>c  :let temp=taglist(input("Enter regex find:"))<bar>redraw<bar>echo temp<cr>
nnoremap <space>C  :TagCreate<cr>
nnoremap <leader>u <c-]>
nnoremap <expr><c-]> <sid>FindTags(expand('<cword>'))
vnoremap <nowait><c-]> "sy:TagFind <c-r>=@s<cr><cr>
func! s:FindTags(str)
	let list=taglist(a:str)
	if len(list)==1|return "\<c-]>"|else|return ":ts ".a:str."\<cr>"|endif
endfunc
func! s:CreateTags(arg,flag)
	if exists("g:tag_file")|exec "set tags-=".g:tag_file|endif|let g:tag_file=tempname()
	if a:flag|let g:tag_file="./tags"|endif
	if a:arg!=""|let arg=" --languages=".a:arg|else|let arg=" "|endif
	let dir=s:FindRoot()
	if dir==""|let dir=getcwd()|endif
	call job_start("ctags -f ".g:tag_file.arg." --tag-relative=no -R ".dir,
				\{"close_cb":"CreateTagCB","err_cb":"CreateTagErrCB"})
	exec "set tags+=".g:tag_file
endfunc
func! CreateTagErrCB(chan,msg)
	echoerr a:msg
endfunc
func! CreateTagCB(chan)
	call popup_create("tags create success", #{pos:'botright',time: 1000,highlight: 'WarningMsg',border: [],close: 'click',})
endfunc
"}}}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Lexplore
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set netrw {{{
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
set fillchars=vert:\⎜
nnoremap <silent> <leader>n :Lexplore<cr> " set netrw
highlight VertSplit guibg=#1a1b26 guifg=#232433
"}}}

