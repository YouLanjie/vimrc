" ==================================================
"
" 自定义网易云音乐下载命令
"
" ==================================================
" 自定义命令(命令模式)
" ==================================================
" command W w
" command Q q
" command WQ wq
" command QW wq
" command Wq wq
" command Qw wq

" noremap(普通模式使用)
" ==================================================
"noremap <C-[> /<++><CR>:nohlsearch<CR>c4l
" autocmd Filetype c noremap <F3> <Cmd>chdir ../<CR><Cmd>set noautochdir<CR>
" autocmd Filetype c noremap <F4> <Cmd>!make;make clean<CR>
" autocmd Filetype c noremap <F5> <Cmd>terminal bin/main<CR>

" inoremap(插入模式使用)
" ==================================================
" inoremap ' ''<ESC>i
" inoremap " ""<ESC>i
" inoremap ( ()<ESC>i
" inoremap [ []<ESC>i
" inoremap { {<CR>}<ESC>O
" inoremap < <><ESC>i
" inoremap 「 「」<ESC>i
" inoremap （ （）<ESC>i
" inoremap <C-[> <Esc>/<++><CR>:nohlsearch<CR>c4l

autocmd Filetype dlmusic inoremap <Space><Space> <Esc>/<++><CR><Cmd>nohlsearch<CR>c4l
" autocmd Filetype text inoremap ]= <Esc>/<++><CR><Cmd>nohlsearch<CR>c4l

" autocmd Filetype c inoremap <Space> 
autocmd Filetype dlmusic inoremap <Space>= <++><CR><Space><Space>out=<++><CR><Backspace><++><Esc>2k0c4l
autocmd Filetype dlmusic inoremap <Space>[ <++><CR><Space><Space>out=<++><CR><Backspace><++><Esc>2k0c4l

