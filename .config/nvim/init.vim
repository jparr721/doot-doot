let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Editor Configs
Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'

" Color Schemes
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'

" Languages
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Docstring support
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" Better wildmenu
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Wilder
call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Down>',
      \ 'reject_key': '<Up>',
      \ })

" Autocomplete and plugins
let g:coc_global_extensions = [
    \ 'coc-pyright',
    \ 'coc-clangd',
    \ 'coc-rust-analyzer',
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

" Set Tab Size
set ts=4
set expandtab
set shiftwidth=4

" Turn on the mouse
set mouse=a

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
map <C-n> <cmd>CHADopen<cr>

" Key maps for escape
imap jk <Esc>
imap kj <Esc>

" Key maps for navigation within a pane.
" Navigate visual lines instead of logical ones
nmap j gj
nmap k gk

" Use H and L to go to end/beginning of lines
nmap H ^
nmap L $

" Remove search highlights
nmap <F9> :nohl

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Open terminal
command! -nargs=* T belowright split | resize 10 | terminal <args>
command! -nargs=* VT vsplit | terminal <args>

" Key maps for go-to-definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)

" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

set background=dark
colorscheme everforest
filetype plugin on

""""""""""" Airline
let g:airline_powerline_fonts = 1

"""""""""" Python
" Docstring generation for python
nmap <silent> <C-_> <Plug>(pydocstring)

autocmd BufWritePre *.py :silent call CocAction('runCommand', 'editor.action.organizeImport')
let g:pydocstring_formatter = 'google' " Sets the docstring generator to google style

"""""""""" Telescope
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

"""""""""" Vim-Commentary
autocmd FileType objc,objcpp,c,cpp,cs,java setlocal commentstring=//\ %s
