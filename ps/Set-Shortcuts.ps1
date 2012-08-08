# Sets up start menu short cuts
param([switch]$WhatIf = $false)

$objShell = New-Object -ComObject ("WScript.Shell")

# Bin dir
$binDir = Join-Path $env:userprofile Dropbox\bin

function Set-Shortcut($name, $targetPath) {
    $path = Join-Paths $env:USERPROFILE, "\Start Menu\Programs\", "$name.lnk"

    if (-not(Test-Path $path)) {
        Write-Verbose "Creating shortcut $path targetting $targetPath"

        $objShortCut = $objShell.CreateShortcut($path)
        $objShortCut.TargetPath = Join-Path $script:binDir $targetPath
        $objShortCut.Description = $name
        $objShortCut.WorkingDirectory = $env:userProfile
        $objShortCut.Save()
    }
}

# Beyond Compare
Set-Shortcut 'Beyond Compare' 'Beyond Compare 3\BCompare.exe'

# Console
Set-Shortcut 'Console' 'Console2\Console.exe'

# Speed Commander
Set-Shortcut 'SpeedCommander' 'SpeedCommander 13\SpeedCommander.exe'

# Vim
Set-Shortcut 'Vim' 'Vim\vim73\gvim.exe'
Set-Shortcut 'GVim' 'Vim\vim73\gvim.exe'

# linqpad
Set-Shortcut 'Linqpad' 'linqpad.exe'
