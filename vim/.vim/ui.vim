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

" no line wrapping
set nowrap

" no folding
set nofoldenable
set foldlevel=99
set foldminlines=99
set foldlevelstart=99

" highlight cursor
set cursorline
