" show matching brackets/parenthesis
set showmatch

" disable startup message
set shortmess+=I

" syntax highlighting
set termguicolors
let g:colors_name = 'dracula'
let g:dracula_colorterm = 0
syntax on
color dracula
filetype plugin on

" show line numbers
set number

" enable mouse
set mouse=a

" no line wrapping
set nowrap

" folding
set foldlevel=99
set foldlevelstart=99
set foldmethod=indent
set foldcolumn=1

" highlight cursor
set cursorline
