" Cygwin settings
if has("win32unix")
  " Mintty tips https://code.google.com/p/mintty/wiki/Tips
  " Mode-dependent cursor and 
  let &t_SI.="\e[5 q"
  let &t_EI.="\e[1 q"
  let &t_ti.="\e[?7727h"
  let &t_te.="\e[?7727l"
  noremap <Esc>O[ <Esc>
  noremap! <Esc>O[ <C-c>
endif

" This basically enables vim
set nocompatible

filetype off

" Plugins https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

" Command line mode mappings
Plug 'vim-utils/vim-husk'

" Tomorrow Theme
Plug 'chriskempson/vim-tomorrow-theme/'

" Snippets
Plug 'mattn/emmet-vim'

" Better js
Plug 'pangloss/vim-javascript'

" Nerd Tree
Plug 'scrooloose/nerdtree'

call plug#end()

" Fonts/Colour
set gfn=Consolas:h12:cDEFAULT

" Gui
set go=egt
set wildmenu " Adds sweet menu when tab completing in the command line

if has("gui_running")
  colorscheme Tomorrow-Night
endif

" Editing
set expandtab
set softtabstop=4
set shiftwidth=4
set smarttab
set nowrap

" Window Navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Kill sounds and visual bell 
set noerrorbells
set novisualbell
set t_vb=

" Backups (write backup, but delete when done)
set nobk
set wb
set directory=$TEMP//

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
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
endif
syntax on
