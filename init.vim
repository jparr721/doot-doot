call plug#begin('~/.vim/plugged')
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Editor Configs
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'yuttie/comfortable-motion.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'

" Color Schemes
Plug 'ajmwagar/vim-deus'

" Google plugins
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'leafgarland/typescript-vim'       " Typescript
Plug 'arzg/vim-rust-syntax-ext'         " Rust
Plug 'ron-rs/ron.vim'                   " Rust object notation

" Formatting
Plug 'ambv/black'
call plug#end()

" Autocomplete and plugins
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-rust-analyzer',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-vimtex'
    \ ]

" Use system clipboard
set clipboard=unnamedplus

augroup autoformat_settings
  autocmd!
  autocmd FileType c,cpp,proto AutoFormatBuffer clang-format
  autocmd FileType html,css,sass,scss,less,json,javascript,typescript AutoFormatBuffer prettier
  autocmd FileType python AutoFormatBuffer black
augroup END

" Airline theme
let g:airline_theme='bubblegum'

" GUI Settings
set synmaxcol=500        " no syntax highlight on long lines for perf.
set lazyredraw           " reduce updates while not typing
set nocompatible
set cindent
syntax on
set ts=2
set expandtab
set shiftwidth=2
set nu
set rnu
set smartindent
set smartcase

map<C-h> <C-w>h
map<C-j> <C-w>j
map<C-k> <C-w>k
map<C-l> <C-w>l
map <C-n> :NERDTreeToggle<CR>
set backspace=indent,eol,start

set background=dark
colorscheme deus
filetype plugin on

""""""""""" Vim-python
autocmd BufWritePost *.py silent! execute ':Black'
let g:black_linelength = 79

"""""""""""" Ale
let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']
let g:ale_fix_on_save = 1

" Make it work with airline and be pretty
" Error and warning signs.
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '?'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

""""""""""" Airline
let g:airline_powerline_fonts = 1

""""""""""" Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


""""""""""" Typescript options
let g:typescript_indent_disable = 1
let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

set completeopt-=preview

" Remove filthy whitespace
autocmd BufWritePre * :%s/\s\+$//e

"""""""""" Rust
" Rust code style guidelines
au Filetype rust set colorcolumn=100
