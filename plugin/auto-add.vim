"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                 _                            _      _          _            
"    __ _  _   _ | |_  ___           __ _   __| |  __| | __   __(_) _ __ ___  
"   / _` || | | || __|/ _ \  _____  / _` | / _` | / _` | \ \ / /| || '_ ` _ \ 
"  | (_| || |_| || |_| (_) ||_____|| (_| || (_| || (_| | _\ V / | || | | | | |
"   \__,_| \__,_| \__|\___/         \__,_| \__,_| \__,_|(_)\_/  |_||_| |_| |_|
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义添加文件头信息
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 加入C/C++注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func Local_insert_c_base()
	call setline(1,  "/*")
	call setline(2,  " *   Copyright (C) ".strftime("%Y")." ".expand("$USERNAME"))
	call setline(3,  " *")
	call setline(4,  " *   文件名称：".expand("%:t"))
	call setline(5,  " *   创 建 者：".expand("$USERNAME"))
	call setline(6,  " *   创建日期：".strftime("%Y年%m月%d日"))
	call setline(7,  " *   描    述：")
	call setline(8,  " *")
	call setline(9,  " */")
	call setline(10, "")
	call setline(11, "")
endfunc

" C head file
func Local_insert_h()
	call Local_insert_c_base()
	call setline(12, "#pragma once")
	call setline(13, "")
	call setline(14, "#ifndef _".toupper(expand("%:t:r"))."_H")
	call setline(15, "#define _".toupper(expand("%:t:r"))."_H")
	call setline(16, "")
	call setline(17, "#endif //".toupper(expand("%:t:r"))."_H")
	call setline(18, "")
endfunc
autocmd BufNewFile *.h,*.hpp exec ":call Local_insert_h()"

" C file
func Local_insert_c()
	call Local_insert_c_base()
	call setline(12, "#include \"".expand("%:t:r").".h\"")
	call setline(13, "")
	call setline(14, "")
endfunc
autocmd BufNewFile *.c,*.cpp exec ":call Local_insert_c()"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 加入shell,Makefile注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func Local_insert_sh()
	call setline(1,  "#!/usr/bin/zsh")
	call setline(2,  "")
	call setline(3,  "#================================================================")
	call setline(4,  "#   Copyright (C) ".strftime("%Y")." ".expand("$USERNAME"))
	call setline(5,  "#")
	call setline(6,  "#   文件名称：".expand("%:t"))
	call setline(7,  "#   创 建 者：".expand("$USERNAME"))
	call setline(8,  "#   创建日期：".strftime("%Y年%m月%d日"))
	call setline(9,  "#   描    述：")
	call setline(10, "#")
	call setline(11, "#================================================================")
	call setline(12, "")
	call setline(13, "")
endfunc
autocmd BufNewFile *.sh exec ":call Local_insert_sh()"

