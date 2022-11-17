let g:mapleader = "\<Space>"

set nocompatible

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

" [file explorer] ---------------------------------------

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

let g:NERDTreeHijackNetrw = 0
let g:ranger_replace_netrw = 1
nnoremap <silent> ;; :RangerWorkingDirectory<CR>

" [tmux navigator] ---------------------------------------

Plug 'lambdalisue/battery.vim'
let g:battery#update_tabline = 1 " For statusline.

" [tmux navigator] ---------------------------------------

Plug 'christoomey/vim-tmux-navigator'
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <C-j> :TmuxNavigateDown<CR>
nnoremap <silent> <C-k> :TmuxNavigateUp<CR>
nnoremap <silent> <C-l> :TmuxNavigateRight<CR>

" [dev-icons] ---------------------------------------

Plug 'kyazdani42/nvim-web-devicons' " for file icons

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
nnoremap <silent> ,, :Buffers<CR>
nnoremap <silent> <leader>w :Windows<CR>
nnoremap <silent> <leader>h :History<CR>
nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>

nnoremap <silent> <leader>gl :Commits<CR>
nnoremap <silent> <leader>ga :BCommits<CR>
nnoremap <silent> <leader>ft :Filetypes<CR>

imap <C-x><C-f> <plug>(fzf-complete-file-ag)
imap <C-x><C-l> <plug>(fzf-complete-line)
imap <c-x><c-f> <plug>(fzf-complete-path)

" [repeat] ---------------------------------------

Plug 'tpope/vim-repeat'

" [leap] ---------------------------------------

Plug 'ggandor/leap.nvim'

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

Plug 'sheerun/vim-polyglot'
Plug 'pangloss/vim-javascript'
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0
au BufNewFile,BufRead *.{ts},*.tsx setf javascript

" [markdown] ---------------------------------------

augroup Markdown
  autocmd!
  autocmd FileType markdown set wrap
augroup END

" [marks] ---------------------------------------

Plug 'jacquesbh/vim-showmarks'
autocmd VimEnter * DoShowMarks

" [buffers] ---------------------------------------

nnoremap <leader>bd :1,100bd<CR>

" [focus] ---------------------------------------

Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'

let g:goyo_linenr=1

nnoremap <silent> <C-g> :Goyo<CR>

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" [coc] ---------------------------------------

Plug 'neoclide/coc.nvim', {'branch': 'release'}
set updatetime=300 " faster updates for messages
set shortmess+=c   " don't give ins-completion-menu messages
set signcolumn=yes " always show sign columns

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-snippets', 'coc-prettier', 'coc-eslint']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.

inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=109 guibg=#13354A

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" [git] ---------------------------------------

Plug 'tpope/vim-fugitive'
Plug 'itchyny/vim-gitbranch'
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

let g:blamer_enabled = 1
let g:blamer_show_in_insert_modes = 0

" [lightline] ---------------------------------------

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline#extensions#tabline#enabled = 1

" [plug-end] ---------------------------------------

call plug#end()

" [leap (cont)] ---------------------------------------

lua require('leap').set_default_keymaps()

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

" [wrapping] ---------------------------------------
 
if &buftype == 'nofile'
  set linebreak
  set showbreak=+++
  set textwidth=80
endif

" [key-mappings] ---------------------------------------

nnoremap <leader>ve :tabedit $MYVIMRC<CR>
nnoremap <leader>vr :so $MYVIMRC<CR>
" Toggle quickfix
map <silent> <leader>f :copen<CR>

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

set termguicolors
colorscheme nord
