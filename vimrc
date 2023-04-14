" ==================================================
" 
" 基本设置
" 
" ==================================================
set nocompatible
" 关闭 vi 兼容模式
syntax on
" 自动语法高亮
set autochdir
" 自动切换当前目录为当前文件所在的目录
set autoread
" 打开文件监视。如果在编辑过程中文件发生外部改变(比如被别的编辑器编辑了)，就会发出提示
set scrolloff=3
" 设置光标距离顶部和底部的固定位置
set magic
" 设置魔术
set autoindent
set smartindent
" 开启新行时使用智能自动缩进
set noeb
set noexpandtab
" 不要用空格代替制表符
set backspace=indent,eol,start
set cmdheight=1
" 设定命令行的行数为 1
set nowrap
"不折行
set sidescroll=1
"流畅扩展
set cursorline
" 设置高亮光标所在行
set mouse=n
" 设置禁用鼠标

filetype on
"检测文件类型
filetype plugin indent on
" 开启插件

" TAB
" ==================================================
set shiftwidth=8
" 设定 << 和 >> 命令移动时的宽度为 8
set softtabstop=8
" 使得按退格键时可以一次删掉 8 个空格
set tabstop=8
" 设定 tab 长度为 8

" 行号
" ==================================================
" set number
set nu
" 显示行号
set rnu
" 显示相对行号

" 搜索
" ==================================================
set ignorecase smartcase
" 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set incsearch
" 输入搜索内容时就显示搜索结果

" 状态栏
" ==================================================
set ruler
" 打开状态栏标尺
set laststatus=2
" 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 设置在状态行显示的信息

" 临时文件
" ==================================================
set noswapfile
" 禁止生成临时文件
set nobackup
" 覆盖文件时不备份
set backupcopy=yes
" 设置备份时的行为为覆盖
set hidden
" 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存

" ==================================================
"
" 功能脚本
"
" ==================================================
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 记忆文件上次打开位置

let s:fcitx_cmd = executable("fcitx5-remote") ? "fcitx5-remote" : "fcitx-remote"
autocmd InsertLeave * let b:fcitx = system(s:fcitx_cmd) | call system(s:fcitx_cmd.' -c')
autocmd InsertEnter * if exists('b:fcitx') && b:fcitx == 2 | call system(s:fcitx_cmd.' -o') | endif
" 退出插入模式时自动切换到英文

if has('persistent_undo') "check if your vim version supports it 
	set undofile "turn on the feature 
	set undodir=$HOME/.vim/undo "directory where the undo files will be stored 
endif

" ==================================================
"
" 配置多语言环境
"
" ==================================================
if has("multi_byte")
" UTF-8 编码
set encoding=utf-8
set termencoding=utf-8
set formatoptions+=mM
set fencs=utf-8,gbk
if v:lang =~? '^\(zh\)\|\(ja\)\|\(ko\)'
set ambiwidth=double
endif
if has("win32")
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
language messages zh_CN.utf-8
endif
else
echoerr "Sorry, this version of (g)vim was not compiled with +multi_byte"
endif

