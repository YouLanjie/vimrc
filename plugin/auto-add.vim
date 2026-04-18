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
func s:insert_c_base()
    " 仅当文件为空时插入（避免覆盖已有内容）
    if line('$') == 1 && getline(1) == ''
        call append(0, [
                    \ '/**',
                    \ ' * @file        ' . expand('%:t'),
                    \ ' * @author      ' . expand("$USERNAME"),
                    \ ' * @date        ' . strftime('%Y-%m-%d'),
                    \ ' * @brief       简要描述该文件的作用',
                    \ ' */',
                    \ ''
                    \ ])
        " 将光标定位到 @brief 那一行末尾，方便立即填写
        call cursor(5, 18)
    endif
endfunction


" C head file
func s:insert_h()
	call s:insert_c_base()
	call setline(8, "#pragma once")
	call setline(9, "")
	call setline(10, "#ifndef _".toupper(expand("%:t:r"))."_H")
	call setline(11, "#define _".toupper(expand("%:t:r"))."_H")
	call setline(12, "")
	call setline(13, "#endif //".toupper(expand("%:t:r"))."_H")
	call setline(14, "")
endfunc
autocmd BufNewFile *.h,*.hpp call s:insert_h()

" C file
func s:insert_c()
	call s:insert_c_base()
	call setline(8, "#include <stdio.h>")
	call setline(9, "//#include \"".expand("%:t:r").".h\"")
	call setline(10, "")
	call setline(11, "")
endfunc
autocmd BufNewFile *.c,*.cpp call s:insert_c()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 加入shell,Makefile注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func s:insert_sh()
	call setline(1,  "#!/usr/bin/bash")
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
autocmd BufNewFile *.sh call s:insert_sh()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 加入python注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
func s:insert_py()
	call setline(1,  "#!/usr/bin/env python")
	call setline(2,  "# Created:".strftime("%Y.%m.%d"))
	call setline(3,  "")
	call setline(4,  "def main():")
	call setline(5,  "    pass")
	call setline(6,  "")
	call setline(7,  "if __name__ == \"__main__\":")
	call setline(8,  "    main()")
	call setline(9, "")
endfunc
autocmd BufNewFile *.py call s:insert_py()

