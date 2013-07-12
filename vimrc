" This basically enables vim
set nocompatible

filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'pangloss/vim-javascript'
Bundle 'altercation/vim-colors-solarized'
Bundle 'PProvost/vim-ps1'
Bundle 'scrooloose/nerdtree'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'tpope/vim-markdown'

" Snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/vim-snippets"
Bundle "garbas/vim-snipmate"

" Fonts/Colour
set gfn=Consolas:h11:cDEFAULT
colorscheme solarized

" Gui
set go=egt
set wildmenu " Adds sweet menu when tab completing in the command line

" Editing
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab
set nowrap

" Kill sounds and visual bell 
set noerrorbells
set novisualbell
set t_vb=

" Backups (write backup, but delete when done)
set nobk
set wb

" Encodings
set fileencodings=ucs-bom

" Not sure what this does?
au GUIEnter * simalt ~x

" There were taken from vimrc_example and seemed good
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set ruler		        " show the cursor position all the time
set incsearch
syntax on
filetype plugin indent on
set hlsearch
set mousehide		" Hide the mouse when typing text

if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.php set filetype=php.html
    autocmd BufRead,BufNewFile *.cshtml set filetype=html
  augroup END

  autocmd FileType html setlocal shiftwidth=2 tabstop=2
endif
syntax on
