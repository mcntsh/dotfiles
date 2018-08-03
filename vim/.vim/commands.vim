" remap leader to comma
let mapleader = ','

" double leader writes a buffer
nnoremap <Leader>, :w<CR>
inoremap <Leader>, <Esc>:w<CR>gi

" re-bind escape
inoremap jj <Esc>

" folding
nnoremap - za
nnoremap _ zM
nnoremap + zR
