set nocompatible

filetype on
filetype off
filetype plugin indent on
" Set basic mouse behaviour
set mouse=a
if exists('$TMUX')
  set ttymouse=xterm2
endif
" Setup vim-plug
call plug#begin()

Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'autozimu/LanguageClient-neovim', { 'branch' : 'next', 'do': 'bash install.sh' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'slashmili/alchemist.vim'
Plug 'plasticboy/vim-markdown'
call plug#end()

let g:LanguageClient_serverCommands = {
	\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
        \ 'haskell': ['hie-wrapper'],
        \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
        \ 'python': ['pyls'],
	\ }

let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <leader>l :Align
noremap <leader>b :CtrlPBuffer<CR>
noremap <leader>d :NERDTreeToggle<CR>
noremap <leader>f :NERDTreeFind<CR>
noremap <leader>t :CtrlP<CR>
noremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
noremap <leader>j :TagbarToggle<CR>
noremap <leader>gs :Gstatus<CR>
noremap <leader>gd :Gdiff<CR>
noremap <leader>gc :Gcommit<CR>
noremap <leader>gp :Gpush<CR>
nnoremap <leader>gg :GitGutterToggle<CR>
noremap <leader>pu :PlugUpdate<CR>
noremap <leader>pi :PlugInstall<CR>
noremap <silent> <leader>V :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'init.vim reloaded'"<CR>

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call Languageclient#textDocument_rename()<CR>
set rnu
set nu
set autoindent
set autoread
set backspace=2
set backupcopy=yes
set clipboard=unnamed
set directory-=.
set encoding=utf-8
set expandtab
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫
set number
set ruler
set scrolloff=3
set shiftwidth=2
set showcmd
set smartcase
set softtabstop=2
set tabstop=8
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu
set wildmode=longest,list,full

autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
autocmd FileType haskell setlocal omnifunc=LanguageClient#complete

autocmd BufEnter * call ncm2#enable_for_buffer()

set completeopt=noinsert,menuone,noselect

inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
inoremap <expr> <TAB> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "<C-p>" : "\<S-Tab>"

syntax enable
if has('gui_running')
	set background=light
else
	set background=dark
endif
colorscheme solarized

" setup fenced languages
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'haskell', 'ruby', 'elixir']

" Filetypes
" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

autocmd VimResized * :wincmd =
