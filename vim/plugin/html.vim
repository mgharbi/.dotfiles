" HTML closing tags
if has('autocmd')
    au FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
    au FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
endif
