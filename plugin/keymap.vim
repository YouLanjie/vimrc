" ==================================================
"
" 自定义快捷命令
"
" ==================================================
" 自定义命令(命令模式)
" ==================================================
command W w
command Q q
command WQ wq
command QW wq
command Wq wq
command Qw wq

" noremap(普通模式使用)
" ==================================================
noremap <SPACE>s :w<CR>
noremap <SPACE>q :wq<CR>
noremap <SPACE>Q :q!<CR>
"noremap <C-[> /<++><CR>:nohlsearch<CR>c4l
noremap <SPACE><Tab> <Cmd>bn<CR>
noremap <S-Tab> <Cmd>bn<CR>
noremap <M-`> <Cmd>bp<CR>
nnoremap = >i{
nnoremap - <i{
noremap <Tab> <C-w>w
noremap <C-h> 20h
noremap <C-j> 20j
noremap <C-k> 20k
noremap <C-l> 20l
" noremap <M-1> <Cmd>hi Normal ctermfg=251 ctermbg=none<CR>
noremap <M-1> <Cmd>hi Normal ctermbg=none<CR>
" 开启终端透明（颜值超高）
autocmd Filetype c noremap <M-2> <Cmd>chdir ../<CR><Cmd>set noautochdir<CR>
autocmd Filetype c noremap <F3> <Cmd>!make<CR>
autocmd Filetype c noremap <F4> <Cmd>terminal bin/main<CR>
autocmd Filetype c noremap <F5> <Cmd>make clean<CR>
autocmd Filetype c noremap <C-Enter> <Cmd>!make<CR>
autocmd Filetype c noremap <M-Enter> <Cmd>!make<CR>
autocmd Filetype text noremap <F3> <Cmd>setfiletype dlmusic<CR>
autocmd Filetype conf noremap <F3> <Cmd>setfiletype confshell<CR>

" inoremap(插入模式使用)
" ==================================================
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap “ “”<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap { {<CR>}<ESC>O
inoremap < <><ESC>i
inoremap 「 「」<ESC>i
inoremap （ （）<ESC>i
"补全
"inoremap <C-[> <Esc>/<++><CR>:nohlsearch<CR>c4l

autocmd Filetype c inoremap <C-Enter> <Cmd>!make<CR>

