# Set dotfiles here
$home_dir = '_vimrc', '.gitconfig', '.gitignore_global'
$bin_dir = @{ 'ConEmu.xml' = 'ConEmu' }

# --------------------------------------------------------
function Remove-NonSymLink([string]$path) {
    if (-not (Test-ReparsePoint $path)) {
        "$path is not a symlink, removing"
        Remove-Item $path -Confirm
    }
}

# Creates Windows symlinks for each dotfile manually specified
$home_dir | % {
    $path = "$HOME$_"
    Remove-NonSymLink($path)

    if (-not (Test-Path $path)) {
        & cmd /c "mklink $path $($HOME)dotfiles\$($_.TrimStart('.', '_'))"
    } else {
        "Skipping $_ as it already exists at $HOME$_"
    }
}

# Creates Windows symlinks for each setting file for the given path in the bin directory
if (Test-Path variable:global:bin) {
    $bin_dir.Keys | % { 
        $path = "$bin\$($bin_dir.$_)\$_"
        Remove-NonSymLink($path)

        if (-not (Test-Path $path)) {
            & cmd /c "mklink $path $($HOME)dotfiles\$_"
        } else {
            "Skipping $_ as it already exists at $path"
        }
    }
} else {
    "`$bin directory variable not set, where is it?"
}
