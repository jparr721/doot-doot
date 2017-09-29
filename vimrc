set term=xterm-256color
set laststatus=2

set nocompatible
set cindent
syntax on
set listchars=tab:▸\ ,eol:⏎,extends:☢,nbsp:♞,trail:☭
set ts=8
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

colo deus
set background=dark

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
