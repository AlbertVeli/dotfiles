" Set colorscheme (See /usr/share/vim/vim80/colors)
colorscheme desert
set background=dark

autocmd BufNewFile,BufReadPost *.cs set syntax=html

set nofixendofline

" Disable .vim/.netrwhist
let g:netrw_dirhistmax = 0

syntax on
filetype indent plugin on
" allow modeline to set indentation
set modeline

" Enable all vim-python features
let g:python_highlight_all = 1

" tabstop:     Width of tab character
" softtabstop: Fine tunes the amount of white space to be added
" shiftwidth:  Amount of whitespace to add in normal mode
" expandtab:   https://www.youtube.com/watch?v=SsoOG6ZeyUI
" set tabstop     =3
" set softtabstop =3
" set shiftwidth  =3
"set expandtab

" Kernel
set tabstop     =8
set softtabstop =8
set shiftwidth  =8
set noexpandtab

" More indent
set autoindent
set smartindent
set cindent

" custom objdump highlighting
autocmd BufNewFile,BufRead *.objdump set filetype=objdump
