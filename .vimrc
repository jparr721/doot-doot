call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/w0rp/ale.git'
Plug 'https://github.com/yuttie/comfortable-motion.vim.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/cocopon/iceberg.vim.git'
Plug 'ternjs/tern_for_vim', { 'for': 'javascript' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'sudo npm i -g tern' }
Plug 'vim-airline/vim-airline-themes'
Plug 'leafgarland/typescript-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ajmwagar/vim-deus'
Plug 'vim-latex/vim-latex'
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'Valloric/YouCompleteMe'
Plug 'rhysd/vim-clang-format'
Plug 'szymonmaszke/vimpyter'
Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }
Plug 'junegunn/goyo.vim'
Plug 'ambv/black'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" Use system clipboard
set clipboard=unnamedplus

" Prettier config
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.json,*.css,*.scss,*.less,*.graphql,*.ts PrettierAsync

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  " autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer prettier
  autocmd FileType java AutoFormatBuffer google-java-format
  " autocmd FileType python AutoFormatBuffer black
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  " autocmd FileType vue AutoFormatBuffer prettier
augroup END

" Turn on Deoplete at startup
let g:deoplete#enable_at_startup = 1

" Airline theme
let g:airline_theme='bubblegum'

set t_Co=256
set encoding=utf-8

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

colorscheme deus
set background=dark
filetype plugin on

" Vim-Latex
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

" Vim-go
let g:go_fmt_command = "goimports"
let g:go_bin_path = $HOME."/Code/go/bin"

" Vim-rust
let g:rustfmt_autsoave = 1

let g:powerline_pycmd="py3"

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>

" Vim-python
autocmd BufWritePost *.py silent! execute ':Black'
let g:black_linelength = 79

" Make it work with airline and be pretty
" Error and warning signs.
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '?'

" Enable integration with airline.
let g:airline#extensions#ale#enabled = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Airline
let g:airline_powerline_fonts = 1

" Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Remove filthy whitespace
autocmd BufWritePre * :%s/\s\+$//e

let b:ale_linters = ['flake8', 'pylint']
let b:ale_fixers = ['autopep8', 'yapf']

" ALE autocomplete
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \}

let g:ale_fix_on_save = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#filetypes = [
  \ 'jsx',
  \ 'javascript.jsx',
  \ 'vue',
  \ 'js',
  \ 'mjs'
  \]

" Typescript options
let g:typescript_indent_disable = 1

let g:typescript_indent_disable = 1
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''

set completeopt-=preview
