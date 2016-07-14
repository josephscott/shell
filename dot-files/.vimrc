set nocompatible

" context
syntax on
filetype on

" undo
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

" go syntax
" from http://www.vim.org/scripts/script.php?script_id=2854
" A bunch of useful Go keywords
syn keyword  goStatement select
syn keyword  goStatement defer
syn keyword  goStatement fallthrough range type
syn keyword  goStatement return

syn keyword     goClause         import package
syn keyword     goConditional    if else switch
syn keyword     goBranch         goto break continue
syn keyword     goLabel          case default
syn keyword     goRepeat         for
syn keyword     goType           struct const interface func
syn keyword     goType           var map
syn keyword     goType           uint8 uint16 uint32 uint64
syn keyword     goType           int8 int16 int32 int64
syn keyword     goType           float32 float64
syn keyword     goType           float32 float64
syn keyword     goType           byte
syn keyword     goType           uint int float uintptr string

syn keyword     goConcurrent     chan go

syn keyword     goValue          nil
syn keyword     goBoolean        true false

syn keyword     goConstant       iota

" Builtin functions
syn keyword     goBif            len make new close closed cap map

" According to the language specification it is not garanteed to stay in the
" language. See http://golang.org/doc/go_spec.html#Bootstrapping
syn keyword     goBif            print println panic panicln

" Commants
syn keyword     goTodo           contained TODO FIXME XXX
syn match       goLineComment    "\/\/.*" contains=@Spell,goTodo
syn match       goCommentSkip    "^[ \t]*\*\($\|[ \t]\+\)"
syn region      goComment        start="/\*"  end="\*/" contains=@Spell,goTodo

" Numerals
syn case ignore
"integer number, or floating point number without a dot and with "f".
syn match       goNumbers        display transparent "\<\d\|\.\d" contains=goNumber,goFloat,goOctError,goOct
syn match       goNumbersCom     display contained transparent "\<\d\|\.\d" contains=goNumber,goFloat,goOct
syn match       goNumber         display contained "\d\+\(u\=l\{0,2}\|ll\=u\)\>"

" hex number
syn match       goNumber         display contained "0x\x\+\(u\=l\{0,2}\|ll\=u\)\>"

" oct number
syn match       goOct            display contained "0\o\+\(u\=l\{0,2}\|ll\=u\)\>" contains=goOctZero
syn match       goOctZero        display contained "\<0"

syn match       goFloat          display contained "\d\+\.\d*\(e[-+]\=\d\+\)\="
syn match       goFloat          display contained "\d\+e[-+]\=\d\=\>"
syn match       goFloat          display "\(\.[0-9_]\+\)\(e[-+]\=[0-9_]\+\)\=[fl]\=i\=\>"

" Literals
syn region      goString         start=+L\="+ skip=+\\\\\|\\"+ end=+"+ contains=@Spell

syn match       goSpecial        display contained "\\\(x\x\+\|\o\{1,3}\|.\|$\)"
syn match       goCharacter      "L\='[^\\]'"
syn match       goCharacter      "L'[^']*'" contains=goSpecial


hi def link goStatement     Statement
hi def link goClause        Preproc
hi def link goConditional   Conditional
hi def link goBranch        Conditional
hi def link goLabel         Label
hi def link goRepeat        Repeat
hi def link goType          Type
hi def link goConcurrent    Statement
hi def link goValue         Constant
hi def link goBoolean       Boolean
hi def link goConstant      Constant
hi def link goBif           Function
hi def link goTodo          Todo
hi def link goLineComment   goComment
hi def link goComment       Comment
hi def link goNumbers       Number
hi def link goNumbersCom    Number
hi def link goNumber        Number
hi def link goFloat         Float
hi def link goOct           Number
hi def link goOctZero       Number
hi def link goString        String
hi def link goSpecial       Special
hi def link goCharacter     Character


let b:current_syntax = "go"

" Highlight EOL whitespace, http://vim.wikia.com/wiki/Highlight_unwanted_spaces
highlight ExtraWhitespace ctermbg=darkred guibg=#382424
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" the above flashes annoyingly while typing, be calmer in insert mode
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace ''  

set background=dark
" colorscheme: start
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vim syntax support file
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last Change:	2001 Sep 12

" This file sets up the default methods for highlighting.
" It is loaded from "synload.vim" and from Vim for ":syntax reset".
" Also used from init_highlight().

set background=dark
hi clear

if !exists("syntax_cmd") || syntax_cmd == "on"
  " ":syntax on" works like in Vim 5.7: set colors but keep links
  command -nargs=* SynColor hi <args>
  command -nargs=* SynLink hi link <args>
