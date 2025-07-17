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
" Coc.nvim补全框架
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" UltiSnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" 按键显示
Plug 'folke/which-key.nvim'
" 背景透明
Plug 'xiyaowong/transparent.nvim'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:coc_global_extensions = [
			\ 'coc-snippets',
			\ 'coc-vimlsp',
			\ 'coc-tsserver',
			\ 'coc-clangd',
			\ 'coc-python',
			\ 'coc-json',
			\ 'coc-html']
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UltiSnips
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:UltiSnipsSnippetDirectories = ["UltiSnips", '~/.config/nvim/snippets/']
    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set ambiwidth=single
autocmd VimEnter * silent try | exec AirlineToggleWhitespace | catch /^Vim\%((\a\+)\)\=:E121:/ | endtry

" 这个是安装字体后 必须设置此项
let g:airline_powerline_fonts = 1

" 打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 注释
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap ' <Plug>NERDCommenterInvert
vnoremap ' <Plug>NERDCommenterInvert
    
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 其他
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <F2> :TagbarToggle<CR>
nnoremap <silent> <F3> :MundoToggle<CR>
nnoremap <silent> <F4> :TransparentToggle<CR>
    
