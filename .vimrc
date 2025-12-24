set nocompatible

syntax on
filetype on
set modelines=3

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
set t_Co=256
set background=dark
hi clear

" Lighter than my previous default
colorscheme papercolor

" This is a slightly modified default Vim syntax style.  Firmly in the
" "Good Enough" category
"colorscheme vim-default

" Make the background color consistent
"highlight Normal ctermbg=NONE
"highlight nonText ctermbg=NONE
hi EndOfBuffer ctermfg=lightgray
hi Normal ctermbg=None
