" Python related
if has('autocmd')
    au Filetype python setl et ts=4 sw=4
    autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    
    " Scons syntax
    au BufReadPre SConstruct set filetype=python
    au BufReadPre SConscript set filetype=python

endif


" jedi plugin config
" let g:jedi#auto_vim_configuration = 0
" let g:jedi#popup_on_dot = 0
" let g:jedi#goto_command = ""
" let g:jedi#get_definition_command = ""
" let g:jedi#pydoc = "K"
" let g:jedi#rename_command = ""
" let g:jedi#related_names_command = ""
" let g:jedi#show_function_definition = "0"
