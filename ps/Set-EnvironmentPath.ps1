# Sets up path variable
param([switch]$WhatIf = $false)

# Add path to environment variable path
function Join-EnvPaths($path) {
    if (Test-Path $path) {
        $script:path += ";$path"
    }
}

# Add path relative to bin directory to environment variable path
function Join-PathToBinDir($path) {
    Join-EnvPaths (Join-Path $env:bin $path)
}

# Bin dir
$path += $env:bin

# Vim
Join-EnvPaths "${env:ProgramFiles(x86)}\vim\vim73"

# Beyond Compare 3
Join-PathToBinDir 'Beyond Compare 3'

# Svn
Join-PathToBinDir 'svn'

# Git
Join-PathToBinDir 'git\cmd'
Join-EnvPaths "$env:SystemDrive\tools\gittfs"
$env:GIT_SSH = "$env:bin\plink.exe"

# Mercurial
Join-PathToBinDir 'Mercurial'

# IIS
Join-EnvPaths "$env:SystemRoot\System32\inetsrv"

## Visual Studio ##
# vsdbcmd.exe
Join-EnvPaths "${env:ProgramFiles(x86)}\Microsoft Visual Studio 10.0\VSTSDB\Deploy"

# devenv
Join-EnvPaths "${env:ProgramFiles(x86)}\Microsoft Visual Studio 10.0\Common7\IDE"

# .NET Framework utils (msbuild)
Join-EnvPaths "$env:SystemRoot\Microsoft.NET\Framework\v4.0.30319\"

if ($WhatIf) {
    $path
} else {
    Write-Verbose "Environment: $path"
    $env:path += ";$path"
}
