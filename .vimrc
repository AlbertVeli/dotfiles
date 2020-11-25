" Load plugins
so ~/.vim/plugins.vim

" Set colorscheme (See /usr/share/vim/vim80/colors)
colorscheme desert
set background=dark

autocmd BufNewFile,BufReadPost *.cs set syntax=html

syntax on
filetype indent plugin on
" allow modeline to set indentation
set modeline

" Enable all vim-python features
let g:python_highlight_all = 1

" Indent 3 spaces
" filetype plugin indent on
" show existing tab with 3 spaces width
set tabstop=8
" when indenting with '>', use 3 spaces width
"set shiftwidth=3
" On pressing tab, insert 3 spaces
"" set expandtab
"set noexpandtab

" More indent
set autoindent
set smartindent
set cindent

" custom objdump highlighting
autocmd BufNewFile,BufRead *.objdump set filetype=objdump
