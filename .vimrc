"set term=xterm-256color
set t_Co=256
"set laststatus=2

set nocompatible
set cindent
syntax on
set listchars=tab:▸\ ,eol:⏎,extends:☢,nbsp:♞,trail:☭
set ts=4
set expandtab
set shiftwidth=4
set list
set nu
set rnu
set smartindent
set smartcase
map<C-h> <C-w>h
map<C-j> <C-w>j
map<C-k> <C-w>k
map<C-l> <C-w>l


execute pathogen#infect()
"	autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

colorscheme gruvbox
set background=dark

" use goimports for formatting
let g:go_fmt_command = "goimports"

" turn highlighting on
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:syntastic_go_checkers = ['go', 'golint', 'errcheck']

" Open go doc in vertical window, horizontal, or tab
au Filetype go nnoremap <leader>v :vsp <CR>:exe "GoDef" <CR>
au Filetype go nnoremap <leader>s :sp <CR>:exe "GoDef"<CR>
au Filetype go nnoremap <leader>t :tab split <CR>:exe "GoDef"<CR>
let g:rustfmt_autosave = 1

set rtp+=/usr/lib/python3.6/site-packages/powerline/bindings/vim/
set laststatus=2