else
  if syntax_cmd == "enable"
    " ":syntax enable" keeps any existing colors
    command -nargs=* SynColor hi def <args>
    command -nargs=* SynLink hi def link <args>
  elseif syntax_cmd == "reset"
    " ":syntax reset" resets all colors to the default
    command -nargs=* SynColor hi <args>
    command -nargs=* SynLink hi! link <args>
  else
    " User defined syncolor file has already set the colors.
    finish
  endif
endif

let g:colors_name="j9t-color"

" Many terminals can only use six different colors (plus black and white).
" Therefore the number of colors used is kept low. It doesn't look nice with
" too many colors anyway.
" Careful with "cterm=bold", it changes the color to bright for some terminals.
" There are two sets of defaults: for a dark and a light background.
"if &background == "dark"
"  SynColor Comment	term=bold cterm=NONE ctermfg=Cyan ctermbg=NONE gui=NONE guifg=#80a0ff guibg=NONE
"  SynColor Comment	term=bold cterm=NONE ctermfg=Cyan ctermbg=NONE gui=NONE guifg=#80a0ff guibg=NONE
"  SynColor Constant	term=underline cterm=NONE ctermfg=Magenta ctermbg=NONE gui=NONE guifg=#ffa0a0 guibg=NONE
"  SynColor Special	term=bold cterm=NONE ctermfg=LightRed ctermbg=NONE gui=NONE guifg=Orange guibg=NONE
"  SynColor Identifier	term=underline cterm=bold ctermfg=Cyan ctermbg=NONE gui=NONE guifg=#40ffff guibg=NONE
"  SynColor Statement	term=bold cterm=NONE ctermfg=Yellow ctermbg=NONE gui=bold guifg=#ffff60 guibg=NONE
"  SynColor PreProc	term=underline cterm=NONE ctermfg=LightBlue ctermbg=NONE gui=NONE guifg=#ff80ff guibg=NONE
"  SynColor Type		term=underline cterm=NONE ctermfg=LightGreen ctermbg=NONE gui=bold guifg=#60ff60 guibg=NONE
"  SynColor Underlined	term=underline cterm=underline ctermfg=LightBlue gui=underline guifg=#80a0ff
"  SynColor Ignore	term=NONE cterm=NONE ctermfg=black ctermbg=NONE gui=NONE guifg=bg guibg=NONE
"else
  SynColor Comment	term=bold cterm=NONE ctermfg=DarkBlue ctermbg=NONE gui=NONE guifg=Blue guibg=NONE
  SynColor Constant	term=underline cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=NONE guifg=Magenta guibg=NONE
  SynColor Special	term=bold cterm=NONE ctermfg=DarkMagenta ctermbg=NONE gui=NONE guifg=SlateBlue guibg=NONE
  SynColor Identifier	term=underline cterm=NONE ctermfg=DarkCyan ctermbg=NONE gui=NONE guifg=DarkCyan guibg=NONE
  SynColor Statement	term=bold cterm=NONE ctermfg=Brown ctermbg=NONE gui=bold guifg=Brown guibg=NONE
  SynColor PreProc	term=underline cterm=NONE ctermfg=DarkMagenta ctermbg=NONE gui=NONE guifg=Purple guibg=NONE
  SynColor Type		term=underline cterm=NONE ctermfg=DarkGreen ctermbg=NONE gui=bold guifg=SeaGreen guibg=NONE
  SynColor Underlined	term=underline cterm=underline ctermfg=DarkMagenta gui=underline guifg=SlateBlue
  SynColor Ignore	term=NONE cterm=NONE ctermfg=white ctermbg=NONE gui=NONE guifg=bg guibg=NONE
"endif
SynColor Error		term=reverse cterm=NONE ctermfg=White ctermbg=Red gui=NONE guifg=White guibg=Red
SynColor Todo		term=standout cterm=NONE ctermfg=Black ctermbg=Yellow gui=NONE guifg=Blue guibg=Yellow

" Common groups that link to default highlighting.
" You can specify other highlighting easily.
SynLink String		Constant
SynLink Character	Constant
SynLink Number		Constant
SynLink Boolean		Constant
SynLink Float		Number
SynLink Function	Identifier
SynLink Conditional	Statement
SynLink Repeat		Statement
SynLink Label		Statement
SynLink Operator	Statement
SynLink Keyword		Statement
SynLink Exception	Statement
SynLink Include		PreProc
SynLink Define		PreProc
SynLink Macro		PreProc
SynLink PreCondit	PreProc
SynLink StorageClass	Type
SynLink Structure	Type
SynLink Typedef		Type
SynLink Tag		Special
SynLink SpecialChar	Special
SynLink Delimiter	Special
SynLink SpecialComment	Special
SynLink Debug		Special

delcommand SynColor
delcommand SynLink

" hi Comment ctermfg=darkcyan
hi Comment ctermfg=grey
hi StatusLine   ctermfg=green

" colorscheme: stop
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



