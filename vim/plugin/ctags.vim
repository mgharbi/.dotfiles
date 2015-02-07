" CTAGS stuff
set tags=./tags;
let g:easytags_dynamic_files=2
let g:easytags_include_members=1
let g:easytags_cmd = '/usr/local/bin/ctags --fields=+l'
let g:easytags_updatetime_warn=0
let g:easytags_python_enabled=1
let g:easytags_auto_highlight=0

" C++ specifics
if has('autocmd')
    autocmd Filetype cpp let g:easytags_cmd = '/usr/local/bin/ctags -R --c++-kinds=+p --fields=+iaSl --extra=+q'
endif

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
