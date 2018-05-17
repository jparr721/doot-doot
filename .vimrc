call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/morhetz/gruvbox.git'
Plug 'https://github.com/w0rp/ale.git'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'https://github.com/yuttie/comfortable-motion.vim.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/cocopon/iceberg.vim.git'

call plug#end()
let g:deoplete#enable_at_startup = 1

"set term=xterm-256color
set t_Co=256
set encoding=utf-8
"set laststatus=2

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

colorscheme iceberg
" set background=dark
filetype plugin on

let g:go_disable_autoinstall = 0

" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']
let g:powerline_pycmd="py3"

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
let g:rustfmt_autosave = 1

" Deoplete
let g:deoplete#enable_at_startup = 1

" Airline
let g:airline_powerline_fonts = 1

" tagbar
nmap <F1> :TagbarToggle<CR>

" ctags
let g:tagbar_type_go = {
		\ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
	\ }

" Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Remove filthy whitespace
autocmd BufWritePre * :%s/\s\+$//e

" ALE autocomplete
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \}

 let g:ale_fix_on_save = 1
