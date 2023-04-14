" ==================================================
"
" 自定义markdown快捷输入命令
"
" ==================================================
" 查找标记点
" ==================================================
autocmd Filetype markdown inoremap ]f <Esc>/<++><CR>:nohlsearch<CR>c4l
autocmd Filetype markdown inoremap ]] <Esc>/<++><CR>:nohlsearch<CR>c4l

" 空格
" ==================================================
autocmd Filetype markdown inoremap ]<Space> 　
autocmd Filetype markdown inoremap ]\ &emsp;
" autocmd Filetype markdown inoremap ]\ <Esc>m1I&ensp;<Esc>`1a

" 一级标题
" ==================================================
autocmd Filetype markdown inoremap ]1 <Esc>o#<Space><Enter><Enter><++><Esc>2kA

" 二级标题
" ==================================================
autocmd Filetype markdown inoremap ]2 <Esc>o##<Space><Enter><Enter><++><Esc>2kA

" 三级标题
" ==================================================
autocmd Filetype markdown inoremap ]3 <Esc>o###<Space><Enter><Enter><++><Esc>2kA

" 四级标题
" ==================================================
autocmd Filetype markdown inoremap ]4 <Esc>o####<Space><Enter><Enter><++><Esc>2kA

" 五级标题
" ==================================================
autocmd Filetype markdown inoremap ]5 <Esc>o#####<Space><Enter><Enter><++><Esc>2kA

" 六级标题
" ==================================================
autocmd Filetype markdown inoremap ]6 <Esc>o######<Space><Enter><Enter><++><Esc>2kA

" 小点
" ==================================================
autocmd Filetype markdown inoremap ]- <Esc>o-<Space>
autocmd Filetype markdown inoremap ]. <Esc>o-<Space>

" 斜体文本
" ==================================================
autocmd Filetype markdown inoremap ]i **<++><Esc>F*i

" 粗体文本
" ==================================================
autocmd Filetype markdown inoremap ]s ****<++><Esc>F*hi

" 标注
" ==================================================
autocmd Filetype markdown inoremap ]m ``<++><Esc>F`i

" 粗斜体文本
" ==================================================
autocmd Filetype markdown inoremap ]e ******<++><Esc>F*hhi

" 下划线
" ==================================================
autocmd Filetype markdown inoremap ]d <Esc>o~~~~<++><Esc>F~hi

" 高亮
" ==================================================
autocmd Filetype markdown inoremap ]h ====<++><Esc>F=hi

" 插入图片
" ==================================================
autocmd Filetype markdown inoremap ]p ![](<++>)<++><Esc>F[a

" 插入链接
" ==================================================
autocmd Filetype markdown inoremap ]a [](<++>)<++><Esc>F[a

" 插入分隔线
" ==================================================
autocmd Filetype markdown inoremap ]n <Esc>o---<Enter><Enter>

" 插入代码块
" ==================================================
autocmd Filetype markdown inoremap ]c <Esc>o```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA

" 表格操作
" ==================================================
autocmd Filetype markdown inoremap ]T <Esc>o\|\|<++>\|<Enter>\|:-:\|:-:\|<Enter>\|<++>\|<++>\|<Esc>2kI<Esc>li
autocmd Filetype markdown inoremap ]t <Esc>o\|\|<++>\|<Esc>5hi

