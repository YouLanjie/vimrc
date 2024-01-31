"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    _                                                 _            
"   | | __ ___  _   _  _ __ ___    __ _  _ __  __   __(_) _ __ ___  
"   | |/ // _ \| | | || '_ ` _ \  / _` || '_ \ \ \ / /| || '_ ` _ \ 
"   |   <|  __/| |_| || | | | | || (_| || |_) |_\ V / | || | | | | |
"   |_|\_\\___| \__, ||_| |_| |_| \__,_|| .__/(_)\_/  |_||_| |_| |_|
"               |___/                   |_|                         
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义快捷命令
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义命令)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command W w
command Q q
command WQ wq
command QW wq
command Wq wq
command Qw wq

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 键位绑定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <SPACE>s :w<CR>
noremap <SPACE>q :wq<CR>
noremap <SPACE>Q :q!<CR>
" 开启终端透明（颜值高）
noremap <M-1> <Cmd>hi Normal ctermbg=none<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-buffer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent><c-p> :bp<bar>if &bt!=''<bar>bp<bar>endif<cr>
nnoremap <silent><c-n> :bn<bar>if &bt!=''<bar>bn<bar>endif<cr>
nnoremap <silent>H     :bp<bar>if &bt!=''<bar>bp<bar>endif<cr>
nnoremap <silent>L     :bn<bar>if &bt!=''<bar>bn<bar>endif<cr>
nnoremap <silent><leader>d :bd<cr>
nnoremap <silent><expr><c-m> &bt==''?":w<cr>":
			\ getwininfo(win_getid())[0]["quickfix"]!=0?"\<cr>:cclose<cr>":
			\ getwininfo(win_getid())[0]["loclist"]!=0?"\<cr>:lclose<cr>":"\<cr>"

" Fast indent
nnoremap = >i{
nnoremap - <i{

" Fast move
noremap <C-h> 20h
noremap <C-j> 20j
noremap <C-k> 20k
noremap <C-l> 20l

" 插入移动
inoremap <c-e> <end>
inoremap <c-a> <c-o>^

" cmd emacs model
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-h> <left>
cnoremap <c-l> <right>
cnoremap <c-b> <s-left>
cnoremap <c-f> <s-right>

" set pair baket
cnoremap ( ()<left>
cnoremap [ []<left>
cnoremap { {}<left>

" change window width
nnoremap <c-up> <c-w>+
nnoremap <c-down> <c-w>-
nnoremap <c-left> <c-w><
nnoremap <c-right> <c-w>>

" change window in normal
nnoremap <s-up>    <c-w>k
nnoremap <s-down>  <c-w>j
nnoremap <s-left>  <c-w>h
nnoremap <s-right> <c-w>l
nnoremap <tab>     <c-w>w

" change window location
nnoremap <c-s-up> <c-w>K
nnoremap <c-s-down> <c-w>J
nnoremap <c-s-left> <c-w>H
nnoremap <c-s-right> <c-w>L

" quick fix
nnoremap <leader><leader>n :cnext<cr>
nnoremap <leader><leader>p :cprevious<cr>
nnoremap <leader><leader>o :copen<cr>
nnoremap <leader><leader>c :cclose<cr>

" tab ctrl
nnoremap <silent><leader>to :tabnew<cr>
nnoremap <silent><leader>tc :tabc<cr>
nnoremap <silent><leader>tp :tabp<cr>
nnoremap <silent><leader>tn :tabn<cr>

" set search noh
nnoremap <silent><leader>/ :noh<cr>

" set split window
nnoremap <silent><nowait>_ :vsp<cr>:bn<cr>
nnoremap <silent><nowait>+ :sp<cr>:bn<cr>

" open : quick
nnoremap <space>; :
xnoremap <space>; :
nnoremap <space><space> <space>

" bs to delete
xnoremap <silent><bs> d
snoremap <silent><bs> <space><bs>

