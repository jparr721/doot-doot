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

" Docstring support
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" Formatting
Plug 'ambv/black'

" Debugger support
Plug 'puremourning/vimspector'

" Better wildmenu
Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Builtin options for vimspector
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]

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
    \ 'coc-tsserver',
    \ 'coc-css',
    \ 'coc-rust-analyzer',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-gocode',
    \ 'coc-pyright',
    \ 'coc-clangd',
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
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Key maps for go-to-definition
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Vimspector
" Start Debugging
nmap <Leader>dc <Plug>VimspectorContinue

" Stop Debugging
nmap <Leader>ds <Plug>VimspectorStop

" Toggle Breakpoint
nmap <Leader>dt <Plug>VimspectorToggleBreakpoint

" Step Over
nmap <Leader>do <Plug>VimspectorStepOver

" Step Into
nmap <Leader>dd <Plug>VimspectorStepInto

" Step out
nmap <Leader>du <Plug>VimspectorStepOut

nmap <silent> <C-_> <Plug>(pydocstring)

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

"""""""""" Python
" Docstring generation for python
nmap <silent> <C-_> <Plug>(pydocstring)

autocmd BufWritePre *.py :silent call CocAction('runCommand', 'editor.action.organizeImport')
let g:pydocstring_formatter = 'google' " Sets the docstring generator to google style
