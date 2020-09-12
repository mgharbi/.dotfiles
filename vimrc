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

" " TeX
" let g:polyglot_disabled = ['latex']
" let g:vimtex_fold_enabled=1

call plug#begin('~/.vim/plugged')

" Language server protocol
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" UI
Plug 'itchyny/lightline.vim'
Plug 'bagrat/vim-buffet'

" Snippets async
Plug 'vim-scripts/tComment'
Plug 'SirVer/ultisnips'
Plug 'mgharbi/vim-snippets'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'

" Plug 'maralla/completor.vim'
" Plug 'w0rp/ale'

Plug 'mbbill/undotree'

" Class and method list
Plug 'liuchengxu/vista.vim'

" Search
Plug 'rking/ag.vim'
Plug 'Chun-Yang/vim-action-ag'
Plug '~/.fzf'

Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'

Plug 'altercation/vim-colors-solarized'
Plug 'christoomey/vim-tmux-navigator'

" Git
Plug 'tpope/vim-fugitive'
Plug 'gregsexton/gitv'
Plug 'airblade/vim-gitgutter'

Plug 'godlygeek/tabular'

" Latex
Plug 'lervag/vimtex'

" Indent and syntax
Plug 'sheerun/vim-polyglot'

" Alternate header/src
Plug 'vim-scripts/a.vim', {'for': ['cpp', 'c']}

" Line-wrapping and text edit
Plug 'reedes/vim-pencil'



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
      \ 'enable' : {
      \     'tabline': 0
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
let g:lightline.enable.tabline = 0
let g:buffet_modified_icon	= ' +'


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

" Tabs and buffers handling
nnoremap <leader>q :tabp<CR>
nnoremap <leader>w :tabn<CR>
nnoremap <leader>e :tabnew %<CR>
" nnoremap <Tab> :bn<CR>
" nnoremap <S-Tab> :bp<CR>
" nnoremap <Leader><Tab> :bd<CR>


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

autocmd BufRead,BufNewFile *.tex set tw=80

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

" if executable('clangd')
"     augroup lsp_clangd
"         autocmd!
"         autocmd User lsp_setup call lsp#register_server({
"                     \ 'name': 'clangd',
"                     \ 'cmd': {server_info->['clangd']},
"                     \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
"                     \ })
"         autocmd FileType c setlocal omnifunc=lsp#complete
"         autocmd FileType cpp setlocal omnifunc=lsp#complete
"         autocmd FileType objc setlocal omnifunc=lsp#complete
"         autocmd FileType objcpp setlocal omnifunc=lsp#complete
"     augroup end
" endif

let g:lsp_diagnostics_echo_cursor = 1

" C++ LSP
if executable('ccls')
    augroup lsp_ccls
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'ccls',
                    \ 'cmd': {server_info->['ccls']},
                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
                    \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
                    \ 'initialization_options': {'cache': {'directory': '/tmp/ccls/cache' }, 'highlight': { 'lsRanges' : v:true }},
                    \ })
        " autocmd FileType c setlocal omnifunc=lsp#complete
        " autocmd FileType cpp setlocal omnifunc=lsp#complete
        " autocmd FileType objc setlocal omnifunc=lsp#complete
        " autocmd FileType objcpp setlocal omnifunc=lsp#complete
    augroup end
endif

" Latex LSP
if executable('texlab')
  au User lsp_setup call lsp#register_server({
        \ 'name': 'texlab',
        \ 'cmd': {server_info->['texlab']},
        \ 'config': {
        \     'hover_conceal': 0,
        \ },
        \ 'whitelist': ['bib','tex'],
        \ })
      autocmd FileType tex setlocal omnifunc=lsp#complete
endif

" Python LSP
" requires 'pip install python-language-server[all]'
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python', 'python3'],
        \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
        \ })
endif

let g:lsp_fold_enabled = 0

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    " nmap <buffer> gd <plug>(lsp-definition)
    " nmap <buffer> gr <plug>(lsp-references)
    " nmap <buffer> gi <plug>(lsp-implementation)
    " nmap <buffer> gt <plug>(lsp-type-definition)
    " nmap <buffer> <leader>rn <plug>(lsp-rename)
    " nmap <buffer> [g <Plug>(lsp-previous-diagnostic)
    " nmap <buffer> ]g <Plug>(lsp-next-diagnostic)
    "
    " nmap <buffer> K <plug>(lsp-hover)

    set foldmethod=expr
      \ foldexpr=lsp#ui#vim#folding#foldexpr()
      \ foldtext=lsp#ui#vim#folding#foldtext()

    " LSP shortcuts
    nnoremap <leader>g :LspDefinition<CR>
    nnoremap <leader>d :LspHover<CR>
    nnoremap <leader>r :LspNextDiagnostic<CR>
    nnoremap <leader>R :LspPreviousDiagnostic<CR>
    vnoremap <leader>f :LspDocumentRangeFormat<CR>
    nnoremap <leader>f :LspDocumentFormatSync<CR>

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" dictionary, source files, and completor to find matching words to complete.
" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
"
" function! Tab_Or_Complete() abort
"   " If completor is already open the `tab` cycles through suggested completions.
"   if pumvisible()
"     return "\<C-N>"
"   " If completor is not open and we are in the middle of typing a word then
"   " `tab` opens completor menu.
"   " elseif col('.')>1
"   elseif col('.')>1 && strpart(getline('.'), col('.')-2, 1) =~ '\w\|\.\|\:'
"     return "\<C-x>\<C-o>"
"     " return "\<C-R>=completor#do('complete')\<CR>"
"   else
"     " If we aren't typing a word and we press `tab` simply do the normal `tab`
"     " action.
"     return "\<Tab>"
"   endif
" endfunction

" Use `tab` key to select completions.  Default is arrow keys.
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

" " Use tab to trigger auto completion.  Default suggests completions as you type.
" let g:completor_auto_trigger = 1
" inoremap <expr> <Tab> Tab_Or_Complete()

" imap <c-space> <Plug>(asyncomplete_force_refresh)

let g:asyncomplete_auto_popup = 0

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

let g:UltiSnipsExpandTrigger="<C-J>"
call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))

" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

" Terminal within vim
nnoremap <leader>n :term<CR>

" Enablle gdb within vim
autocmd FileType c,cpp :packadd termdebug
autocmd FileType c,cpp nnoremap <leader>b :Break<CR>
autocmd FileType c,cpp nnoremap <leader>B :Clear<CR>
" Alternate cpp header/implementation
autocmd FileType c,cpp nnoremap <leader>s :A<CR>


" set foldmethod=indent


" " ALE
" let g:ale_linters = {
"       \ 'cpp': ['clangd', 'clangcheck'],
"       \}
" let g:ale_fixers = {
" \   '*': ['remove_trailing_lines', 'trim_whitespace'],
" \   'cpp': ['clang-format', 'clangtidy', 'uncrustify'],
" \   'python': ['reorder-python-imports', 'black']
" \}


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

" Debug layout
let g:termdebug_wide = 163
