""""""""""""""""""""
" 自定义org命令
" 借助ai生成
""""""""""""""""""""

" 定义函数，用于在选中区域前后添加标记
" ------------------------------------
function OrgEncloseInBlock(blockname="quote") range
	" 在选中区域的第一行之前插入 #+begin_
	call append(a:firstline-1, '#+begin_'.a:blockname)
	" 在选中区域的最后一行之后插入 #+end_
	call append(a:lastline+1, '#+end_'.a:blockname)
endfunction

" 函数：添加脚注引用和定义
" ------------------------
function OrgAddFootnote()
	" 1. 收集所有已使用的脚注编号
	let l:used_numbers = []
	" 匹配模式 [fn:数字]（数字部分为 1 个以上数字）
	let l:pattern = '\[fn:\zs\d\+\ze\]'
	" 遍历整个缓冲区
	for l:line in getline(1, '$')
		let l:matches = matchstr(l:line, l:pattern)
		if l:matches != ''
			call add(l:used_numbers, str2nr(l:matches))
		endif
	endfor

	" 2. 确定最小可用编号
	let l:num = 1
	while index(l:used_numbers, l:num) != -1
		let l:num += 1
	endwhile

	" 3. 在当前光标位置插入 [fn:数字]
	execute "normal! i[fn:" . l:num . "]"

	" 4. 查找或创建 Footnotes 节
	let l:footnotes_line = search('^\* Footnotes$', 'nw')
	if l:footnotes_line == 0
		" 未找到，在文件末尾添加
		call append(line('$'), '')
		call append(line('$'), '* Footnotes')
		let l:footnotes_line = line('$')
	endif

	" 5. 在 Footnotes 节末尾添加定义行
	"		 找到节内最后一行（从标题行向下直到文件末尾或遇到非空行？简单处理：定位到标题行，然后向下找到最后一个非空行或直接追加）
	"		 这里直接追加到标题行之后，如果节内已有内容，则追加到最后；如果没有，则紧接标题行。
	"		 更严谨的做法：找到节内最后一行的行号
	let l:start = l:footnotes_line
	let l:end = line('$')
	" 如果节内已有内容，则找到该节最后一行（即下一个空行之前或文件末尾）
	let l:last_in_section = l:footnotes_line
	for l:i in range(l:footnotes_line + 1, l:end)
		if getline(l:i) =~ '^\s*$' && getline(l:i+1) !~ '^\s*$'
			" 遇到空行且下一行非空，说明节结束了？但脚注节一般连续行，简单处理：只要下一行不为空且不是标题就继续
		endif
		" 简单方法：直接追加到文件末尾，但确保在 * Footnotes 之后
		if getline(l:i) =~ '^\[fn:\d\+\]'
			let l:last_in_section = l:i
		endif
	endfor
	" 如果节内已经有脚注行，则追加到最后一条脚注行之后；否则追加到标题行之后
	let l:insert_line = (l:last_in_section == l:footnotes_line) ? l:footnotes_line : l:last_in_section
	call append(l:insert_line, '[fn:' . l:num . '] ')
	" 新添加的行号
	let l:new_line = l:insert_line + 1

	" 6. 将光标移动到新添加的定义行，并进入插入模式（方便直接输入脚注内容）
	call cursor(l:new_line, len('[fn:' . l:num . '] ') + 1)
	"startinsert!
endfunction

" 函数：从脚注引用跳转到定义
" -------------------------
function OrgJumpToFootnoteDef()
	" 获取当前光标下的脚注编号（模式 [fn:数字]）
	let l:footnote = matchstr(getline('.'), '\[fn:[^\]]\+\]', col('.') - 10)
	if empty(l:footnote)
		echo "光标下未找到脚注引用"
		return
	endif

	" 查找脚注定义节（* Footnotes）
	let l:footnotes_line = search('^\* Footnotes$', 'nw')
	if l:footnotes_line == 0
		echo "未找到脚注节 (* Footnotes)"
		return
	endif

	" 在脚注节中搜索该编号的定义
	let l:tag = l:footnote[4:-2]
	let l:pattern = '^\[fn:' . l:tag . '\>\]'
	let l:def_line = search(l:pattern, 'nw', line('$'))
	if l:def_line == 0
		echo "未找到脚注 " . l:tag . " 的定义"
		return
	endif

	" 保存当前位置到跳转列表，然后跳转
	mark '
	call cursor(l:def_line, 1)
	" 将光标移动到脚注内容起始位置（右括号后）
	call search('\[fn:' . l:tag . '\]\s*', 'ce', l:def_line)
	normal! l
	echo "跳转到脚注 " . l:tag . " 定义"
endfunction

" 函数：从脚注定义跳转到引用（跳转到第一个引用位置）
" -------------------------------------------------
function OrgJumpToFootnoteRef()
	" 获取当前行开头的脚注编号
	let l:footnote = matchstr(getline('.'), '^\[fn:[^\]]\+\]')
	if empty(l:footnote)
		echo "光标所在行不是脚注定义行"
		return
	endif

	" 搜索该编号的引用（排除脚注节本身）
	let l:footnotes_line = search('^\* Footnotes$', 'nw')
	let l:end = l:footnotes_line > 0 ? l:footnotes_line - 1 : line('$')
	let l:tag = l:footnote[4:-2]
	let l:pattern = '\[fn:' . l:tag . '\]'
	" 保存位置
	let l:now_col = col('$')
	let l:now_line = line('$')
	call cursor(1, 1)
	" 向后搜索需要限制向搜索长度
	let l:ref_line = search(l:pattern, 'n', l:end)
	call cursor(l:now_line, l:now_col) "恢复位置
	if l:ref_line == 0
		echo "未找到脚注 " . l:tag . " 的引用(". l:pattern ."): "
		return
	endif

	" 保存当前位置，跳转到引用
	mark '
	call cursor(l:ref_line, 1)
	call search(l:pattern, 'ce', l:ref_line)
	normal! l
	echo "跳转到脚注 " . l:tag . " 引用"
