'_vimrc', '.gitconfig', '.gitignore_global' | % {
    if (-not (Test-Path "$HOME$_")) {
        & cmd /c "mklink $HOME$_ $($HOME)dotfiles\$($_.TrimStart('.', '_'))"
    }
}