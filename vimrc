" --------------------------------------------------------------------------
" File:    vimrc
" Author:  Michael Gharbi <gharbi@mit.edu>
" Created: 2015-01-22
" --------------------------------------------------------------------------
" 
" Plugins maintenance and goodies
" 
" -------------------------------------------------------------------------"



set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"
" let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" Plugins
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
Plugin 'gerw/vim-latex-suite'
Plugin 'tpope/vim-markdown'
Plugin 'edsono/vim-matchit'
Plugin 'vim-scripts/MatlabFilesEdition'
Plugin 'scrooloose/nerdtree'
Plugin 'klen/python-mode'
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
Plugin 'mgharbi/ultisnips'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'burnettk/vim-angular'
Plugin 'Lokaltog/vim-powerline'
Plugin 'xolox/vim-misc'
Plugin 'altercation/vim-colors-solarized'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'AndrewRadev/linediff.vim'

call vundle#end()


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
set smartindent		            " Indent settings (really only the cindent matters)
set viminfo='0,\"100,	        
set visualbell
set noerrorbells
set ttyfast
set lazyredraw
set textwidth=0 
set wrapmargin=0
set regexpengine=1


" Color, syntax, etc
syntax on                       " Use color syntax highlighting.
filetype plugin on
filetype indent on
let g:solarized_termtrans = 1
colorscheme solarized

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


" Tab related
set expandtab                   " Use spaces instead of tabs
set smarttab                    
set shiftwidth=4
set tabstop=4
set softtabstop=4

" cmake
autocmd BufRead,BufNewFile *.cmake,CMakeLists.txt setf cmake 

" compile
nnoremap <leader>m :!cd build && make<CR><CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Tag bar
nnoremap <leader>l :TagbarToggle<CR>

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

" YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/ycm/cpp/ycm/.ycm_extra_conf.py'

"IndentGuides
let g:indent_guides_auto_colors=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1

autocmd BufRead,BufNewFile *.tex set  tw=80

" Ignore these folders for fuzzy matching
set wildignore=data/**,lib/**,build/**,import/**,log/**,external/**,output/**,bin/**,doc/**,third_party/**
set wildmenu					" show list instead of just completing
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full	

" Powerline
let g:Powerline_symbols = 'fancy'
" let g:Powerline_theme = 'solarized256'
let g:Powerline_colorscheme = 'solarized256'
set laststatus=2

" Python
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

" Android
let g:syntastic_java_javac_classpath = "/Users/mgharbi/Documents/projects/xform_mobile/bin/mobile_local/classes:/usr/local/Cellar/android-sdk/24.1.2/platforms/android-21/*.jar:/Users/mgharbi/Documents/projects/xform_mobile/gen/mobile_local"

" Unbind run
let g:pymode_run_bind = ''
