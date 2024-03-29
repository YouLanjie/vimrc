"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              _          _                            
"   _ __ ___     __ _   _ __  | | __   __| |   ___   __      __  _ __  
"  | '_ ` _ \   / _` | | '__| | |/ /  / _` |  / _ \  \ \ /\ / / | '_ \ 
"  | | | | | | | (_| | | |    |   <  | (_| | | (_) |  \ V  V /  | | | |
"  |_| |_| |_|  \__,_| |_|    |_|\_\  \__,_|  \___/    \_/\_/   |_| |_|
"                                                                      
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义markdown快捷输入命令
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

func s:Local_input_markdown()
	" 查找标记点
	inoremap ]f <Esc>/<++><CR>:nohlsearch<CR>c4l
	inoremap ]] <Esc>/<++><CR>:nohlsearch<CR>c4l

	" 空格
	inoremap ]<Space> 　
	inoremap ]\ &emsp;
	" inoremap ]\ <Esc>m1I&ensp;<Esc>`1a

	" 一级标题
	inoremap ]1 <Esc>o#<Space><Enter><Enter><++><Esc>2kA

	" 二级标题
	inoremap ]2 <Esc>o##<Space><Enter><Enter><++><Esc>2kA

	" 三级标题
	inoremap ]3 <Esc>o###<Space><Enter><Enter><++><Esc>2kA

	" 四级标题
	inoremap ]4 <Esc>o####<Space><Enter><Enter><++><Esc>2kA

	" 五级标题
	inoremap ]5 <Esc>o#####<Space><Enter><Enter><++><Esc>2kA

	" 六级标题
	inoremap ]6 <Esc>o######<Space><Enter><Enter><++><Esc>2kA

	" 小点
	inoremap ]- <Esc>o-<Space>
	inoremap ]. <Esc>o-<Space>

	" 斜体文本
	inoremap ]i **<++><Esc>F*i

	" 粗体文本
	inoremap ]s ****<++><Esc>F*hi

	" 标注
	inoremap ]m ``<++><Esc>F`i

	" 粗斜体文本
	inoremap ]e ******<++><Esc>F*hhi

	" 下划线
	inoremap ]d <Esc>o~~~~<++><Esc>F~hi

	" 高亮
	inoremap ]h ====<++><Esc>F=hi

	" 插入图片
	inoremap ]p ![](<++>)<++><Esc>F[a

	" 插入链接
	inoremap ]a [](<++>)<++><Esc>F[a

	" 插入分隔线
	inoremap ]n <Esc>o---<Enter><Enter>

	" 插入代码块
	inoremap ]c <Esc>o```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA

	" 表格操作
	inoremap ]T <Esc>o\|\|<++>\|<Enter>\|:-:\|:-:\|<Enter>\|<++>\|<++>\|<Esc>2kI<Esc>li
	inoremap ]t <Esc>o\|\|<++>\|<Esc>5hi
endfunc
autocmd Filetype markdown call s:Local_input_markdown()

