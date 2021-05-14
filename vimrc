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

" set updatetime=300

" Load Plug
if empty(glob("~/.vim/autoload/plug.vim"))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" TeX
let g:polyglot_disabled = ['latex', 'html']
let g:vimtex_fold_enabled=0
let g:cpp_fold_enabled=1

set redrawtime=5000

call plug#begin('~/.vim/plugged')

" Language server protocol
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'jackguo380/vim-lsp-cxx-highlight'

" Debugger
Plug 'puremourning/vimspector'

" Code folding
Plug 'Konfekt/FastFold'

" UI
Plug 'itchyny/lightline.vim'
Plug 'bagrat/vim-buffet'

" Snippets async
Plug 'vim-scripts/tComment'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'

" Undos
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
Plug 'keith/swift.vim'
Plug 'kentaroi/ultisnips-swift'

Plug 'alvan/vim-closetag'

" Alternate header/src
Plug 'vim-scripts/a.vim', {'for': ['cpp', 'c']}

call plug#end()

" filetype plugin indent on
" filetype indent on


set noshowmode
set laststatus=2
let g:lightline = {
     \ 'colorscheme': 'solarized',
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
set foldmethod=expr
set foldlevel=99
let g:fastfold_savehook = 0
nmap zuz <Plug>(FastFoldUpdate)
" set nofoldenable
nnoremap <space> za

" General config
set term=xterm-256color
set encoding=utf-8
set number                      " line numbering
set printoptions=number:y
set clipboard=unnamed           
" set ai                          " Auto indent
" set si                          " Smart indent
set nowrap                      " Wrap lines
set lbr                         " Linebreak on 500 characters
" set cursorline                  " highlight current line
set backspace=indent,eol,start	
" set cindent
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
set bg=dark
" Fix gutter
autocmd ColorScheme * highlight! link SignColumn Normal
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

" De-activate arrowkeys
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
        command! -bang Vs vs<bang>
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
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>
nnoremap <Leader><Tab> :bd<CR>


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
" set expandtab
" set smarttab
" set shiftwidth=4
" set tabstop=4
" set softtabstop=4

" Allow per-project .vimrc
set exrc
set secure

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_modified = 'm'

let g:lsp_fold_enabled = 1
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
  augroup end
endif

" Latex LSP
if executable('texlab')
  augroup lsp_tex
    autocmd!
    au User lsp_setup call lsp#register_server({
          \ 'name': 'texlab',
          \ 'cmd': {server_info->['texlab']},
          \ 'config': {
          \     'hover_conceal': 0,
          \ },
          \ 'whitelist': ['bib','tex', 'sty'],
          \ })
  augroup end
endif

" Python LSP
" requires 'pip install python-language-server[all]'
if executable('pyls')
  augroup lsp_py
    autocmd!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python', 'python3'],
        \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
        \ })
  augroup end
endif

" Swift LSP
if executable('sourcekit-lsp')
  augroup lsp_swift
    autocmd!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
  augroup end
endif

" CMake, install with 'pip install cmake-language-server'
if executable('cmake-language-server')
  augroup lsp_cmake
    autocmd!
    au User lsp_setup call lsp#register_server({
        \ 'name': 'cmake-language-server',
        \ 'cmd': {server_info->['cmake-language-server']},
        \ 'whitelist': [ 'CMakeLists.txt', 'cmake' ],
        \ 'initialization_options': {
        \   'buildDirectory': 'build',
        \ }})
  augroup end
endif


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif

    set foldexpr=lsp#ui#vim#folding#foldexpr()
    set foldtext=lsp#ui#vim#folding#foldtext()

    " LSP shortcuts
    nnoremap <buffer><leader>g :LspDefinition<CR>
    nnoremap <buffer><leader>d :LspHover<CR>
    nnoremap <buffer><leader>r :LspNextDiagnostic<CR>
    nnoremap <buffer><leader>R :LspPreviousDiagnostic<CR>
    vnoremap <buffer><leader>f :LspDocumentRangeFormat<CR>
    nnoremap <buffer><leader>F :LspDocumentFormatSync<CR>
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END


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
let g:UltiSnipsListSnippets="<C-s>"
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))

