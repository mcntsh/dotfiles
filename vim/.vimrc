let g:mapleader = "\<Space>"

" [plug-start] ---------------------------------------
 
if empty(glob('~/.nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('$HOME/.vim/plugged')  " Plugins initialization start {{{

" [theme] ---------------------------------------

Plug 'arcticicestudio/nord-vim'
set t_Co=256
syntax on
set cursorline     " highlight current line

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" [indentation] ---------------------------------------

Plug 'Yggdroot/indentLine'
set expandtab     " replace <Tab with spaces
set tabstop=2     " number of spaces that a <Tab> in the file counts for
set softtabstop=2 " remove <Tab> symbols as it was spaces
set shiftwidth=2  " indent size for << and >>
set shiftround    " round indent to multiple of 'shiftwidth' (for << and >>)


" [tmux navigator] ---------------------------------------

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" [dev-icons] ---------------------------------------

Plug 'kyazdani42/nvim-web-devicons' " for file icons

" [nvim-tree] ---------------------------------------

Plug 'kyazdani42/nvim-tree.lua'
let g:loaded_netrw = 1 " Disable netrw
let g:nvim_tree_auto_open = 1
let g:nvim_tree_auto_close = 1
 
" [lightline] ---------------------------------------

Plug 'itchyny/lightline.vim'
set noshowmode
let g:lightline = {
\   'colorscheme': 'nord',
\ }

" [searching] ---------------------------------------

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

set ignorecase " ignore case of letters
set smartcase  " override the 'ignorecase' when there is uppercase letters
set gdefault   " when on, the :substitute flag 'g' is default on


let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*" --glob "!node_modules/*"'
let g:fzf_nvim_statusline = 0 " disable statusline overwriting
set grepprg=rg\ --vimgrep

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Label'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Label'],
  \ 'info':    ['fg', 'Comment'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Function'],
  \ 'pointer': ['fg', 'Statement'],
  \ 'marker':  ['fg', 'Conditional'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <silent> <leader><space> :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>; :BLines<CR>
nnoremap <silent> <leader>o :BTags<CR>
nnoremap <silent> <leader>O :Tags<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
nnoremap <silent> <leader>. :RgFolder<CR> 

nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-path)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case --only-matching '. <q-args>, 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
command! -bang -nargs=* RgFolder :call FZF_Folder_Actions()

function! FZF_Folder_Actions()
  function! s:list_folders()
    return split(system('fd -t d .'), '\n')
  endfunction

  function! s:search_folder(folder)
    execute 'Rg ' . input(a:folder . ' Ag/') . ' ' . a:folder

    if has('nvim')
      call feedkeys('i', 'n')
    endif
  endfunction

  call fzf#run(fzf#wrap({
    \ 'source': <sid>list_folders(),
    \ 'sink': {folder -> s:search_folder(folder)},
    \ 'down':    '40%' }))
endfunction

" [easy-motion] ---------------------------------------

Plug 'Lokaltog/vim-easymotion'
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
let g:EasyMotion_off_screen_search = 0
nmap ; <Plug>(easymotion-s2)

" [clever-f] ---------------------------------------

Plug 'rhysd/clever-f.vim'
let g:clever_f_across_no_line = 1

" [tcomment] ---------------------------------------

Plug 'tomtom/tcomment_vim'

" [surrounding] ---------------------------------------

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" [emmet] ---------------------------------------

Plug 'mattn/emmet-vim'
let g:user_emmet_expandabbr_key = '<c-e>'

" [syntax-highlighting] ---------------------------------------

Plug 'jparise/vim-graphql'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
let g:vim_json_syntax_conceal = 0
let g:javascript_plugin_flow = 1
let g:vim_json_syntax_conceal = 0 
let g:jsx_ext_required = 0
au BufNewFile,BufRead *.{ts},*.tsx setf javascript

" [prettier] ---------------------------------------

Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.ts,.jsx,*.json,*.css,*.scss,*.less,*.graphql Prettier

" [coc] ---------------------------------------

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set updatetime=300 " faster updates for messages
set shortmess+=c   " don't give ins-completion-menu messages
set signcolumn=yes " always show sign columns

let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-git', 'coc-explorer', 'coc-snippets', 'coc-prettier', 'coc-git']

" Tab/backspace QOL
inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion,
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Git helpers
nmap <silent> <leader>gh :CocCommand git.browserOpen<CR>
nmap <silent> <leader>gc :CocCommand git.showCommit<CR>

"Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" [plug-end] ---------------------------------------

call plug#end()

" [general-settings] ---------------------------------------

set shortmess+=I
set clipboard=unnamed,unnamedplus
set number         " show line numbers
set relativenumber " use relative lines numbering by default
set noswapfile     " disable creating of *.swp files
set hidden         " hide buffers instead of closing
set lazyredraw     " speed up on large files
set mouse=a        " enable mouse
set scrolloff=999       " always keep cursor at the middle of screen
set virtualedit=onemore " allow the cursor to move just past the end of the line
set undolevels=5000     " set maximum undo levels

" ! save global variables that don't contains lowercase letters
" h disable the effect of 'hlsearch' when loading the viminfo
" f1 store marks
" '100 remember 100 previously edited files
set viminfo=!,h,f1,'100
set nohlsearch

" ignore pattern for wildmenu
set wildignore+=*.a,*.o,*.pyc,*~,*.swp,*.tmp
set wildmode=list:longest,full

set list " show hidden characters
set listchars=tab:•·,trail:·,extends:❯,precedes:❮,nbsp:×

set laststatus=2 " always show status line
set showcmd      " always show current command

set nowrap        " disable wrap for long lines
set textwidth=0   " disable auto break long lines

" [key-mappings] ---------------------------------------

nnoremap <leader>ve :tabedit $MYVIMRC<CR>
nnoremap <leader>vr :so $MYVIMRC<CR>
" Toggle quickfix
map <silent> <leader>f :copen<CR>

" Quick way to save file
nnoremap ,, :w<CR>
inoremap ,, <Esc>:w<CR>gi

" re-bind escape
inoremap jj <Esc>

" folding
nnoremap - za
nnoremap _ zM
nnoremap + zR

set foldlevel=20
set foldmethod=syntax

" Copy current file path to clipboard
nnoremap <leader>% :call CopyCurrentFilePath()<CR>
function! CopyCurrentFilePath()
  let @+ = expand('%')
  echo @+
endfunction

" Keep search results at the center of screen
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Select all text
noremap vA ggVG

" Switch between tabs
nmap <leader>1 1gt
nmap <leader>2 2gt
nmap <leader>3 3gt
nmap <leader>4 4gt
nmap <leader>5 5gt
nmap <leader>6 6gt
nmap <leader>7 7gt
nmap <leader>8 8gt
nmap <leader>9 9gt

set termguicolors
colorscheme nord
