" Python related
if has('autocmd')
    au Filetype python setl et ts=4 sw=4
    autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
    
    " Scons syntax
    au BufReadPre SConstruct set filetype=python
    au BufReadPre SConscript set filetype=python
endif
