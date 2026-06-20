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

" 查找标记点
inoremap <buffer> ]f <Esc>/<++><CR>:nohlsearch<CR>c4l
inoremap <buffer> ]] <Esc>/<++><CR>:nohlsearch<CR>c4l

" 空格
inoremap <buffer> ]<Space> 　
inoremap <buffer> ]\ &emsp;
" inoremap <buffer> ]\ <Esc>m1I&ensp;<Esc>`1a

" 一级标题
inoremap <buffer> ]1 <Esc>o#<Space><Enter><Enter><++><Esc>2kA

" 二级标题
inoremap <buffer> ]2 <Esc>o##<Space><Enter><Enter><++><Esc>2kA

" 三级标题
inoremap <buffer> ]3 <Esc>o###<Space><Enter><Enter><++><Esc>2kA

" 四级标题
inoremap <buffer> ]4 <Esc>o####<Space><Enter><Enter><++><Esc>2kA

" 五级标题
inoremap <buffer> ]5 <Esc>o#####<Space><Enter><Enter><++><Esc>2kA

" 六级标题
inoremap <buffer> ]6 <Esc>o######<Space><Enter><Enter><++><Esc>2kA

" 小点
inoremap <buffer> ]- <Esc>o-<Space>
inoremap <buffer> ]. <Esc>o-<Space>

" 斜体文本
inoremap <buffer> ]i **<++><Esc>F*i

" 粗体文本
inoremap <buffer> ]s ****<++><Esc>F*hi

" 标注
inoremap <buffer> ]m ``<++><Esc>F`i

" 粗斜体文本
inoremap <buffer> ]e ******<++><Esc>F*hhi

" 下划线
inoremap <buffer> ]d <Esc>o~~~~<++><Esc>F~hi

" 高亮
inoremap <buffer> ]h ====<++><Esc>F=hi

" 插入图片
inoremap <buffer> ]p ![](<++>)<++><Esc>F[a

" 插入链接
inoremap <buffer> ]a [](<++>)<++><Esc>F[a

" 插入分隔线
inoremap <buffer> ]n <Esc>o---<Enter><Enter>

" 插入代码块
inoremap <buffer> ]c <Esc>o```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA

" 表格操作
inoremap <buffer> ]T <Esc>o\|\|<++>\|<Enter>\|:-:\|:-:\|<Enter>\|<++>\|<++>\|<Esc>2kI<Esc>li
inoremap <buffer> ]t <Esc>o\|\|<++>\|<Esc>5hi

