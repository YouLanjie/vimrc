" ==================================================
"
" 自定义C语言命令
"
" ==================================================

" /*<Space><++><Space>*/
" \/\*<Space><++><Space>\*\/

autocmd Filetype c nnoremap ]] <Esc>/\/\*<Space><++><Space>\*\/<CR><Cmd>nohlsearch<CR>v9l<C-g>
autocmd Filetype c nnoremap ]= <Esc>/\/\*<Space><++><Space>\*\/<CR><Cmd>nohlsearch<CR>v9l<C-g>
autocmd Filetype c inoremap ]] <Esc>/\/\*<Space><++><Space>\*\/<CR><Cmd>nohlsearch<CR>v9l<C-g>
autocmd Filetype c inoremap ]= <Esc>/\/\*<Space><++><Space>\*\/<CR><Cmd>nohlsearch<CR>v9l<C-g>

autocmd Filetype cpp inoremap ]] <Esc>/\/\*<Space><++><Space>\*\/<CR><Cmd>nohlsearch<CR>v9l<C-g>
autocmd Filetype cpp inoremap ]= <Esc>/\/\*<Space><++><Space>\*\/<CR><Cmd>nohlsearch<CR>v9l<C-g>

" autocmd Filetype c inoremap ]

" 注释
autocmd Filetype c inoremap ]/ <Esc>A<Space><Space><Space><Space>/*  */<Esc>3ha
autocmd Filetype c inoremap ]. <Esc>O/*  */<Esc>3ha
autocmd Filetype cpp inoremap ]/ <Esc>A<Space><Space><Space><Space>/*  */<Esc>3ha
autocmd Filetype cpp inoremap ]. <Esc>O/*  */<Esc>3ha

" if
autocmd Filetype c inoremap ]i <Esc>oif<Space>(1<Esc>m1a)<Space>{<Esc>o/*<Space><++><Space>*/<Enter>}<Enter>/*<Space><++><Space>*/<Esc>`1v<C-g>
" else if
autocmd Filetype c inoremap ]ei <Esc>/}<CR>:nohlsearch<CR>A else<Space>if<Space>(1<Esc>m1a)<Space>{<Esc>o/*<Space><++><Space>*/<Enter>}<Esc>`1v<C-g>
" else
autocmd Filetype c inoremap ]ee <Esc>/}<CR>:nohlsearch<CR>A else<Space>{<Esc>o/*<Space><++><Space>*/<Esc>m1a<Enter>}<Esc>`1v9h<C-g>

" switch
autocmd Filetype c inoremap ]ss <Esc>oswitch<Space>(1<Esc>m1a)<Space>{<Enter><Backspace>case<Space>1:<Enter>/*<Space><++><Space>*/<Enter>break;<Enter>default:<Enter>/*<Space><++><Space>*/<Enter>break;<Enter>}<Enter>/*<Space><++><Space>*/<Esc>`1v<C-g>
autocmd Filetype c inoremap ]sc <Esc>/break;<CR><Cmd>nohlsearch<CR>ocase<Space>1<Esc>m1a:<Enter>/*<Space><++><Space>*/<Enter>break;<Esc>`1hv<C-g>

" while
autocmd Filetype c inoremap ]w <Esc>owhile<Space>(1<Esc>m1a)<Space>{<Enter>/*<Space><++><Space>*/<Enter>}<Enter>/*<Space><++><Space>*/<Esc>`1v<C-g>

" for
autocmd Filetype c inoremap ]f <Esc>ofor<Space>(int<Space>i<Esc>m1a;<Space>i<Space><<Space>1/*<Space><++><Space>*/;<Space>i++)<Space>{<Esc>o/*<Space><++><Space>*/<Enter>}<Enter>/*<Space><++><Space>*/<Esc>`1v<C-g>

" struct
autocmd Filetype c inoremap ]t <Esc>ostruct<Space>/<Esc>m1a*<Space><++><Space>*/<Space>{<Enter>/*<Space><++><Space>*/<Space>/*<Space><++><Space>*/;<Enter><Backspace>}/*<Space><++><Space>*/;<Enter>/*<Space><++><Space>*/<Esc>`1v9l<C-g>
autocmd Filetype cpp inoremap ]t <Esc>ostruct<Space>/<Esc>m1a*<Space><++><Space>*/<Space>{<Enter>/*<Space><++><Space>*/<Space>/*<Space><++><Space>*/;<Enter><Backspace>}/*<Space><++><Space>*/;<Enter>/*<Space><++><Space>*/<Esc>`1v9l<C-g>

" functon
autocmd Filetype c inoremap ]mm <Esc>o/<Esc>m1a*<Space><++><Space>*/<Space>/*<Space><++><Space>*/(/*<Space><++><Space>*/)<Enter>{<Enter>/*<Space><++><Space>*/<Enter>return<Space>/*<Space><++><Space>*/;<Enter>}<Enter><Esc>`1v9l<C-g>
autocmd Filetype c inoremap ]mn <Esc>/^}<CR><Cmd>nohlsearch<CR>o<Enter>/<Esc>m1a*<Space><++><Space>*/<Space>/*<Space><++><Space>*/(/*<Space><++><Space>*/)<Enter>{<Enter>/*<Space><++><Space>*/<Enter>return<Space>/*<Space><++><Space>*/;<Enter><Backspace>}<Enter><Esc>`1v9l<C-g>
autocmd Filetype c inoremap ]ms <Esc>/^}<CR><Cmd>nohlsearch<CR>o<Enter>static<Space>/<Esc>m1a*<Space><++><Space>*/<Space>/*<Space><++><Space>*/(/*<Space><++><Space>*/)<Enter>{<Enter>/*<Space><++><Space>*/<Enter>return<Space>/*<Space><++><Space>*/;<Enter><Backspace>}<Enter><Esc>`1v9l<C-g>
autocmd Filetype c inoremap ]mi <Esc>$m1<Esc>?)\n{<CR>yyG?^#include<CR><Cmd>nohlsearch<CR>o<ESC>pA;<Esc>`1

