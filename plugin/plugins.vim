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
" 状态栏
Plug 'vim-airline/vim-airline'
" 自动补全另一半
Plug 'jiangmiao/auto-pairs'
" 一个显示TAG的插件
Plug 'majutsushi/tagbar'
" 撤销树
Plug 'simnalamburt/vim-mundo'
" 注释
Plug 'preservim/nerdcommenter'
" Markdown预览
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Coc.nvim补全框架
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Org mode
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-speeddating'
call plug#end()
    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
" let g:airline_theme="onedark"
let g:airline_theme="dark"
set ambiwidth=single
autocmd VimEnter * silent AirlineToggleWhitespace

" "这个是安装字体后 必须设置此项" 
" let g:airline_powerline_fonts = 1
" 
" 打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" 关闭状态显示空白符号计数
" let g:airline#extensions#whitespace#enabled = 0
" let g:airline#extensions#whitespace#symbol = '!'
" " 设置consolas字体 前面已经设置过
" "set guifont=Consolas\ for\ Powerline\ FixedD:h11
" if !exists('g:airline_symbols')
" 	let g:airline_symbols = {}
" endif
" " powerline symbols
" let g:airline_left_sep = ' '
" let g:airline_left_alt_sep = ' '
" let g:airline_right_sep = ' '
" let g:airline_right_alt_sep = ' '
" let g:airline_symbols.branch = ''
" let g:airline_symbols.colnr = ' :'
" let g:airline_symbols.readonly = ''
" let g:airline_symbols.linenr = ' :'
" let g:airline_symbols.maxlinenr = '☰ '
" " let g:airline_symbols.maxlinenr = ',Column:'
" let g:airline_symbols.dirty='⚡'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Markdown
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype markdown noremap <SPACE>pp :MarkdownPreview<CR>
autocmd Filetype markdown noremap <SPACE>pP :MarkdownPreviewStop<CR>
autocmd Filetype markdown noremap <SPACE>ptt :TableModeToggle<CR>
autocmd Filetype markdown noremap <SPACE>ptr :TableModeRealign<CR> 
" 开始预览
autocmd Filetype markdown noremap <F2> <Plug>MarkdownPreview
" 关闭预览
autocmd Filetype markdown noremap <F3> <Plug>MarkdownPreviewStop
    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F10> :TagbarToggle<CR>
    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" undo tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <F9> :MundoToggle<CR>
    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ' <Plug>NERDCommenterInvert
vnoremap ' <Plug>NERDCommenterInvert
    