endfunction

function! OrgSmartJoin()
	let curr_line = getline('.')
	let next_line = getline(line('.') + 1)
	
	" 判断当前行末尾是否为中文字符（CJK统一汉字）
	let chinese_end = curr_line =~ '[\u4e00-\u9fa5，,。.！!？?；;：:（）()《》“”‘’【】「」〔〕]$'
	" 判断下一行开头是否为中文或中文标点（去除缩进后）
	let chinese_start = next_line =~ '^\s*[\u4e00-\u9fa5，,。.！!？?；;：:（）()《》“”‘’【】「」〔〕>\]}]'

	" 决策逻辑：
	" 1. 中文接中文（或中文标点） -> 不加空格 (gJ)
	" 2. 其他情况（英文之间、中英文混排） -> 加空格 (J)
	if chinese_end && chinese_start
		normal! gJ
	else
		normal! J
	endif
endfunction

" 函数：将匹配的章节放入位置列表窗口(AIGC)
function! OrgShowChapterQF(...)
	" 获取模式（可自定义）
	let pattern = a:0 > 0 ? a:1 : '^\*\+ '

	" 清空并构建列表
	let entries = []
	for lnum in range(1, line('$'))
		let line = getline(lnum)
		if line =~ pattern
			" 标准 Quickfix 条目格式：bufnr, lnum, col, text
			call add(entries, {
				\ 'bufnr': bufnr('%'),
				\ 'lnum': lnum,
				\ 'col': 1,
				\ 'text': substitute(line, '^\s*', '', '') 
				\ }) " 去除缩进供显示
		endif
	endfor

	if empty(entries)
		echo "No chapters found for: " . pattern
		return
	endif

	" 填充当前窗口的位置列表（并替换旧内容）
	call setloclist(0, entries, 'r')
	" 打开位置列表窗口（高度自动调整为 10 行，若为空则自动关闭）
	vertical lopen 40

	" 可选：跳转到第一个匹配项（让列表高亮第一行）
	if !empty(entries)
		normal! 1
	endif
endfunction

" 自定义 Quickfix/Location 列表每行显示格式(配套使用)
function! s:OrgMyQFText(info)
	" 1. 根据类型获取条目列表（手册推荐方式）
	let list_type = a:info.quickfix ? 'qflist' : 'loclist'
	let items = []
	if list_type == 'qflist'
		let items = getqflist({'id': a:info.id, 'items': 1}).items
	else
		let items = getloclist(0, {'id': a:info.id, 'items': 1}).items
	endif

	if empty(items)
		return []
	endif

	" 2. 检查所有条目是否来自同一个缓冲区（决定是否显示文件名）
	let first_buf = items[0].bufnr
	let same_buf = 1
	for item in items
		if item.bufnr != first_buf
			let same_buf = 0
			break
		endif
	endfor

	" 3. 生成 `start_idx` 到 `end_idx` 范围内的显示文本
	let start = a:info.start_idx
	let end   = a:info.end_idx
	let lines = []
	for idx in range(start - 1, end - 1)
		if idx >= len(items) | break | endif
		let entry = items[idx]
		let prefix = same_buf ? '' : fnamemodify(bufname(entry.bufnr), ':t') . '|'
		call add(lines, prefix . entry.text)
	endfor
	return lines
endfunction

" 启用自定义显示（对所有 Quickfix/Location 列表生效）
setlocal quickfixtextfunc=s:OrgMyQFText

" 添加快捷键
" ----------
" 在可视模式下，按 <leader>q 执行包裹
vnoremap <buffer> <silent><leader>q :call OrgEncloseInBlock("quote")<CR>
noremap <buffer> <silent><leader>q :call OrgEncloseInBlock("quote")<CR>
vnoremap <buffer> <silent><leader>s :call OrgEncloseInBlock("src")<CR>
noremap <buffer> <silent><leader>s :call OrgEncloseInBlock("src")<CR>
" 创建映射，例如在普通模式下按 <leader>fn 触发
nnoremap <buffer> <silent><leader>fc :call OrgAddFootnote()<CR>
" 映射：g] 跳转到脚注定义，g[ 跳转到引用
nnoremap <buffer> <silent>g] :call OrgJumpToFootnoteDef()<CR>
nnoremap <buffer> <silent>g[ :call OrgJumpToFootnoteRef()<CR>
" 智能合并前后行
nnoremap <buffer> <silent>J :call OrgSmartJoin()<CR>
" 命令封装
nnoremap <buffer> <silent>gO :call OrgShowChapterQF()<CR>

nnoremap <buffer> <silent><leader>l :packadd orgmode<CR>
lua pcall(function() require('orgmode').setup({}) end)

