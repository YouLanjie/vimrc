"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                           _             
"         ___      __   __ (_)  _ __ ___  
"        / __|     \ \ / / | | | '_ ` _ \ 
"       | (__   _   \ V /  | | | | | | | |
"        \___| (_)   \_/   |_| |_| |_| |_|
"                                         
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 自定义C语言命令
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" /*<Space><++><Space>*/
" \/\*<Space><++><Space>\*\/

nnoremap <buffer> ]] <Esc>/\/\*<Space><++><Space>\*\/<CR><Cmd>nohlsearch<CR>v9l<C-g>
nnoremap <buffer> ]= <Esc>/\/\*<Space><++><Space>\*\/<CR><Cmd>nohlsearch<CR>v9l<C-g>
inoremap <buffer> ]] <Esc>/\/\*<Space><++><Space>\*\/<CR><Cmd>nohlsearch<CR>v9l<C-g>
inoremap <buffer> ]= <Esc>/\/\*<Space><++><Space>\*\/<CR><Cmd>nohlsearch<CR>v9l<C-g>

" 注释
inoremap <buffer> ]/ <Esc>A<Space><Space><Space><Space>/*  */<Esc>3ha
inoremap <buffer> ]. <Esc>O/*  */<Esc>3ha

" if
inoremap <buffer> ]i <Esc>oif<Space>(1<Esc>m1a)<Space>{<Esc>o/*<Space><++><Space>*/<Enter>}<Enter>/*<Space><++><Space>*/<Esc>`1v<C-g>
" else if
inoremap <buffer> ]ei <Esc>/}<CR>:nohlsearch<CR>A else<Space>if<Space>(1<Esc>m1a)<Space>{<Esc>o/*<Space><++><Space>*/<Enter>}<Esc>`1v<C-g>
" else
inoremap <buffer> ]ee <Esc>/}<CR>:nohlsearch<CR>A else<Space>{<Esc>o/*<Space><++><Space>*/<Esc>m1a<Enter>}<Esc>`1v9h<C-g>

" switch
inoremap <buffer> ]ss <Esc>oswitch<Space>(1<Esc>m1a)<Space>{<Enter><Backspace>case<Space>1:<Enter>/*<Space><++><Space>*/<Enter>break;<Enter>default:<Enter>/*<Space><++><Space>*/<Enter>break;<Enter>}<Enter>/*<Space><++><Space>*/<Esc>`1v<C-g>
inoremap <buffer> ]sc <Esc>/break;<CR><Cmd>nohlsearch<CR>ocase<Space>1<Esc>m1a:<Enter>/*<Space><++><Space>*/<Enter>break;<Esc>`1hv<C-g>

" while
inoremap <buffer> ]w <Esc>owhile<Space>(1<Esc>m1a)<Space>{<Enter>/*<Space><++><Space>*/<Enter>}<Enter>/*<Space><++><Space>*/<Esc>`1v<C-g>

" for
inoremap <buffer> ]f <Esc>ofor<Space>(int<Space>i<Esc>m1a;<Space>i<Space><<Space>1/*<Space><++><Space>*/;<Space>i++)<Space>{<Esc>o/*<Space><++><Space>*/<Enter>}<Enter>/*<Space><++><Space>*/<Esc>`1v<C-g>

" struct
inoremap <buffer> ]t <Esc>ostruct<Space>/<Esc>m1a*<Space><++><Space>*/<Space>{<Enter>/*<Space><++><Space>*/<Space>/*<Space><++><Space>*/;<Enter><Backspace>}/*<Space><++><Space>*/;<Enter>/*<Space><++><Space>*/<Esc>`1v9l<C-g>

" functon
inoremap <buffer> ]mm <Esc>o/<Esc>m1a*<Space><++><Space>*/<Space>/*<Space><++><Space>*/(/*<Space><++><Space>*/)<Enter>{<Enter>/*<Space><++><Space>*/<Enter>return<Space>/*<Space><++><Space>*/;<Enter>}<Enter><Esc>`1v9l<C-g>
inoremap <buffer> ]mn <Esc>/^}<CR><Cmd>nohlsearch<CR>o<Enter>/<Esc>m1a*<Space><++><Space>*/<Space>/*<Space><++><Space>*/(/*<Space><++><Space>*/)<Enter>{<Enter>/*<Space><++><Space>*/<Enter>return<Space>/*<Space><++><Space>*/;<Enter><Backspace>}<Enter><Esc>`1v9l<C-g>
inoremap <buffer> ]ms <Esc>/^}<CR><Cmd>nohlsearch<CR>o<Enter>static<Space>/<Esc>m1a*<Space><++><Space>*/<Space>/*<Space><++><Space>*/(/*<Space><++><Space>*/)<Enter>{<Enter>/*<Space><++><Space>*/<Enter>return<Space>/*<Space><++><Space>*/;<Enter><Backspace>}<Enter><Esc>`1v9l<C-g>
inoremap <buffer> ]mi <Esc>$m1<Esc>?)\n{<CR>yyG?^#include<CR><Cmd>nohlsearch<CR>o<ESC>pA;<Esc>`1
