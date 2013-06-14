if not exist _vimrc mklink _vimrc dotfiles\vimrc 
if not exist .gitignore_global mklink .gitignore_global dotfiles\gitignore_global 
if not exist .\Documents\WindowsPowerShell mklink /D .\Documents\WindowsPowerShell ..\dotfiles\ps
