$VerbosePreference = 'Continue'
Write-Verbose 'Loading profile'

# PS dir
$psDir = Join-Path $env:userprofile dotfiles\ps

# Assumes PSCX has been installed or is in modules directory
Write-Verbose 'Import PSCX'
$VerbosePreference = 'SilentlyContinue'
Import-Module Pscx -arg (Join-Path $psDir Pscx.UserPreferences.ps1)
$VerbosePreference = 'Continue'

Write-Verbose 'Import Set-Utilities'
. (Join-Path $psDir Set-Utilities.ps1)

Write-Verbose 'Import Set-SessionVariables'
. (Join-Path $psDir Set-SessionVariables.ps1)

Write-Verbose 'Import Set-SessionAlias'
. (Join-Path $psDir Set-SessionAlias.ps1)

Write-Verbose 'Run Set-Shortcuts'
& (Join-Path $psDir Set-Shortcuts.ps1)

Write-Verbose 'Run Set-EnvironmentPath'
& (Join-Path $psDir Set-EnvironmentPath.ps1)

Write-Verbose 'Run Set-EnvironmentVariables'
& (Join-Path $psDir Set-EnvironmentVariables.ps1)

Write-Verbose 'Import Posh-Git'
Import-Module posh-git

# Set up a simple prompt, adding the git prompt parts inside git repos
function prompt {
    $realLASTEXITCODE = $LASTEXITCODE

    # Reset color, which can be messed up by Enable-GitColors
    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor

    Write-Host($pwd) -nonewline

    Write-VcsStatus

    $global:LASTEXITCODE = $realLASTEXITCODE
    return "`n> "
}

Enable-GitColors

$VerbosePreference = 'SilentlyContinue'
