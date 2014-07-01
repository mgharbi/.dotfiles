autocmd BufEnter *.m    compiler mlint 
autocmd BufEnter *.m    map <M-n> :cnext<CR> 
autocmd BufEnter *.m    map <M-p> :cprevious<CR> 