let g:asyncomplete_auto_completeopt = 0
set completeopt=menuone,noinsert,noselect,preview

" Terminal within vim
nnoremap <leader>n :term<CR>
set termwinsize=15x0
" Make it open in the bottom
set splitbelow


"Gutter
sign define vimspectorBPDisabled text=\ ● texthl=Normal
highlight link LspWarningHighlight Normal
highlight LspWarningText ctermfg=3
" WarningMsg
highlight link LspErrorHighlight Error
highlight link LspErrorText Error
let g:lsp_diagnostics_signs_warning = {'text': '\ !'}
let g:lsp_diagnostics_signs_error = {'text': '\ ▶'}


" Alternate cpp header/implementation
autocmd FileType c,cpp nnoremap <leader>s :A<CR>


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

" set statusline+=%{NearestMethodOrFunction()}

" Debug layout
let g:termdebug_wide = 163

" Vimspector customization
func! s:CustomizeVimspectorUI()
  " Clear the existing WinBar created by Vimspector
  call win_gotoid( g:vimspector_session_windows.code )
  nunmenu WinBar
  call win_gotoid( g:vimspector_session_windows.variables )
  nunmenu WinBar
  call win_gotoid( g:vimspector_session_windows.watches )
  nunmenu WinBar
  call win_gotoid( g:vimspector_session_windows.stack_trace )
  nunmenu WinBar
  call win_gotoid( g:vimspector_session_windows.output )
  nunmenu WinBar
endfunction

" Debugging
nmap <leader>c <Plug>VimspectorContinue
nmap <leader>C <Plug>VimspectorStop
nmap <leader>x <Plug>VimspectorRestart
nmap <leader>X :call vimspector#Reset()<CR>
nmap <leader>b <Plug>VimspectorToggleBreakpoint
nmap <leader>B :call vimspector#ClearBreakpoints()<CR>


" Custom mappings while debuggins {{{
let s:mapped = {}
function! s:OnJumpToFrame() abort
  if has_key( s:mapped, string( bufnr() ) )
    return
  endif

  nmap <silent> <buffer> <leader>s <Plug>VimspectorStepOver
  nmap <silent> <buffer> <leader>s <Plug>VimspectorStepOver
  " nmap <silent> <buffer> <leader><leader>s vimspector#RunToCursor()<CR>
  nmap <silent> <buffer> <leader>S <Plug>VimspectorStepInto
  nmap <silent> <buffer> <leader>o <Plug>VimspectorStepOut
  nmap <silent> <buffer> <leader>di <Plug>VimspectorBalloonEval
  xmap <silent> <buffer> <leader>di <Plug>VimspectorBalloonEval

  let s:mapped[ string( bufnr() ) ] = { 'modifiable': &modifiable }

  setlocal nomodifiable

endfunction

function! s:OnDebugEnd() abort

  let original_buf = bufnr()
  let hidden = &hidden

  try
    set hidden
    for bufnr in keys( s:mapped )
      try
        execute 'noautocmd buffer' bufnr
        silent! nunmap <leader>s
        silent! nunmap <leader>S
        silent! nunmap <leader>o
        silent! nunmap <buffer> <leader>di
        silent! xunmap <buffer> <leader>di

        let &l:modifiable = s:mapped[ bufnr ][ 'modifiable' ]
      endtry
    endfor
  finally
    execute 'noautocmd buffer' original_buf
    let &hidden = hidden
  endtry

  let s:mapped = {}
endfunction

augroup TestCustomMappings
  au!
  autocmd User VimspectorJumpedToFrame call s:OnJumpToFrame()
  autocmd User VimspectorDebugEnded call s:OnDebugEnd()
augroup END


augroup MyVimspectorUICustomistaion
  autocmd!
  autocmd User VimspectorUICreated call s:CustomizeVimspectorUI()
augroup END

" Templates
if has("autocmd")
  augroup templates
    autocmd BufNewFile CMakeLists.txt 0r ~/.vim/templates/CMakeLists.txt
    autocmd BufNewFile .vimspector.json 0r ~/.vim/templates/vimspector.json
  augroup END
endif
