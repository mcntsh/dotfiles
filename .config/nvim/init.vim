call plug#begin('$HOME/.config/nvim/plugged')

" UI
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'

" Navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'w0rp/ale'

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'wokalski/autocomplete-flow'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'SirVer/ultisnips'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

let g:python3_host_prog = '/usr/local/bin/python3'
let g:python_host_prog = '/usr/local/bin/python'

filetype plugin indent on
set autoindent
set ruler
set number
set hlsearch
set nowrap
set splitright
set splitbelow
set tabstop=2
set shiftwidth=0 " Always have the same value with `tabstop`
set softtabstop=-1 "Always have the same value with `shiftwidth`set expandtab
set cursorline
set clipboard+=unnamedplus
set hidden
set ignorecase
set smartcase
set relativenumber
set termguicolors
set nofoldenable
set foldlevel=99
set foldminlines=99
set foldlevelstart=99

set background=dark
let g:colors_name = 'dracula'
let g:dracula_colorterm = 0
colorscheme dracula

syntax on
color dracula

" Utility
let mapleader = ','
nnoremap <Leader>, :w<CR>
inoremap <Leader>, <Esc>:w<CR>gi

inoremap jj <Esc>

" UltiSnips configs
let g:UltiSnipsSnippetsDir = '~/.nvim/UltiSnips'
let g:UltiSnipsExpandTrigger = '<nop>'
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"

" Deoplete configs
let g:deoplete#enable_at_startup = 1
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Airline configs
let g:airline_powerline_fonts = 1

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1
let NERDTreeIgnore = [
      \ '^\~$[[dir]]',
      \ '^\.git$[[dir]]',
      \ '^\.o$[[file]]',
      \ '^\.pyc$[[file]]',
      \ '^\.DS_Store$[[file]]',
      \ ]
let g:loaded_netrwPlugin = 1
autocmd FileType netrw set nolist
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

function! OpenNerdTree()
  if &modifiable && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
  else
    NERDTreeToggle
  endif
endfunction
nnoremap <silent> <C-\> :call OpenNerdTree()<CR>

" Commenter configs
let g:NERDCompactSexyComs = 1
let g:NERDSpaceDelims = 1

" FZF configs
nnoremap <leader>p :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Ag<CR>

" Prettier configs
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue PrettierAsync

" Ale configs
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = {
\   'javascript': [ 'eslint', 'flow' ]
\ }
nmap <silent> <leader>aj :ALENext<CR>
nmap <silent> <leader>ak :ALEPrevious<CR>

" EasyMotion configs
let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

map <Space> <Plug>(easymotion-j)
map <S-Space> <Plug>(easymotion-k)

" Edit and source configs
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" Tmux navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

