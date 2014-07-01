" ==== VIM CONFIG ====
" M.Gharbi
" gharbi@mit.edu
" -------------------


" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
" execute pathogen#infect()
" call pathogen#helptags()
" call pathogen#runtime_append_all_bundles()

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-haml'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/closetag.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Raimondi/delimitMate'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'xolox/vim-easytags'
Plugin 'gregsexton/gitv'
Plugin 'mileszs/ack.vim'
Plugin 'tikhomirov/vim-glsl'
Plugin 'sjl/gundo.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'gerw/vim-latex-suite'
Plugin 'tpope/vim-markdown'
Plugin 'edsono/vim-matchit'
Plugin 'vim-scripts/MatlabFilesEdition'
Plugin 'scrooloose/nerdtree'
Plugin 'benzheren/vim-python'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/rubycomplete.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'tristen/vim-sparkup'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/tComment'
Plugin 'marijnh/tern_for_vim'
Plugin 'mgharbi/ultisnips'
Plugin 'pangloss/vim-javascript'
Plugin 'xolox/vim-misc'
Plugin 'altercation/vim-colors-solarized'

Plugin 'git://git.wincent.com/command-t.git'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" General config
set term=xterm-256color
set encoding=utf-8
set number                      " line numbering
set printoptions=number:y
set clipboard=unnamed           
set nocp                        " disable compatible mode
set history=1000               
set foldenable                  " auto fold code
set ai                          " Auto indent
set si                          " Smart indent
set nowrap                      " Wrap lines
set lbr                         " Linebreak on 500 characters
set cursorline                  " highlight current line
set autoindent
set backspace=indent,eol,start	
set cindent
set cinkeys=0{,0},:,!^F,o,O,e	
set fileformat=unix	            
set listchars=tab:\ \ ,trail:�  
set nobackup		            " Don't use a backup file (also see writebackup)
set nojoinspaces	            " One space after a "." rather than 2
set ruler		                " Show the line position at the bottom of the window
set scrolloff=1		            " Minimum lines between cursor and window edge
set showcmd		                " Show partially typed commands
set showmatch		            " Show parentheses matching
set smartindent		            " Indent settings (really only the cindent matters)
set textwidth=80	           
set viminfo='0,\"100,	        
set writebackup		            " Write temporary backup files in case we crash
set visualbell
set noerrorbells
set ttyfast
set lazyredraw
set regexpengine=1


" Color, syntax, etc
syntax on                       " Use color syntax highlighting.
filetype plugin on
filetype indent on
if has("gui_running")
    colorscheme solarized
else
    colorscheme mika
endif
" Highlight long lines:
highlight OverLength ctermbg=darkred ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


" Setting up the undo/history 
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


" Tab related
set expandtab                   " Use spaces instead of tabs
set smarttab                    
set shiftwidth=4
set tabstop=4
set softtabstop=4

" cmake
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt setf cmake 

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Tag bar
nnoremap <leader>l :TagbarToggle<CR>

" Nerd Tree
nnoremap <leader>r :NERDTreeToggle<CR>

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

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/ycm/cpp/ycm/.ycm_extra_conf.py'

"IndenGuides
let g:indent_guides_auto_colors=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1


""""""""""""""""""""""""""""""
"Temporary settings
""""""""""""""""""""""""""""""
set wildignore=data/**,lib/**,build/**,import/**,log/**,external/**,output/**,bin/**,doc/**
set wildmenu					" show list instead of just completing
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full	

