" use vim settings, rather than vi settings
set nocompatible

" syntax highlighting
set termguicolors
let g:colors_name = 'dracula'
let g:dracula_colorterm = 0
syntax on
color dracula
filetype plugin on

" security
set modelines=0
set secure

" hide buffers, not close them
set hidden

" better display messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" always show signcolumns
set signcolumn=yes

" show matching brackets/parenthesis
set showmatch

" disable startup message
set shortmess+=I

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" make backspace behave in a sane manner
set backspace=indent,eol,start

" indenting rules
set autoindent
set expandtab
set ts=4
set sw=4

" misc stuff
set ruler
set number

" searching
set nohlsearch
set infercase
set ignorecase
set smartcase

" show relative numbers in sidebar
set relativenumber

" splits and tabs
set splitright
set splitbelow

" folding
set foldlevel=99
set foldlevelstart=99
set foldmethod=indent
set foldcolumn=1

" no line wrapping
set nowrap

" enable mouse
set mouse=a

" clipboard
set clipboard^=unnamedplus

" highlight cursor
set cursorline

" project-specific config
set exrc
