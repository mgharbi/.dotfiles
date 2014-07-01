" Parameters related to latex-suite
let g:tex_flavor='latex'
let g:Tex_MultipleCompileFormats='dvi,ps,pdf'
let g:Tex_FormatDependency_ps='dvi,ps'
let g:Tex_FormatDependency_pdf='dvi,ps,pdf'
let g:Tex_CompileRule_dvi = 'latex --interaction=nonstopmode $*'
let g:Tex_CompileRule_ps = 'dvips -Ppdf -o $*.ps $*.dvi'
let g:Tex_CompileRule_pdf = 'ps2pdf $*.ps'
let g:Tex_DefaultTargetFormat='pdf'
let TTarget='pdf'

let tlist_tex_settings = 'latex;l:labels;s:sections;t:subsections;u:subsubsections'
if has("autocmd")
    autocmd Filetype tex
        \set iskeyword=@,48-57,_,-,:,192-255
endif
