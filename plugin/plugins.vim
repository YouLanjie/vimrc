" ==================================================
"
" 插件设置
"
" ==================================================
" Setting by vim-plug
" ==================================================
call plug#begin('~/.vim/pack/vim-plug/start/')
let g:plug_url_format = 'git@github.com:%s.git'
" 状态栏
Plug 'vim-airline/vim-airline'
" 目录树
Plug 'preservim/nerdtree'
" 缩进提示
Plug 'Yggdroot/indentLine'
" 主题
Plug 'gosukiwi/vim-atom-dark'
" 一个显示TAG的插件
Plug 'majutsushi/tagbar'
" 撤销树
Plug 'simnalamburt/vim-mundo'
" 注释
Plug 'preservim/nerdcommenter'
" Markdown预览
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
" Coc.nvim补全框架
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'Valloric/YouCompleteMe'
call plug#end()

" nerdtree
" ==================================================
let NERDTreeWinPos='left'
"设置在 vim 左侧显示
let NERDTreeWinSize=20
"设置宽度为 20
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
" autocmd vimenter * NERDTree
wincmd w
autocmd VimEnter * wincmd w
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置 F2 为打开或者关闭的快捷键
noremap <F2> :NERDTreeToggle<CR>
inoremap <F2> <Cmd>:NERDTreeToggle<CR>
    
    
" vim-airline
" ==================================================
set laststatus=2
" let g:airline_theme="onedark"
let g:airline_theme="dark"
set ambiwidth=single
autocmd VimEnter * AirlineToggleWhitespace

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1

" 打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
noremap <C-tab> :bn<CR>
noremap <C-s-tab> :bp<CR>
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 设置consolas字体"前面已经设置过
"set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" powerline symbols
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
" let g:airline_symbols.maxlinenr = ',Column:'
let g:airline_symbols.dirty='⚡'

" old vim-powerline symbols
" let g:airline_left_sep = '⮀'
" let g:airline_left_alt_sep = '⮁'
" let g:airline_right_sep = '⮂'
" let g:airline_right_alt_sep = '⮃'
" let g:airline_symbols.branch = '⭠'
" let g:airline_symbols.readonly = '⭤'

" vim-theams
" ==================================================
syntax enable
" colorscheme space-vim-dark
" colorscheme onedark
colorscheme atom-dark-256
    
" Markdown
" ==================================================
autocmd Filetype markdown noremap <SPACE>pp :MarkdownPreview<CR>
autocmd Filetype markdown noremap <SPACE>pP :MarkdownPreviewStop<CR>
autocmd Filetype markdown noremap <SPACE>ptt :TableModeToggle<CR>
autocmd Filetype markdown noremap <SPACE>ptr :TableModeRealign<CR> 
" 开始预览
autocmd Filetype markdown noremap <F3> <Plug>MarkdownPreview
" 关闭预览
autocmd Filetype markdown noremap <F4> <Plug>MarkdownPreviewStop
    
"    " nerdcommenter
"    " ==================================================
"    " Create default mappings
"    let g:NERDCreateDefaultMappings = 1
"    
"    " Add spaces after comment delimiters by default
"    let g:NERDSpaceDelims = 1
"    
"    " Use compact syntax for prettified multi-line comments
"    let g:NERDCompactSexyComs = 1
"    
"    " Align line-wise comment delimiters flush left instead of following code indentation
"    let g:NERDDefaultAlign = 'left'
"    
"    " Set a language to use its alternate delimiters by default
"    let g:NERDAltDelims_java = 1
"    
"    " Add your own custom formats or override the defaults
"    let g:NERDCustomDelimiters = { 'c': { 'left': '// ' } }
"    " let g:NERDCustomDelimiters = { 'c': { 'left': '/*','right': '*/' } }
"    
"    " Allow commenting and inverting empty lines (useful when commenting a region)
"    let g:NERDCommentEmptyLines = 1
"    
"    " Enable trimming of trailing whitespace when uncommenting
"    let g:NERDTrimTrailingWhitespace = 1
"    
"    " Enable NERDCommenterToggle to check all selected lines is commented or not 
"    let g:NERDToggleCheckAllLines = 1
    
" Tagbar
" ==================================================
nnoremap <F10> :TagbarToggle<CR>
    
" undo tree
" ==================================================
nnoremap <F9> :MundoToggle<CR>
    
" 注释
" ==================================================
nnoremap ' <Plug>NERDCommenterInvert
vnoremap ' <Plug>NERDCommenterInvert
    
"    " GTD
"    " ==================================================
"    " let g:gtd#dir = '~/Documentation/GTD/'
"    
"    " Coc.nvim
"    " ==================================================
"    inoremap <silent><expr> <TAB>
"          \ coc#pum#visible() ? coc#pum#next(1) :
"          \ CheckBackspace() ? "\<Tab>" :
"          \ coc#refresh()
"    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
"    
