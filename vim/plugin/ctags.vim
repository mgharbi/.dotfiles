" CTAGS stuff
set tags=./tags 
let g:easytags_python_enable = 1
let g:easytags_include_members=1
let g:easytags_dynamic_files = 2
let g:easytags_cmd = '/usr/local/bin/ctags --fields=+l'
let g:easytags_updatetime_warn=0
let g:easytags_python_enabled = 1
let g:easytags_by_filetype = '~/.tags'
let g:easytags_auto_highlight = 0

" C++ specifics
" if has('autocmd')
    autocmd Filetype cpp let g:easytags_cmd = '/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaSl --extra=+q'
" endif

" if has("autocmd") && exists("+omnifunc")
"     autocmd Filetype *
"         \if &omnifunc == "" |
"         \setlocal omnifunc=syntaxcomplete#Complete |
"         \endif
" endif
" Disable preview window
set completeopt=menuone,menu,longest


" Add custom tags
" set tags+=~/.tags/c_std
" set tags+=~/.tags/cpp_opencv

" Additional support
let g:tagbar_type_markdown = {
	\ 'ctagstype' : 'markdown',
	\ 'kinds' : [
		\ 'h:Heading_L1',
		\ 'i:Heading_L2',
		\ 'k:Heading_L3'
	\ ]
\ }

let g:tagbar_type_ruby = {
    \ 'kinds' : [
        \ 'm:modules',
        \ 'c:classes',
        \ 'd:describes',
        \ 'C:contexts',
        \ 'f:methods',
        \ 'F:singleton methods'
    \ ]
\ }
