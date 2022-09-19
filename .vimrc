" ensuring that vim-plugin is intalled
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" installing plugins
call plug#begin('~/.vim/plugged')
" vim plugin for fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'chr4/nginx.vim'
Plug 'vim-ruby/vim-ruby'
call plug#end()

set nocompatible

" editor settings
set ai									    " auto indenting
set smartindent
set sm											" matching braces

set lazyredraw							" redraw screen only when we need to
set showmatch								" highlight matching parenthesis

" meta settings
set encoding=utf-8

" editor appearance
syntax on
color darkspace

set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set textwidth=0
set wrapmargin=0        " number of characters from where wrapping starts
set fo=cq
set expandtab

" configuring syntax based on filetype
filetype indent on
autocmd BufNewFile,BufRead *.re set filetype=reason
autocmd BufNewFile,BufRead *.md setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.ml setlocal shiftwidth=4 softtabstop=4 expandtab

" search settings
set incsearch               " search as characters as entered
set hlsearch                " highlight matches

" highlight text when over text-length
" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
