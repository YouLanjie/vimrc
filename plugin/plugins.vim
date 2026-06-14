"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"            _                _                      _            
"     _ __  | | _   _   __ _ (_) _ __   ___  __   __(_) _ __ ___  
"    | '_ \ | || | | | / _` || || '_ \ / __| \ \ / /| || '_ ` _ \ 
"    | |_) || || |_| || (_| || || | | |\__ \ _\ V / | || | | | | |
"    | .__/ |_| \__,_| \__, ||_||_| |_||___/(_)\_/  |_||_| |_| |_|
"    |_|               |___/                                      
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neovim插件设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Setting by vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.config/nvim/pack/vim-plug/start/')
let g:plug_url_format = 'git@github.com:%s.git'
" 主题
"Plug 'folke/tokyonight.nvim'
Plug 'tanvirtin/monokai.nvim'
" 状态栏 (Lua)
Plug 'nvim-lualine/lualine.nvim'
" 自动补全另一半
Plug 'windwp/nvim-autopairs'
" 一个显示TAG的插件
Plug 'liuchengxu/vista.vim'
" 撤销树
Plug 'mbbill/undotree'
" 注释
Plug 'numToStr/Comment.nvim'
" nvim的lsp服务支持
Plug 'neovim/nvim-lspconfig'
" 自动补全
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'      " LSP 来源
Plug 'hrsh7th/cmp-buffer'        " 当前缓冲区
Plug 'hrsh7th/cmp-path'          " 文件路径
Plug 'hrsh7th/cmp-cmdline'       " 命令行补全（可选）
Plug 'L3MON4D3/LuaSnip'          " 片段引擎
Plug 'saadparwaiz1/cmp_luasnip'  " 片段来源
Plug 'onsails/lspkind.nvim'      " 可选：额外美观
" 代码检查 (仅非 LSP 检查)
Plug 'mfussenegger/nvim-lint'
" 按键显示
Plug 'folke/which-key.nvim'
" 对齐 EasyAlign
Plug 'junegunn/vim-easy-align'
" 背景透明
Plug 'xiyaowong/transparent.nvim'
" org支持
Plug 'nvim-orgmode/orgmode'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其他
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F2> :Vista<CR>
nnoremap <silent> <leader><leader>t :Vista<CR>
nnoremap <silent> <F3> :UndoTreeToggle<CR>
nnoremap <silent> <F4> :TransparentToggle<CR>
