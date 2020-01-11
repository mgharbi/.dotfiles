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

" Language server protocol
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'


"  Plugins
Plug 'itchyny/lightline.vim'
Plug 'vim-scripts/tComment'
Plug 'SirVer/ultisnips'
Plug 'mgharbi/vim-snippets'
Plug 'maralla/completor.vim'
Plug 'w0rp/ale'
Plug 'bagrat/vim-workspace'
Plug 'mbbill/undotree'
" Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vista.vim'

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

" Latex
Plug 'lervag/vimtex'

" Indent and syntax
Plug 'sheerun/vim-polyglot'

" Alternate header/src
Plug 'vim-scripts/a.vim', {'for': ['cpp', 'c']}

" Line-wrapping and text edit
Plug 'reedes/vim-pencil'

" Plug 'xavierd/clang_complete'

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
"nnoremap <tab> %
"vnoremap <tab> %

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
nnoremap <leader>m :!make -j<CR>
nnoremap <leader><leader>m :!cd build && make -j<CR>

" Use Q for formatting the current paragraph (or selection)
vmap Q gq
nmap Q gqap

" Gitv
" nnoremap <leader>g :Gitv<CR>
nnoremap <leader>h :Gitv!<CR>

" Tabs handling
nnoremap <leader>q :tabp<CR>
nnoremap <leader>w :tabn<CR>
nnoremap <leader>e :tabnew<CR>
" nnoremap <leader>e :WSTabNew<CR>
" nnoremap <leader>r :tabclose<CR>
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

" Fuzzy search
nnoremap <leader>t :FZF<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g "" --ignore thirdparty'

" Tagbar
nnoremap <leader>l :Vista!!<CR>

" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.
" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
function! Tab_Or_Complete() abort
  " If completor is already open the `tab` cycles through suggested completions.
  if pumvisible()
    return "\<C-N>"
  " If completor is not open and we are in the middle of typing a word then
  " `tab` opens completor menu.
  " elseif col('.')>1
  elseif col('.')>1 && strpart(getline('.'), col('.')-2, 1) =~ '\w\|\.\|\:'
    return "\<C-x>\<C-o>"
    " return "\<C-R>=completor#do('complete')\<CR>"
  else
    " If we aren't typing a word and we press `tab` simply do the normal `tab`
    " action.
    return "\<Tab>"
  endif
endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

" Use tab to trigger auto completion.  Default suggests completions as you type.
let g:completor_auto_trigger = 0
inoremap <expr> <Tab> Tab_Or_Complete()

autocmd BufRead,BufNewFile *.tex set  tw=80

" Ignore these folders for fuzzy matching
set wildignore+=data/**,lib/**,build/**,import/**,log/**,external/**,output/**,doc/**,third_party/**,vendor/**,vendors/**
set wildmenu " show list instead of just completing
" command <Tab> completion, list matches, then longest common part, then all.
set wildmode=list:longest,full	

" Unbind run
let g:pymode_run_bind = ''

au BufRead,BufNewFile *.jinja set filetype=django

" Vertical vimdif
set diffopt+=vertical

set bg=dark

" Tab related
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Allow per-project .vimrc
set exrc
set secure

set guicursor=
autocmd OptionSet guicursor noautocmd set guicursor=

let g:gitgutter_sign_added = '.'
let g:gitgutter_sign_modified = '.'
let g:gitgutter_sign_removed = '.'

" C++ LSP
if executable('clangd')
    augroup lsp_clangd
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'clangd',
                    \ 'cmd': {server_info->['clangd']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
                    \ })
        autocmd FileType c setlocal omnifunc=lsp#complete
        autocmd FileType cpp setlocal omnifunc=lsp#complete
        autocmd FileType objc setlocal omnifunc=lsp#complete
        autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

" Enablle gdb within vim
autocmd FileType c,cpp :packadd termdebug
autocmd FileType c,cpp nnoremap <leader>b :Break<CR>
autocmd FileType c,cpp nnoremap <leader>B :Clear<CR>

" Python lsp
" requires 'pip install python-language-server'
" if executable('pyls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python', 'python3'],
"         \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
"         \ })
" endif

" LSP shortcuts
nnoremap <leader>g :LspDefinition<CR>
nnoremap <leader>d :LspHover<CR>
nnoremap <leader>r :LspNextError<CR>
nnoremap <leader>R :LspPreviousError<CR>

nnoremap <leader>n :term<CR>

" TeX
let g:polyglot_disabled = ['latex']
let g:vimtex_fold_enabled=1

" set foldmethod=indent
" set foldmethod=expr
"   \ foldexpr=lsp#ui#vim#folding#foldexpr()
"   \ foldtext=lsp#ui#vim#folding#foldtext()

" " ALE
let g:ale_linters = {
      \ 'cpp': ['clangd', 'clangcheck'],
      \}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'cpp': ['clang-format', 'clangtidy', 'uncrustify'],
\   'python': ['reorder-python-imports', 'black']
\}


" Symbol browser
let g:vista_icon_indent = ["▸ ", ""]
let g:vista#renderer#enable_icon = 0
let g:vista_executive_for = {
  \ 'cpp': 'vim_lsp',
  \ 'python': 'vim_lsp',
  \ }

function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" By default vista.vim never run if you don't call it explicitly.
"
" If you want to show the nearest function in your statusline automatically,
" you can add the following line to your vimrc 
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


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

" Debug layout
let g:termdebug_wide = 163

" Plugins debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = 'vim-lsp.log'
