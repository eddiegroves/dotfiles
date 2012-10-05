# Creatse Windows symlinks for each dotfile manually specified
$home_dir = '_vimrc', '.gitconfig', '.gitignore_global'
$home_dir | % {
    if (-not (Test-Path "$HOME$_")) {
        & cmd /c "mklink $HOME$_ $($HOME)dotfiles\$($_.TrimStart('.', '_'))"
    } else {
        "Skipping $_ as it already exists at $HOME$_"
    }
}

$bin_dir = @{ 'ConEmu.xml' = 'ConEmu' }
if (Test-Path variable:global:bin) {
    $bin_dir.Keys | % { 
        $path = "$bin\$($bin_dir.$_)\$_"
        if (-not (Test-Path $path)) {
            & cmd /c "mklink $path $($HOME)dotfiles\$_"
        } else {
            "Skipping $_ as it already exists at $path"
        }
    }
} else {
    "`$bin directory variable not set, where is it?"
}
