if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $HOME/.config/nvim/init.vim
endif

call plug#begin('~/.vim/plugged')
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Editor Configs
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'

" Color Schemes
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'overcache/NeoSolarized'

" Google plugins
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" Languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}

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
    \ 'coc-gocode',
    \ 'coc-vimtex'
    \ ]

" Use system clipboard
set clipboard+=unnamedplus

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
set smartindent          " match previous indent line
set smartcase
set autoread             " auomatically reload files
set backspace=indent,eol,start
set termguicolors
set completeopt-=preview
autocmd BufWritePre * :%s/\s\+$//e " Remove filthy whitespace


" Key maps for moving around panes.
map<C-h> <C-w>h
map<C-j> <C-w>j
map<C-k> <C-w>k
map<C-l> <C-w>l
map<C-n> :NERDTreeToggle<CR>

" Key maps for go-to-definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

set background=dark
colorscheme gruvbox
filetype plugin on

""""""""""" Airline
let g:airline_powerline_fonts = 1

""""""""""" Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"""""""""" Rust
" Rust code style guidelines
au Filetype rust set colorcolumn=100

"""""""""" Go
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.formatOnSave')
