<<<<<<< HEAD
param([switch]$WhatIf)

# Set dotfiles here
$home_dir = '_vimrc', '.gitconfig', '.gitignore_global'

function main {    
    # $HOME = Windows OS set home directory (where symlinks will go)
    # $env:my_home = My custom home directory (e.g C:\home, where dotfiles are)

    # Creates Windows symlinks for each dotfile manually specified
    Write-Host -ForegroundColor Green "Setting up dotfiles from $env:my_home to $HOME"
    $home_dir | % {
        $path = "$HOME\$_"
        Remove-NonSymLink($path)

        if (-not (Test-Path $path)) {
            $cmd = "mklink $path $($env:my_home)\dotfiles\$($_.TrimStart('.', '_'))"
            if ($WhatIf.IsPresent) {
                Write-Host "What if: $cmd"
            } else {
                & cmd /c $cmd
            }        
        
        } else {
            "Skipping $_ as it already exists at $path"
        }
    }

    # Setup Powershell
    Write-Host -ForegroundColor Green "Setting up Powershell"
    if (Test-Path $env:bin) {
      $ps = "$($HOME)\Documents\WindowsPowershell"

      if (-not (Test-Path $ps)) {
        if ($WhatIf.IsPresent) {
            $cmd = "mklink /d $ps $($env:my_home)\dotfiles\ps"
            Write-Host "What if: $cmd"
            $cmd ="mklink /d $($ps)\Modules $($env:bin)\ps\Modules"
            Write-Host "What if: $cmd"
        } else {    
            & cmd /c "mklink /d $ps $($env:my_home)\dotfiles\ps"
            & cmd /c "mklink /d $($ps)\Modules $($env:bin)\ps\Modules"
        }
      } else {
         "Skipping $ps as it already exists"
      }
    }

    # Setup vim for the first time
    Write-Host -ForegroundColor Green "Setting up vim for the first time"
    if ($WhatIf.IsPresent) {
        $cmd = "mkdir $HOME\.vim\bundle"
        Write-Host "What if: $cmd"        
        $cmd = "$env:bin\git\bin\git.exe clone https://github.com/gmarik/vundle.git $HOME\.vim\bundle\vundle"
        Write-Host "What if: $cmd"
    } else {
       mkdir "$HOME\.vim\bundle"
       & "$env:bin\git\bin\git.exe" clone "https://github.com/gmarik/vundle.git" "$HOME\.vim\bundle\vundle"
    }

    Write-Host "Don't forget to check core.autocrlf"
}

# Functions
function Remove-NonSymLink([string]$path) {
    function Test-ReparsePoint([string]$path) {
      $file = Get-Item $path -Force -ea 0
      return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
    }

    if ((Test-Path $path) -and (-not (Test-ReparsePoint $path))) {
        "$path is not a symlink, removing"
        Remove-Item $path -Confirm
    }
}

main
=======
# Set dotfiles here
$home_dir = '_vimrc', '.gitconfig', '.gitignore_global'
$bin_dir = @{ 'ConEmu.xml' = 'ConEmu' }

# --------------------------------------------------------
function Remove-NonSymLink([string]$path) {
    function Test-ReparsePoint([string]$path) {
      $file = Get-Item $path -Force -ea 0
      return [bool]($file.Attributes -band [IO.FileAttributes]::ReparsePoint)
    }

    if ((Test-Path $path) -and (-not (Test-ReparsePoint $path))) {
        "$path is not a symlink, removing"
        Remove-Item $path -Confirm
    }
}

# Creates Windows symlinks for each dotfile manually specified
$home_dir | % {
    $path = "$HOME\$_"
    Remove-NonSymLink($path)

    if (-not (Test-Path $path)) {
        & cmd /c "mklink $path $($HOME)\dotfiles\$($_.TrimStart('.', '_'))"
    } else {
        "Skipping $_ as it already exists at $path"
    }
}

# Creates Windows symlinks for each setting file for the given path in the bin directory
if (Test-Path $env:bin) {
    $bin_dir.Keys | % { 
        $path = "$env:bin\$($bin_dir.$_)\$_"
        Remove-NonSymLink($path)

        if (-not (Test-Path $path)) {
            & cmd /c "mklink $path $($HOME)\dotfiles\$_"
        } else {
            "Skipping $_ as it already exists at $path"
        }
    }
} else {
    "`$env:bin directory variable not set, where is it?"
}

# Setup Powershell
if (Test-Path $env:bin) {
  $ps = "$($HOME)\Documents\WindowsPowershell"

  if (-not (Test-Path $ps)) {
    & cmd /c "mklink /d $ps $($HOME)\dotfiles\ps"
    & cmd /c "mklink /d $($ps)\Modules $($env:bin)\ps\Modules"
  }
}
>>>>>>> 9a7027273f4338659afb91be3990441f82208d30
