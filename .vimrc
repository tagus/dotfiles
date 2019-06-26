set nocompatible

" editor settings
" set ai									  " auto indenting
set sm											" matching braces

set lazyredraw							" redraw screen only when we need to
set showmatch								" highlight matching parenthesis

" meta settings
set encoding=utf-8

" editor appearance
syntax on
color darkspectrum

set wrapmargin=8
set number
set expandtab
set tabstop=2
set textwidth=80

" configuring syntax
filetype on
autocmd BufNewFile,BufRead *.flex set filetype=jflex
autocmd BufNewFile,BufRead *.re set filetype=reason
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.cl set filetype=cool
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufNewFile,BufRead *.ts set filetype=typescript

" highlight text when over text-length
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
