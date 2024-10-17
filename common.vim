""" my vim settings """

set ai                " auto indenting
set smartindent       " additional indentations
set sm                " matching braces
set lazyredraw        " redraw screen only when we need to

syntax on             " enabled syntax highlighting

set showmatch					" highlight matching parenthesis
set encoding=utf-8    " set utf-8 encoding

set spell             " enables spell checking
set expandtab         " converts tabs to spaces
set shiftwidth=2      " specifies how many spaces to use for each indent step
set tabstop=2         " sets display width of tab characters
set number            " show line numbers of left edge
set softtabstop=2     " number of spaces shown for a tab

" search settings
set incsearch         " search as characters as entered
set hlsearch          " highlight matches

nmap <C-w> :w<CR>     " ctrl+w saves the file
vmap <CR> "+y         " enter will automatically copy selection to clipboard
nmap <C-o> :normal o  " add a new line below cursor without entering insert mode
