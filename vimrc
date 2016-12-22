" --------------------------------------------------------------------------
" File:    vimrc
" Author:  Michael Gharbi <gharbi@mit.edu>
" Created: 2015-01-22
" --------------------------------------------------------------------------
" 
" Plugins maintenance and goodies
" 
" -------------------------------------------------------------------------"



set nocompatible " be iMproved
filetype off     " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'

Plugin 'vim-scripts/tComment'
Plugin 'mgharbi/ultisnips'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'godlygeek/tabular'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'mileszs/ack.vim'
Plugin 'gregsexton/gitv'
Plugin 'sjl/gundo.vim'
Plugin 'google/vim-ft-bzl'
Plugin 'Valloric/YouCompleteMe'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/MatlabFilesEdition'

call vundle#end()


" General config
set term=xterm-256color
set encoding=utf-8
set number                      " line numbering
set printoptions=number:y
set clipboard=unnamed           
set ai                          " Auto indent
set si                          " Smart indent
set nowrap                      " Wrap lines
set lbr                         " Linebreak on 500 characters
set cursorline                  " highlight current line
set backspace=indent,eol,start	
set cindent
set cinkeys=0{,0},:,!^F,o,O,e	
set fileformat=unix	            
set listchars=tab:\ \ ,trail:�  
set nojoinspaces	            " One space after a "." rather than 2
set ruler		                " Show the line position at the bottom of the window
set scrolloff=1		            " Minimum lines between cursor and window edge
set showcmd		                " Show partially typed commands
set showmatch		            " Show parentheses matching
set viminfo='0,\"100,	        
set noerrorbells
set textwidth=0 
set wrapmargin=0
set ttyfast
set lazyredraw
set regexpengine=1

" Color, syntax, etc
syntax on                       " Use color syntax highlighting.
filetype plugin on
filetype indent on
let g:solarized_termtrans=1
colorscheme solarized
set bg=dark

" Undo/history 
set history=1000
set undolevels=1000           
set nobackup                    " seriously, use a VCS
set nowritebackup
set noswapfile                  " they are really annoying...

"Search options
nnoremap / /\v
vnoremap / /\v
nmap <silent> ,/ :nohlsearch<CR>
set ignorecase                  " case insensitive search
set smartcase
set incsearch                   " find as you type search
set gdefault                    " global search and replace
set hlsearch		            " highlight search terms

" Convenience remapping 
inoremap jj <ESC>
let mapleader = ","
nnoremap ; :

" De-activate arrowkeys, because har'core is better and faster
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Remap tab in normal and visual
nnoremap <tab> %
vnoremap <tab> %

" Easy window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
let g:C_Ctrl_j = 'off'

" Stupid shift key fixes
if !exists('g:spf13_no_keyfixes')
    if has("user_commands")
        command! -bang -nargs=* -complete=file E e<bang> <args>
        command! -bang -nargs=* -complete=file W w<bang> <args>
        command! -bang -nargs=* -complete=file Wq wq<bang> <args>
        command! -bang -nargs=* -complete=file WQ wq<bang> <args>
        command! -bang Wa wa<bang>
        command! -bang WA wa<bang>
        command! -bang Q q<bang>
        command! -bang QA qa<bang>
        command! -bang Qa qa<bang>
    endif
    cmap Tabe tabe
endif

" cmake
au BufRead,BufNewFile *.cmake,CMakeLists.txt setf cmake 

" compile
nnoremap <leader>m :!make<CR>
" nnoremap <leader>m :!cd build && make<CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Nerd Tree
nnoremap <leader>r :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.pyc$']

" Gitv
nnoremap <leader>g :Gitv<CR>
nnoremap <leader>h :Gitv!<CR>

" Tabs handling
nnoremap <leader>q :tabp<CR>
nnoremap <leader>w :tabn<CR>
nnoremap <leader>e :tabnew<CR>

" Alternate cpp header/implementation
nnoremap <leader>s :A<CR>

"Gundo , undo tree
nnoremap <leader>z :GundoToggle<CR>

" call Ack
nnoremap <leader>a :Ack 

" Tcomment
nnoremap <leader>c<space> :TComment<CR>
vnoremap <leader>c<space> :TComment<CR>

" CtrlP
nnoremap <leader>t :CtrlPMixed<CR>

" Tagbar
nnoremap <leader>l :Tagbar<CR>

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/ycm/cpp/ycm/.ycm_extra_conf.py'

autocmd BufRead,BufNewFile *.tex set  tw=80

" Ignore these folders for fuzzy matching
set wildignore=data/**,lib/**,build/**,import/**,log/**,external/**,output/**,bin/**,doc/**,third_party/**
set wildmenu					" show list instead of just completing
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full	

" Vertical vimdif
set diffopt+=vertical

set bg=dark

" Tab related
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
