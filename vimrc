" --------------------------------------------------------------------------
" File:    vimrc
" Author:  Michael Gharbi <gharbi@mit.edu>
" Created: 2015-01-22
" --------------------------------------------------------------------------
" 
" Plugins maintenance and goodies
" 
" -------------------------------------------------------------------------"

set colorcolumn=80

set nocompatible " be iMproved
filetype off     " required

" Load Plug
if empty(glob("~/.vim/autoload/plug.vim"))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

"  Plugins
Plug 'tpope/vim-eunuch'
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/tComment'
Plug 'SirVer/ultisnips'
Plug 'mgharbi/vim-snippets'
Plug 'maralla/completor.vim'
Plug 'w0rp/ale'
Plug 'bagrat/vim-workspace'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'

" Search
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug '~/.fzf'

Plug 'airblade/vim-gitgutter'

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'

Plug 'godlygeek/tabular'

" Indent and syntax
Plug 'sheerun/vim-polyglot'

" Alternate header/src
Plug 'vim-scripts/a.vim', {'for': ['cpp', 'c']}

filetype plugin indent on
call plug#end()

set noshowmode
set laststatus=2
let g:lightline = {
     \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste'],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ],
      \              [ 'percent' ],
      \              [ 'filetype'], ['charvaluehex' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

" Plug 'vim-scripts/MatlabFilesEdition', {'for': 'matlab'}
" Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
" Plug 'Lokaltog/vim-easymotion'
" Plug 'google/vim-ft-bzl'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'nvie/vim-flake8'
" Plugin 'mhinz/vim-startify'
" Plugin 'ryanoasis/vim-devicons'


" let g:ycm_filetype_specific_completion_to_disable = { 'python' : 1 }
" let g:ycm_filetype_blacklist = { 'python' : 1 }
"
" Folding
set foldlevel=99
nnoremap <space> za

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
let python_highlight_all=1
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

" " Nerd Tree
" nnoremap <leader>r :NERDTreeToggle<CR>
" let NERDTreeIgnore = ['\.pyc$']

" Gitv
nnoremap <leader>g :Gitv<CR>
nnoremap <leader>h :Gitv!<CR>

" Tabs handling
nnoremap <leader>q :tabp<CR>
nnoremap <leader>w :tabn<CR>
" nnoremap <leader>e :tabnew<CR>
nnoremap <leader>e :WSTabNew<CR>
nnoremap <leader>r :tabclose<CR>
nnoremap <leader>1 :WSPrev<CR>
nnoremap <leader>2 :WSNext<CR>
nnoremap <leader>3 :WSClose<CR>

" Alternate cpp header/implementation
nnoremap <leader>s :A<CR>

"Gundo , undo tree
nnoremap <leader>z :UndotreeToggle<CR>

" call Ack
nnoremap <leader>a :Ag 

" Tcomment
nnoremap <leader>c<space> :TComment<CR>
vnoremap <leader>c<space> :TComment<CR>

" CtrlP
" nnoremap <leader>t :CtrlPMixed<CR>
nnoremap <leader>t :FZF<CR>

" Tagbar
nnoremap <leader>l :Tagbar<CR>

" YCM
" let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/ycm/cpp/ycm/.ycm_extra_conf.py'
" nnoremap <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap <leader>d :YcmCompleter GetDoc<CR>
nnoremap <leader>g :call completor#do('definition')<CR>
nnoremap <leader>d :call completor#do('doc')<CR>
let g:completor_doc_position='top'

" Fugitive
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gc :Gcommit<CR>
nnoremap <leader>gl :Glog<CR>

autocmd BufRead,BufNewFile *.tex set  tw=80

" Ignore these folders for fuzzy matching
set wildignore+=data/**,lib/**,build/**,import/**,log/**,external/**,output/**,bin/**,doc/**,third_party/**
set wildmenu					" show list instead of just completing
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full	
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|o|d)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Unbind run
let g:pymode_run_bind = ''

au BufRead,BufNewFile *.jinja set filetype=django

" Vertical vimdif
set diffopt+=vertical

set bg=dark

" Tab related
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2

let g:completor_clang_binary='clang'

" "python with virtualenv support
" py << EOF
" import os
" import sys
" if 'VIRTUAL_ENV' in os.environ:
"   project_base_dir = os.environ['VIRTUAL_ENV']
"   activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"   execfile(activate_this, dict(__file__=activate_this))
" EOF

" Allow per-project .vimrc
set exrc
set secure

" Pencil for text editing
augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

set foldmethod=indent

set guicursor=
autocmd OptionSet guicursor noautocmd set guicursor=

let g:gitgutter_sign_added = '.'
let g:gitgutter_sign_modified = '.'
let g:gitgutter_sign_removed = '.'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_modified_removed = 'ww'

