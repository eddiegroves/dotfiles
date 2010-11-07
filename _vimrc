" Date: 07/02/2010

" This basically enables vim
set nocompatible

" Fonts/Colour
set gfn=Consolas:h11:cDEFAULT
colorscheme molokai
let g:molokai_original=1

" Gui
set go=egt

" Editing
set expandtab
set softtabstop=4
set shiftwidth=4
set nowrap

" Kill sounds and visual bell 
set noerrorbells
set visualbell t_vb=

" Backups (write backup, but delete when done)
set nobk
set wb

" Not sure what this does?
au GUIEnter * simalt ~x

" There were taken from vimrc_example and seemed good
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set ruler		        " show the cursor position all the time
set incsearch
syntax on
set hlsearch
filetype plugin indent on
set mousehide		" Hide the mouse when typing text

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.php set filetype=php.html
  augroup END
endif
syntax on
