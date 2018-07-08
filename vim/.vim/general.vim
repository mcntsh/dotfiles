" use vim settings, rather than vi settings
set nocompatible

" security
set modelines=0

" hide buffers, not close them
set hidden

" maintain undo history between sessions
set undofile
set undodir=~/.vim/undo
set noswapfile

" make backspace behave in a sane manner
set backspace=indent,eol,start

" indenting rules
set autoindent

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

" clipboard
set clipboard^=unnamedplus
