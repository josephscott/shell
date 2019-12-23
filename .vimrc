set nocompatible

syntax on
filetype on

" A place to keep undo's
set undofile
set undolevels=1000
set undoreload=10000
set undodir=~/.vim/undo

" how to treat files
set encoding=utf-8
set fileformat=unix
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start
set noautoindent
set nosmartindent
set nocindent

" display
set ruler
set hlsearch
set showcmd
set incsearch
set ignorecase
set scrolloff=3
set laststatus=2

" php syntax
autocmd FileType php let php_sql_query=1
autocmd FileType php let php_htmlInStrings=1
autocmd FileType php let php_noShortTags=1
autocmd FileType php let php_folding=1
autocmd FileType php DoMatchParen
autocmd FileType php hi MatchParen ctermbg=blue guibg=lightblue




" colorscheme
set background=dark
