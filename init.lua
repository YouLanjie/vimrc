-- init.lua
-- 从init.vim迁移过来的配置

-- 对应全局变量设置(let g:xxx=)
vim.g.mapleader = ","

-- 一般设置
local o = vim.opt        -- 全局选项(set)
o.cmdheight = 1          -- 设置命令行的高度
o.showcmd = true         -- select模式下显示选中的行数
o.textwidth = 0          -- 禁止插入模式自动断行
o.ruler = true           -- 总是显示光标位置
o.laststatus = 2         -- 总是显示状态栏
o.number = true          -- 开启行号显示
o.relativenumber = true  -- 显示相对行号
o.cursorline = true      -- 高亮显示当前行
o.timeoutlen = 1000      -- 组合按键超时时限(ms)
o.showmode = false       -- 不在插入或可视模式时弹出提示消息
o.hidden = true          -- 设置允许在未保存切换buffer
o.autochdir = true       -- 自动切换目录
o.updatetime = 2000      -- 修改默认CursorHold触发时间为2秒
o.mouse = "n"            -- 设置鼠标仅在normal下可用
o.clipboard:append("unnamedplus")
-- o.matchpairs:append("<:>")
o.background = 'dark'
o.backspace = "indent,eol,start"

-- 代码缩进排版
o.autoindent = true            -- 设置自动缩进
o.cindent = true               -- 设置使用C/C++语言的自动缩进方式
o.cinoptions = "g0,:0,N-s,(0"  -- 设置C/C++语言的具体缩进方式
o.smartindent = true           -- 智能的选择对齐方式
o.expandtab = false            -- 不用空格替代tab
o.tabstop = 8                  -- 设置格式化时制表符占用空格数
o.shiftwidth = 8               -- 设置8个空格为制表符
o.smarttab = true              -- 在行和段开始处使用制表符
o.wrap = false                 -- 禁止折行
o.sidescroll = 1               -- 设置向右滚动字符数
o.foldmethod = 'manual'        -- 设置标记折叠
o.list = true                  -- 设置默认开启对齐线
o.lcs = "tab:¦ "
o.scrolloff = 3                -- 设置底部距离

-- 代码补全
o.wildmenu = true -- vim自身命名行模式智能补全
o.completeopt = "menuone,preview,noselect" -- 补全时不显示窗口，只显示补全列表
o.omnifunc = "syntaxcomplete#Complete"
o.shortmess:append("c") -- 设置补全静默
o.cpt:append("kspell") -- 设置补全单词

-- 搜索设置
o.hlsearch = true   -- 高亮显示搜索结果
o.incsearch = true  -- 开启实时搜索功能
o.ignorecase = true -- 搜索时大小写不敏感
o.smartcase = true  -- 搜索智能匹配大小写

-- 缓存设置
o.backup = false     -- 设置不备份
o.swapfile = false   -- 禁止生成临时文件
o.autoread = true    -- 文件在vim之外修改过，自动重新读入
o.autowrite = true   -- 设置自动保存
o.confirm = true     -- 在处理未保存或只读文件的时候，弹出确认
o.backupcopy = "yes" -- 设置备份时的行为为覆盖

-- Undo记忆文件
o.undofile = true    -- 保存Undo文件
o.undodir = vim.fn.stdpath("data").."/undo"

-- 本地化设置
o.langmenu = "zh_CN.UTF-8"
o.helplang = "cn"
o.encoding = "utf8"
o.fileencodings = "utf8,ucs-bom,gbk,cp936,gb2312,gb18030,default,latin1"

-- 自动化命令
vim.api.nvim_create_autocmd("BufWinEnter", {
	callback = function () vim.cmd("normal zR") end
})  -- 自动展开折叠
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function ()
		local lp = vim.api.nvim_buf_get_mark(0, '"')
		local le = vim.api.nvim_buf_line_count(0)
		if lp[1] > 1 and lp[1] <= le then
			vim.api.nvim_win_set_cursor(0, lp)
		end
	end
})  -- 记忆文件上次打开位置(想你了vimscript)
local fcitx5_state = vim.fn.system("fcitx5-remote"):sub(1, 1)
vim.api.nvim_create_autocmd("InsertLeave", {
	callback = function()
		fcitx5_state = vim.fn.system("fcitx5-remote"):sub(1, 1)
		vim.fn.system("fcitx5-remote -c")
	end
})  -- 记忆中文输入法状态
vim.api.nvim_create_autocmd("InsertEnter", {
	callback = function()
		if fcitx5_state == "2" then
			vim.fn.system("fcitx5-remote -o")
		end
	end
})  -- 自动切换中文输入法
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		-- 定义阈值（单位：字节，这里设为 5MB，可根据需要改）
		local threshold = 5 * 1024 * 1024
		local file = vim.fn.expand('<afile>')
		local size = vim.fn.getfsize(file)
		if size > threshold then
			vim.opt.shortmess:append("S")
		else
			vim.opt.shortmess:remove("S")
		end
	end
})  -- 大文件搜索优化（不显示搜索总数减少计算）
local git_dir = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
if vim.v.shell_error == 0 then
	o.autochdir = false
	vim.fn.chdir(git_dir)
end

-- 读取lazy.vim配置(./lua/config/lazy.lua)
require("config.lazy")

-- 主题设置(需要在加载插件后)
local ok, _ = pcall(function(cmd) vim.cmd(cmd) end, "colorscheme monokai")
if not ok then
	pcall(function(cmd) vim.cmd(cmd) end, "colorscheme local-tokyonight")
end
